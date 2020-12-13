Require Import VectorStates UnitaryOps Coq.btauto.Btauto RCIR.

Local Open Scope bccom_scope.
Local Open Scope nat_scope.

Definition fb_push b f : nat -> bool :=
  fun x => match x with
        | O => b
        | S n => f n
        end.

Definition allfalse := fun (_ : nat) => false.

Definition fb_push_n n f g : nat -> bool :=
  fun i => if (i <? n) then f i else g (i - n).

Fixpoint pos2fb p : nat -> bool :=
  match p with
  | xH => fb_push true allfalse
  | xI p' => fb_push true (pos2fb p')
  | xO p' => fb_push false (pos2fb p')
  end.

Definition N2fb n : nat -> bool :=
  match n with
  | 0%N => allfalse
  | Npos p => pos2fb p
  end.

Definition add_c b x y :=
  match b with
  | false => Pos.add x y
  | true => Pos.add_carry x y
  end.

Definition nat2fb n := N2fb (N.of_nat n).

Definition reg_push (x : nat) (n : nat) (f : nat -> bool) := fb_push_n n (nat2fb x) f.

Lemma fb_push_n_left :
  forall n x f g,
    x < n -> fb_push_n n f g x = f x.
Proof.
  intros. unfold fb_push_n. rewrite <- Nat.ltb_lt in H. rewrite H. easy.
Qed.

Lemma fb_push_n_right :
  forall n x f g,
    n <= x -> fb_push_n n f g x = g (x - n).
Proof.
  intros. unfold fb_push_n. rewrite <- Nat.ltb_ge in H. rewrite H. easy.
Qed.

Notation "'[' x ']_' n f" := (reg_push x n f) (at level 15, n at level 9, right associativity).
Notation "b ` f" := (fb_push b f) (at level 20, right associativity).

Definition majb a b c := (a && b) ⊕ (b && c) ⊕ (a && c).

Definition MAJ a b c := bccnot c b ; bccnot c a ; bcccnot a b c.
Definition UMA a b c := bcccnot a b c ; bccnot c a ; bccnot a b.

Lemma MAJ_eWF :
  forall a b c,
    a <> b -> b <> c -> a <> c ->
    eWF (MAJ c b a).
Proof.
  intros. unfold MAJ. constructor. constructor. 1-2 : apply bccnot_eWF; easy. apply bcccnot_eWF; lia.
Qed.

Lemma MAJ_correct :
  forall a b c f,
    a <> b -> b <> c -> a <> c ->
    bcexec (MAJ c b a) f = ((f[a |-> majb (f a) (f b) (f c)])
                              [b |-> (f b ⊕ f a)])[c |-> (f c ⊕ f a)].
Admitted. (*
(* The following proof works, but too slow. Admitted when debugging. *)
Proof.
  intros ? ? ? ? Hab' Hbc' Hac'. apply functional_extensionality; intro i. simpl.
  unfold update, majb. bnauto.
Qed.
*)

Lemma UMA_correct_partial :
  forall a b c f' fa fb fc,
    a <> b -> b <> c -> a <> c ->
    f' a = majb fa fb fc ->
    f' b = (fb ⊕ fa) -> f' c = (fc ⊕ fa) ->
    bcexec (UMA c b a) f' = ((f'[a |-> fa])[b |-> fa ⊕ fb ⊕ fc])[c |-> fc].
Admitted. (*
(* The following proof works, but too slow. Admitted when debugging. *)
Proof.
  unfold majb. intros. apply functional_extensionality; intro i. simpl.
  unfold update. bnauto_expand (f' a :: f' b :: f' c :: (List.nil)).
Qed.
*)

Fixpoint MAJseq' i n c0 : bccom :=
  match i with
  | 0 => MAJ c0 (2 + n) 2
  | S i' => MAJseq' i' n c0; MAJ (2 + i') (2 + n + i) (2 + i)
  end.
Definition MAJseq n := MAJseq' (n - 1) n 0.

Fixpoint UMAseq' i n c0 : bccom :=
  match i with
  | 0 => UMA c0 (2 + n) 2
  | S i' => UMA (2 + i') (2 + n + i) (2 + i); UMAseq' i' n c0
  end.
Definition UMAseq n := UMAseq' (n - 1) n 0.

Definition adder01 n : bccom := MAJseq n; UMAseq n.

Fixpoint carry b n f g :=
  match n with
  | 0 => b
  | S n' => let c := carry b n' f g in
           let a := f n' in
           let b := g n' in
           (a && b) ⊕ (b && c) ⊕ (a && c)
  end.

Lemma carry_sym :
  forall b n f g,
    carry b n f g = carry b n g f.
Proof.
  intros. induction n. reflexivity.
  simpl. rewrite IHn. btauto.
Qed.

Lemma carry_false_0_l: forall n f, 
    carry false n allfalse f = false.
Proof.
  unfold allfalse.
  induction n.
  simpl.
  reflexivity.
  intros. simpl.
  rewrite IHn. rewrite andb_false_r.
  reflexivity.
Qed.

Lemma carry_false_0_r: forall n f, 
    carry false n f allfalse = false.
Proof.
  unfold allfalse.
  induction n.
  simpl.
  reflexivity.
  intros. simpl.
  rewrite IHn. rewrite andb_false_r.
  reflexivity.
Qed.

Lemma carry_fbpush :
  forall n a ax ay fx fy,
    carry a (S n) (fb_push ax fx) (fb_push ay fy) = carry (majb a ax ay) n fx fy.
Proof.
  induction n; intros.
  simpl. unfold majb. btauto.
  remember (S n) as Sn. simpl. rewrite IHn. unfold fb_push. subst.
  simpl. easy.
Qed.

Lemma carry_succ :
  forall m p,
    carry true m (pos2fb p) allfalse = pos2fb (Pos.succ p) m ⊕ (pos2fb p) m.
Proof.
  induction m; intros. simpl. destruct p; reflexivity.
  replace allfalse with (fb_push false allfalse).
  2:{ unfold fb_push, allfalse. apply functional_extensionality. intros. destruct x; reflexivity.
  }
  Local Opaque fb_push carry.
  destruct p; simpl.
  rewrite carry_fbpush; unfold majb; simpl. rewrite IHm. reflexivity.
  rewrite carry_fbpush; unfold majb; simpl. rewrite carry_false_0_r. Local Transparent fb_push. simpl. btauto.
  rewrite carry_fbpush; unfold majb; simpl. Local Transparent carry. destruct m; reflexivity.
Qed.

Lemma carry_succ' :
  forall m p,
    carry true m allfalse (pos2fb p) = pos2fb (Pos.succ p) m ⊕ (pos2fb p) m.
Proof.
  intros. rewrite carry_sym. apply carry_succ.
Qed.

Lemma carry_succ0 :
  forall m, carry true m allfalse allfalse = pos2fb xH m.
Proof.
  induction m. easy. 
  replace allfalse with (fb_push false allfalse).
  2:{ unfold fb_push, allfalse. apply functional_extensionality. intros. destruct x; reflexivity.
  }
  rewrite carry_fbpush. unfold majb. simpl. rewrite carry_false_0_l. easy.
Qed.

Lemma carry_add_pos_eq :
  forall m b p q,
    carry b m (pos2fb p) (pos2fb q) ⊕ (pos2fb p) m ⊕ (pos2fb q) m = pos2fb (add_c b p q) m.
Proof.
  induction m; intros. simpl. destruct p, q, b; reflexivity.
  Local Opaque carry.
  destruct p, q, b; simpl; rewrite carry_fbpush; 
    try (rewrite IHm; reflexivity);
    try (unfold majb; simpl; 
         try rewrite carry_succ; try rewrite carry_succ'; 
         try rewrite carry_succ0; try rewrite carry_false_0_l;
         try rewrite carry_false_0_r;
         unfold allfalse; try btauto; try (destruct m; reflexivity)).
Qed.

Lemma carry_add_eq_carry0 :
  forall m x y,
    carry false m (N2fb x) (N2fb y) ⊕ (N2fb x) m ⊕ (N2fb y) m = (N2fb (x + y)) m.
Proof.
  intros.
  destruct x as [|p]; destruct y as [|q]; simpl; unfold allfalse.
  rewrite carry_false_0_l. easy.
  rewrite carry_false_0_l. btauto.
  rewrite carry_false_0_r. btauto.
  apply carry_add_pos_eq.
Qed.

Lemma carry_add_eq_carry1 :
  forall m x y,
    carry true m (N2fb x) (N2fb y) ⊕ (N2fb x) m ⊕ (N2fb y) m = (N2fb (x + y + 1)) m.
Proof.
  intros. 
  destruct x as [|p]; destruct y as [|q]; simpl; unfold allfalse.
  rewrite carry_succ0. destruct m; easy.
  rewrite carry_succ'. replace (q + 1)%positive with (Pos.succ q) by lia. btauto.
  rewrite carry_succ. replace (p + 1)%positive with (Pos.succ p) by lia. btauto.
  rewrite carry_add_pos_eq. unfold add_c. rewrite Pos.add_carry_spec. replace (p + q + 1)%positive with (Pos.succ (p + q)) by lia. easy.
Qed.

Lemma MAJseq'_efresh :
  forall i n j,
    0 < n ->
    j = 1   \/   2 + i < j < 2 + n   \/  2 + n + i < j ->
    efresh j (MAJseq' i n 0).
Admitted. (*
(* The following proof works, but too slow. Admitted when debugging. *)
Proof.
  induction i; intros. simpl. repeat (try constructor; try lia).
  simpl. repeat (try constructor; try apply IHi; try lia).
Qed.
*)

Lemma MAJseq'_eWF :
  forall i n,
    0 < n ->
    eWF (MAJseq' i n 0).
Proof.
  induction i; intros. simpl. apply MAJ_eWF; lia.
  simpl. constructor. apply IHi; easy. apply MAJ_eWF; lia.
Qed.

Definition fbxor f g := fun (i : nat) => f i ⊕ g i.

Definition msma i b f g := fun (x : nat) => if (x <? i) then (carry b (S x) f g ⊕ (f (S x))) else (if (x =? i) then carry b (S x) f g else f x).

Definition msmb i (b : bool) f g := fun (x : nat) => if (x <=? i) then (f x ⊕ g x) else g x.

Definition msmc i b f g := fun (x : nat) => if (x <=? i) then (f x ⊕ g x) else (carry b x f g ⊕ f x ⊕ g x).

Definition sumfb b f g := fun (x : nat) => carry b x f g ⊕ f x ⊕ g x.

Ltac fb_push_n_simpl := repeat (try rewrite fb_push_n_left by lia; try rewrite fb_push_n_right by lia).
Ltac update_simpl := repeat (try rewrite update_index_neq by lia); try rewrite update_index_eq by lia.

Ltac BreakIfExpression :=
  match goal with
  | [ |- context[if ?X <? ?Y then _ else _] ] => bdestruct (X <? Y); try lia
  | [ |- context[if ?X <=? ?Y then _ else _] ] => bdestruct (X <=? Y); try lia
  | [ |- context[if ?X =? ?Y then _ else _] ] => bdestruct (X =? Y); try lia
  end.

Ltac IfExpSimpl := repeat BreakIfExpression.

Lemma msm_eq1 :
  forall n i c f g,
    S i < n ->
    msma i c f g i ⊕ msma i c f g (S i) = msma (S i) c f g i.
Proof.
  intros. unfold msma. IfExpSimpl. easy.
Qed.

Lemma msm_eq2 :
  forall n i c f g,
    S i < n ->
    msmb i c f g (S i) ⊕ msma i c f g (S i) = msmb (S i) c f g (S i).
Proof.
  intros. unfold msma. unfold msmb. IfExpSimpl. btauto.
Qed.

Lemma msm_eq3 :
  forall n i c f g,
    S i < n ->
    majb (msma i c f g (S i)) (msmb i c f g (S i)) (msma i c f g i) = msma (S i) c f g (S i).
Proof.
  intros. unfold msma. unfold msmb. IfExpSimpl.
  simpl. unfold majb. easy.
Qed.

Local Opaque MAJ.
Lemma MAJseq'_correct :
  forall i n c f g h b1,
    0 < n -> i < n ->
    bcexec (MAJseq' i n 0) (c ` b1 ` fb_push_n n f (fb_push_n n g h)) = (c ⊕ (f 0)) ` b1 ` fb_push_n n (msma i c f g) (fb_push_n n (msmb i c f g) h).
Admitted. (*
(* The following proof works, but too slow. Admitted when debugging. *)
Proof.
  induction i; intros.
  - simpl. rewrite MAJ_correct by lia. simpl.
    fb_push_n_simpl. replace (n - n) with 0 by lia.
    apply functional_extensionality. intros.
    bdestruct (x =? 0). subst. simpl. update_simpl. easy.
    bdestruct (x =? 2 + n). subst. simpl. update_simpl. fb_push_n_simpl. replace (n - n) with 0 by lia. unfold msmb. bnauto.
    bdestruct (x =? 2). subst. simpl. update_simpl. fb_push_n_simpl. unfold msma. bnauto.
    update_simpl.
    destruct x. easy. simpl. destruct x. easy. simpl.
    bdestruct (x <? n). fb_push_n_simpl. unfold msma. bnauto.
    fb_push_n_simpl. symmetry. fb_push_n_simpl.
    bdestruct (x <? n + n). fb_push_n_simpl. unfold msmb. IfExpSimpl. easy.
    fb_push_n_simpl. easy.
  - simpl. rewrite IHi by lia. rewrite MAJ_correct by lia. simpl.
    fb_push_n_simpl. replace (n + S i - n) with (S i) by lia.
    apply functional_extensionality. intros.
    bdestruct (x =? 2 + i). subst. simpl. update_simpl. fb_push_n_simpl. apply msm_eq1 with (n := n). easy.
    bdestruct (x =? 2 + n + (1 + i)). subst. simpl. update_simpl. fb_push_n_simpl. replace (n + S i - n) with (S i) by lia. apply msm_eq2 with (n := n). easy.
    bdestruct (x =? 3 + i). subst. simpl. update_simpl. fb_push_n_simpl. apply msm_eq3 with (n := n). easy.
    update_simpl.
    destruct x. easy. destruct x. easy. simpl.
    bdestruct (x <? n). fb_push_n_simpl. unfold msma. IfExpSimpl. easy. easy.
    fb_push_n_simpl. symmetry. fb_push_n_simpl.
    bdestruct (x <? n + n). fb_push_n_simpl. unfold msmb. IfExpSimpl. easy. easy.
    fb_push_n_simpl. easy.
Qed.
*)

Local Opaque UMA.
Lemma UMAseq'_correct :
  forall i n c f g h b1,
    0 < n -> i < n ->
    bcexec (UMAseq' i n 0) ((c ⊕ (f 0)) ` b1 ` fb_push_n n (msma i c f g) (fb_push_n n (msmc i c f g) h)) = c ` b1 ` fb_push_n n f (fb_push_n n (sumfb c f g) h).
Admitted. (*
(* The following proof works, but too slow. Admitted when debugging. *)
Proof.
  induction i; intros.
  - simpl. rewrite UMA_correct_partial with (fa := f 0) (fb := g 0) (fc := carry c 0 f g). 2-4 : lia.
    apply functional_extensionality. intros.
    bdestruct (x =? 0). subst. simpl. update_simpl. easy.
    bdestruct (x =? 2 + n). subst. simpl. update_simpl. fb_push_n_simpl. replace (n - n) with 0 by lia. unfold sumfb. IfExpSimpl. simpl. btauto.
    bdestruct (x =? 2). subst. simpl. update_simpl. fb_push_n_simpl. easy.
    update_simpl.
    destruct x. easy. simpl. destruct x. easy. simpl.
    bdestruct (x <? n). fb_push_n_simpl. unfold msma. IfExpSimpl. easy.
    fb_push_n_simpl. symmetry. fb_push_n_simpl.
    bdestruct (x <? n + n). fb_push_n_simpl. unfold msmc, sumfb. IfExpSimpl. easy.
    fb_push_n_simpl. easy.
    simpl. fb_push_n_simpl. unfold msma. IfExpSimpl. simpl. unfold majb. btauto.
    simpl. fb_push_n_simpl. replace (n - n) with 0 by lia. unfold msmc. IfExpSimpl. btauto.
    simpl. easy.
  - simpl.
    replace (bcexec (UMA (S (S i)) (S (S (n + S i))) (S (S (S i)))) ((c ⊕ f 0) ` b1 ` fb_push_n n (msma (S i) c f g) (fb_push_n n (msmc (S i) c f g) h))) with (((c ⊕ f 0) ` b1 ` fb_push_n n (msma i c f g) (fb_push_n n (msmc i c f g) h))).
    2:{ rewrite UMA_correct_partial with (fa := f (S i)) (fb := g (S i)) (fc := carry c (S i) f g). 2-4 : lia.
        apply functional_extensionality. intros.
        bdestruct (x =? 2 + i). subst. simpl. update_simpl. fb_push_n_simpl. unfold msma. IfExpSimpl. easy.
        bdestruct (x =? 2 + n + (1 + i)). subst. simpl. update_simpl. fb_push_n_simpl. replace (n + S i - n) with (S i) by lia. unfold msmc. IfExpSimpl. simpl. btauto.
        bdestruct (x =? 3 + i). subst. simpl. update_simpl. simpl. fb_push_n_simpl. unfold msma. IfExpSimpl. easy.
        update_simpl.
        destruct x. easy. simpl. destruct x. easy. simpl.
        bdestruct (x <? n). fb_push_n_simpl. unfold msma. IfExpSimpl. easy. easy.
        fb_push_n_simpl. symmetry. fb_push_n_simpl.
        bdestruct (x <? n + n). fb_push_n_simpl. unfold msmc, sumfb. IfExpSimpl. easy. easy.
        fb_push_n_simpl. easy.
        simpl. fb_push_n_simpl. unfold msma. IfExpSimpl. simpl. unfold majb. btauto.
        simpl. fb_push_n_simpl. replace (n + S i - n) with (S i) by lia. unfold msmc. IfExpSimpl. btauto.
        simpl. fb_push_n_simpl. unfold msma. IfExpSimpl. easy.
    } 
    rewrite IHi by lia. easy.
Qed.
*)

Lemma adder01_correct_fb :
  forall n c f g h b1,
    0 < n ->
    bcexec (adder01 n) (c ` b1 ` fb_push_n n f (fb_push_n n g h)) = c ` b1 ` fb_push_n n f (fb_push_n n (sumfb c f g) h).
Proof.
  intros. unfold adder01. simpl. unfold MAJseq, UMAseq. rewrite MAJseq'_correct by lia.
  replace (fb_push_n n (msmb (n - 1) c f g) h ) with (fb_push_n n (msmc (n - 1) c f g) h).
  2:{ apply functional_extensionality. intros.
      bdestruct (x <? n). fb_push_n_simpl. unfold msmc, msmb. IfExpSimpl. easy.
      fb_push_n_simpl. easy.
  }
  apply UMAseq'_correct; lia.
Qed.

Lemma sumfb_correct_carry0 :
  forall x y,
    sumfb false (nat2fb x) (nat2fb y) = nat2fb (x + y).
Proof.
  intros. unfold nat2fb. rewrite Nnat.Nat2N.inj_add.
  apply functional_extensionality. intros. unfold sumfb. rewrite carry_add_eq_carry0. easy.
Qed.

Lemma sumfb_correct_carry1 :
  forall x y,
    sumfb true (nat2fb x) (nat2fb y) = nat2fb (x + y + 1).
Proof.
  intros. unfold nat2fb. do 2 rewrite Nnat.Nat2N.inj_add.
  apply functional_extensionality. intros. unfold sumfb. rewrite carry_add_eq_carry1. easy.
Qed.

Lemma sumfb_correct_N_carry0 :
  forall x y,
    sumfb false (N2fb x) (N2fb y) = N2fb (x + y).
Proof.
  intros. apply functional_extensionality. intros. unfold sumfb. rewrite carry_add_eq_carry0. easy.
Qed.

Lemma pos2fb_Postestbit :
  forall n i,
    (pos2fb n) i = Pos.testbit n (N.of_nat i).
Proof.
  induction n; intros.
  - destruct i; simpl. easy. rewrite IHn. destruct i; simpl. easy. rewrite Pos.pred_N_succ. easy.
  - destruct i; simpl. easy. rewrite IHn. destruct i; simpl. easy. rewrite Pos.pred_N_succ. easy.
  - destruct i; simpl. easy. easy.
Qed.

Lemma N2fb_Ntestbit :
  forall n i,
    (N2fb n) i = N.testbit n (N.of_nat i).
Proof.
  intros. destruct n. easy.
  simpl. apply pos2fb_Postestbit.
Qed.

Lemma Z2N_Nat2Z_Nat2N :
  forall x,
    Z.to_N (Z.of_nat x) = N.of_nat x.
Proof.
  destruct x; easy.
Qed.

Lemma Nofnat_mod :
  forall x y,
    y <> 0 ->
    N.of_nat (x mod y) = ((N.of_nat x) mod (N.of_nat y))%N.
Proof.
  intros. specialize (Zdiv.mod_Zmod x y H) as G.
  repeat rewrite <- Z2N_Nat2Z_Nat2N. rewrite G. rewrite Z2N.inj_mod; lia.
Qed.

Lemma Nofnat_pow :
  forall x y,
    N.of_nat (x ^ y) = ((N.of_nat x) ^ (N.of_nat y))%N.
Proof.
  intros. induction y. easy.
  Local Opaque N.pow. replace (N.of_nat (S y)) with ((N.of_nat y) + 1)%N by lia. simpl. rewrite N.pow_add_r. rewrite N.pow_1_r. rewrite Nnat.Nat2N.inj_mul. rewrite IHy. lia.
Qed.

Lemma reg_push_exceed :
  forall n x f,
    [x]_n f = [x mod 2^n]_n f.
Proof.
  intros. unfold reg_push. unfold nat2fb.
  apply functional_extensionality; intro i.
  bdestruct (i <? n). fb_push_n_simpl. rewrite Nofnat_mod. 2: apply Nat.pow_nonzero; lia.
  rewrite Nofnat_pow. simpl.
  do 2 rewrite N2fb_Ntestbit. rewrite N.mod_pow2_bits_low. easy. lia.
  fb_push_n_simpl. easy.
Qed.

Lemma adder01_correct_carry0 :
  forall n x y f b1,
    0 < n ->
    bcexec (adder01 n) (false ` b1 ` [x]_n [y]_n f) = (false ` b1 ` [x]_n [x + y]_n f).
Proof.
  intros. unfold reg_push. rewrite adder01_correct_fb by easy. rewrite sumfb_correct_carry0. easy.
Qed.

Lemma adder01_correct_carry1 :
  forall n x y f b1,
    0 < n ->
    bcexec (adder01 n) (true ` b1 ` [x]_n [y]_n f) = (true` b1 ` [x]_n [x + y + 1]_n f).
Proof.
  intros. unfold reg_push. rewrite adder01_correct_fb by easy. rewrite sumfb_correct_carry1. easy.
Qed.

Fixpoint swapper02' i n :=
  match i with
  | 0 => bcskip
  | S i' => swapper02' i' n; bcswap (2 + i') (2 + n + n + i')
  end.
Definition swapper02 n := swapper02' n n.

Definition swapma i (f g : nat -> bool) := fun x => if (x <? i) then g x else f x.
Definition swapmb i (f g : nat -> bool) := fun x => if (x <? i) then f x else g x.

Lemma swapma_gtn_invariant :
  forall n f g h,
    fb_push_n n (swapma n f g) h = fb_push_n n g h.
Proof.
  intros. apply functional_extensionality; intro.
  bdestruct (x <? n). fb_push_n_simpl. unfold swapma. IfExpSimpl. easy.
  fb_push_n_simpl. easy.
Qed.

Lemma swapmb_gtn_invariant :
  forall n f g h,
    fb_push_n n (swapmb n f g) h = fb_push_n n f h.
Proof.
  intros. apply functional_extensionality; intro.
  bdestruct (x <? n). fb_push_n_simpl. unfold swapmb. IfExpSimpl. easy.
  fb_push_n_simpl. easy.
Qed.

Local Opaque bcswap.
Lemma swapper02'_correct :
  forall i n f g h u b1 b2,
    0 < n ->
    i <= n ->
    bcexec (swapper02' i n) (b1 ` b2 ` fb_push_n n f (fb_push_n n g (fb_push_n n h u))) = b1 ` b2 ` fb_push_n n (swapma i f h) (fb_push_n n g (fb_push_n n (swapmb i f h) u)).
Proof.
  induction i; intros.
  - simpl.
    replace (swapma 0 f h) with f by (apply functional_extensionality; intro; IfExpSimpl; easy).
    replace (swapmb 0 f h) with h by (apply functional_extensionality; intro; IfExpSimpl; easy).
    easy.
  - simpl. rewrite IHi by lia.
    apply functional_extensionality; intro. rewrite bcswap_correct by lia.
    bdestruct (x =? S (S i)). subst. simpl. fb_push_n_simpl. unfold swapma, swapmb. IfExpSimpl. apply f_equal. lia.
    bdestruct (x =? S (S (n + n + i))). subst. simpl. fb_push_n_simpl. unfold swapma, swapmb. IfExpSimpl. apply f_equal. lia.
    destruct x. easy. simpl. destruct x. easy. simpl.
    bdestruct (x <? n). fb_push_n_simpl. unfold swapma. IfExpSimpl; easy.
    bdestruct (x <? n + n). fb_push_n_simpl. easy.
    bdestruct (x <? n + n + n). fb_push_n_simpl. unfold swapmb. IfExpSimpl; easy.
    fb_push_n_simpl. easy.
Qed.

Lemma swapper02_correct :
  forall n x y z f b0 b1,
    0 < n ->
    bcexec (swapper02 n) (b0 ` b1 ` [x]_n [y]_n [z]_n f) = b0 ` b1 ` [z]_n [y]_n [x]_n f.
Proof.
  intros. unfold reg_push, swapper02. rewrite swapper02'_correct by lia.
  rewrite swapma_gtn_invariant. rewrite swapmb_gtn_invariant. easy.
Qed.

Fixpoint negator0' i : bccom :=
  match i with
  | 0 => bcskip
  | S i' => negator0' i'; bcx (2 + i')
  end.
Definition negator0 n := negator0' n.

Lemma negator0'_eWF :
  forall i, eWF (negator0' i).
Proof.
  induction i. simpl. constructor. simpl. constructor. easy. constructor.
Qed.

Lemma negator0_eWF :
  forall n, eWF (negator0 n).
Proof.
  intros. unfold negator0. apply negator0'_eWF.
Qed.

Definition negatem i (f : nat -> bool) := fun (x : nat) => if (x <? i) then ¬ (f x) else f x.

Lemma negator0'_correct :
  forall i n f g b1 b2,
    0 < n ->
    i <= n ->
    bcexec (negator0' i) (b1 ` b2 ` fb_push_n n f g) = b1 ` b2 ` fb_push_n n (negatem i f) g.
Proof.
  induction i; intros.
  - simpl. replace (negatem 0 f) with f by (apply functional_extensionality; intro; IfExpSimpl; easy).
    easy.
  - simpl. rewrite IHi by lia. apply functional_extensionality; intro.
    bdestruct (x =? 2 + i). subst. simpl. update_simpl. fb_push_n_simpl. unfold negatem. IfExpSimpl. easy.
    update_simpl. destruct x. easy. simpl. destruct x. easy. simpl.
    bdestruct (x <? n). fb_push_n_simpl. unfold negatem. IfExpSimpl; easy.
    fb_push_n_simpl. easy.
Qed.

Lemma negatem_Nlnot :
  forall (n : nat) (x : N) i,
    negatem n (N2fb x) i = N.testbit (N.lnot x (N.of_nat n)) (N.of_nat i).
Proof.
  intros. unfold negatem. rewrite N2fb_Ntestbit. symmetry.
  bdestruct (i <? n). apply N.lnot_spec_low. lia.
  apply N.lnot_spec_high. lia.
Qed.

Lemma negatem_arith :
  forall n x,
    x < 2^n ->
    negatem n (nat2fb x) = nat2fb (2^n - 1 - x).
Proof.
  intros. unfold nat2fb. apply functional_extensionality; intro i.
  rewrite negatem_Nlnot. rewrite N2fb_Ntestbit.
  do 2 rewrite Nnat.Nat2N.inj_sub. rewrite Nofnat_pow. simpl.
  bdestruct (x =? 0). subst. simpl. rewrite N.ones_equiv. rewrite N.pred_sub. rewrite N.sub_0_r. easy.
  rewrite N.lnot_sub_low. rewrite N.ones_equiv. rewrite N.pred_sub. easy.
  apply N.log2_lt_pow2. assert (0 < x) by lia. lia.
  replace 2%N with (N.of_nat 2) by lia. rewrite <- Nofnat_pow. lia.
Qed.

Lemma negator0_correct :
  forall n x f b0 b1,
    0 < n ->
    x < 2^n ->
    bcexec (negator0 n) (b0 ` b1 ` [x]_n f) = b0 ` b1 ` [2^n - 1 - x]_n f.
Proof.
  intros. unfold negator0. unfold reg_push. rewrite negator0'_correct by lia. rewrite negatem_arith; easy.
Qed.

Opaque negator0.


Definition highb01 n : bccom := MAJseq n; bccnot (1 + n) 1; bcinv (MAJseq n).

Local Opaque bccnot.
Lemma highb01_eWF :
  forall n,
    0 < n ->
    eWF (highb01 n).
Proof.
  intros. unfold highb01. constructor. constructor. unfold MAJseq. apply MAJseq'_eWF. easy.
  apply bccnot_eWF. lia. apply eWF_bcinv. unfold MAJseq. apply MAJseq'_eWF. easy.
Qed.

Local Opaque bccnot.
Lemma highb01_correct :
  forall n b f g h,
    0 < n ->
    bcexec (highb01 n) (b ` false ` fb_push_n n f (fb_push_n n g h)) = b ` (carry b n f g) ` fb_push_n n f (fb_push_n n g h).
Proof.
  intros. unfold highb01. simpl. unfold MAJseq. rewrite MAJseq'_correct by lia.
  assert (forall u b0, bcexec (bccnot (S n) 1) (b0 ` false ` u) = b0 ` (u (n - 1)) ` u).
  { intros. rewrite bccnot_correct by lia. apply functional_extensionality; intro.
    bdestruct (x =? 1). subst. update_simpl. Local Opaque xorb. simpl.
    destruct n eqn:E. lia. simpl. rewrite Nat.sub_0_r. btauto.
    update_simpl. destruct x. easy. destruct x. lia. easy.
  }
  rewrite H0. fb_push_n_simpl.
  erewrite bcinv_reverse. 3: apply MAJseq'_correct; lia.
  unfold msma. IfExpSimpl. replace (S (n - 1)) with n by lia. easy.
  apply MAJseq'_eWF. easy.
Qed.

Opaque highb01.

Definition comparator01 n := (bcx 0; negator0 n); highb01 n; bcinv (bcx 0; negator0 n).

Lemma comparator01_eWF :
  forall n,
    0 < n ->
    eWF (comparator01 n).
Proof.
  intros. unfold comparator01. repeat constructor. apply negator0_eWF. apply highb01_eWF. easy. apply eWF_bcinv. apply negator0_eWF.
Qed.

Lemma negations_aux :
  forall n x f b,
    0 < n ->
    x < 2^n ->
    bcexec (bcx 0; negator0 n) (false ` b ` [x]_n f) = true ` b ` [2^n - 1 - x]_n f.
Proof.
  intros. simpl.
  assert ((false ` b ` [x ]_ n f) [0 |-> true] = true ` b ` [x]_n f).
  { apply functional_extensionality; intro i. destruct i; update_simpl; easy.
  }
  rewrite H1. apply negator0_correct; easy.
Qed.

Lemma pow2_predn :
  forall n x,
    x < 2^(n-1) -> x < 2^n.
Proof.
  intros. destruct n. simpl in *. lia.
  simpl in *. rewrite Nat.sub_0_r in H. lia.
Qed.

Lemma Ntestbit_lt_pow2n :
  forall x n,
    (x < 2^n)%N ->
    N.testbit x n = false.
Proof.
  intros. apply N.mod_small in H. rewrite <- H. apply N.mod_pow2_bits_high. lia.
Qed.

Lemma Ntestbit_in_pow2n_pow2Sn :
  forall x n,
    (2^n <= x < 2^(N.succ n))%N ->
    N.testbit x n = true.
Proof.
  intros. assert (N.log2 x = n) by (apply N.log2_unique; lia).
  rewrite <- H0. apply N.bit_log2.
  assert (2^n <> 0)%N by (apply N.pow_nonzero; easy).
  lia.
Qed.

Lemma carry_leb_equiv_true :
  forall n x y,
    0 < n ->
    x < 2^(n-1) ->
    y < 2^(n-1) ->
    x <= y ->
    carry true n (nat2fb (2^n - 1 - x)) (nat2fb y) = true.
Proof.
  intros. unfold nat2fb. specialize (carry_add_eq_carry1 n (N.of_nat (2 ^ n - 1 - x)) (N.of_nat y)) as G.
  do 2 apply xorb_move_l_r_2 in G. rewrite G.
  do 2 (pattern N2fb at 1; rewrite N2fb_Ntestbit).
  rewrite Ntestbit_lt_pow2n.
  2:{ replace 2%N with (N.of_nat 2) by easy. rewrite <- Nofnat_pow. apply pow2_predn in H1. lia.
  }
  rewrite Ntestbit_lt_pow2n.
  2:{ replace 2%N with (N.of_nat 2) by easy. rewrite <- Nofnat_pow.
      assert (0 < 2^n) by (apply pow_positive; easy). lia.
  }
  replace 1%N with (N.of_nat 1) by easy. do 2 rewrite <- Nnat.Nat2N.inj_add.
  rewrite N2fb_Ntestbit. rewrite Ntestbit_in_pow2n_pow2Sn. btauto.
  split.
  replace 2%N with (N.of_nat 2) by easy. rewrite <- Nofnat_pow.
  replace (2^n) with (2^(n-1) + 2^(n-1)). lia.
  destruct n. lia. simpl. rewrite Nat.sub_0_r. lia.
  rewrite <- Nnat.Nat2N.inj_succ.
  replace 2%N with (N.of_nat 2) by easy. rewrite <- Nofnat_pow.
  replace (2^(S n)) with (2^n + 2^n) by (simpl; lia).
  replace (2^n) with (2^(n-1) + 2^(n-1)). lia.
  destruct n. lia. simpl. rewrite Nat.sub_0_r. lia.
Qed.

Lemma carry_leb_equiv_false :
  forall n x y,
    0 < n ->
    x < 2^(n-1) ->
    y < 2^(n-1) ->
    x > y ->
    carry true n (nat2fb (2^n - 1 - x)) (nat2fb y) = false.
Proof.
  intros. unfold nat2fb. specialize (carry_add_eq_carry1 n (N.of_nat (2 ^ n - 1 - x)) (N.of_nat y)) as G.
  do 2 apply xorb_move_l_r_2 in G. rewrite G.
  do 2 (pattern N2fb at 1; rewrite N2fb_Ntestbit).
  rewrite Ntestbit_lt_pow2n.
  2:{ replace 2%N with (N.of_nat 2) by easy. rewrite <- Nofnat_pow. apply pow2_predn in H1. lia.
  }
  rewrite Ntestbit_lt_pow2n.
  2:{ replace 2%N with (N.of_nat 2) by easy. rewrite <- Nofnat_pow.
      assert (0 < 2^n) by (apply pow_positive; easy). lia.
  }
  replace 1%N with (N.of_nat 1) by easy. do 2 rewrite <- Nnat.Nat2N.inj_add.
  rewrite N2fb_Ntestbit. rewrite Ntestbit_lt_pow2n. btauto.
  replace 2%N with (N.of_nat 2) by easy. rewrite <- Nofnat_pow.
  replace (2^n) with (2^(n-1) + 2^(n-1)). lia.
  destruct n. lia. simpl. rewrite Nat.sub_0_r. lia.
Qed.

Lemma carry_leb_equiv :
  forall n x y,
    0 < n ->
    x < 2^(n-1) ->
    y < 2^(n-1) ->
    carry true n (nat2fb (2^n - 1 - x)) (nat2fb y) = (x <=? y).
Proof.
  intros. bdestruct (x <=? y). apply carry_leb_equiv_true; easy. apply carry_leb_equiv_false; easy.
Qed.

Lemma comparator01_correct :
  forall n x y f,
    0 < n ->
    x < 2^(n-1) ->
    y < 2^(n-1) ->
    bcexec (comparator01 n) (false ` false ` [x]_n [y]_n f) = (false ` (x <=? y) ` [x]_n [y]_n f).
Proof.
  intros. specialize (pow2_predn n x H0) as G0. specialize (pow2_predn n y H1) as G1.
  unfold comparator01. remember (bcx 0; negator0 n) as negations. simpl. subst.
  rewrite negations_aux by easy. unfold reg_push. rewrite highb01_correct by easy.
  erewrite bcinv_reverse. 3: apply negations_aux; easy. rewrite carry_leb_equiv by easy. easy.
  constructor. constructor. apply negator0_eWF.
Qed.

Definition subtractor01 n := (bcx 0; negator0 n); adder01 n; bcinv (bcx 0; negator0 n).

Local Opaque adder01.
Lemma subtractor01_correct :
  forall n x y b1 f,
    0 < n ->
    x < 2^(n-1) ->
    y < 2^(n-1) ->
    bcexec (subtractor01 n) (false ` b1 ` [x]_n [y]_n f) = (false ` b1 ` [x]_n [y + 2^n - x]_n f).
Proof.
  intros. specialize (pow2_predn n x H0) as G0. specialize (pow2_predn n y H1) as G1.
  unfold subtractor01. remember (bcx 0; negator0 n) as negations. simpl. subst.
  rewrite negations_aux by easy. rewrite adder01_correct_carry1 by easy.
  erewrite bcinv_reverse. 3: apply negations_aux; easy.
  replace (2^n) with (2^(n-1) + 2^(n-1)).
  replace (2 ^ (n - 1) + 2 ^ (n - 1) - 1 - x + y + 1) with (y + (2 ^ (n - 1) + 2 ^ (n - 1)) - x) by lia.
  easy. destruct n. lia. simpl. rewrite Nat.sub_0_r. lia.
  constructor. constructor. apply negator0_eWF.
Qed.

Definition modadder21 n := swapper02 n; adder01 n; swapper02 n; 
       comparator01 n; (bccont 1 (subtractor01 n); bcx 1); swapper02 n; bcinv (comparator01 n); swapper02 n.

Lemma mod_sum_lt :
  forall x y M,
    x < M ->
    y < M ->
    (x + y) mod M < x <-> x + y >= M.
Proof.
  intros. split; intros.
  - assert ((x + y) mod M < x + y) by lia.
    rewrite Nat.div_mod with (y := M) in H2 by lia.
    assert (0 < (x + y) / M) by nia.
    rewrite Nat.div_str_pos_iff in H3 by lia. lia.
  - rewrite Nat.mod_eq by lia.
    assert (1 <= (x + y) / M < 2).
    { split.
      apply Nat.div_le_lower_bound; lia.
      apply Nat.div_lt_upper_bound; lia.
    }
    replace (M * ((x + y) / M)) with M by nia.
    lia.
Qed.

Lemma mod_sum_lt_bool :
  forall x y M,
    x < M ->
    y < M ->
    ¬ (M <=? x + y) = (x <=? (x + y) mod M).
Proof.
  intros. bdestruct (M <=? x + y); bdestruct (x <=? (x + y) mod M); try easy.
  assert ((x + y) mod M < x) by (apply mod_sum_lt; lia). lia.
  assert (x + y >= M) by (apply mod_sum_lt; lia). lia.
Qed.

Local Opaque swapper02 adder01 comparator01 subtractor01.
Lemma modadder21_correct :
  forall n x y M f,
    1 < n ->
    x < M ->
    y < M ->
    M < 2^(n-2) ->
    bcexec (modadder21 n) (false ` false ` [M]_n [y]_n [x]_n f) = false ` false ` [M]_n [(x + y) mod M]_n [x]_n  f.
Proof.
  intros.
  assert (M < 2^(n-1)).
  { apply pow2_predn. replace (n - 1 - 1) with (n - 2) by lia. easy.
  }
  assert (x + y < 2^(n-1)).
  { replace (2^(n-1)) with (2^(n-2) + 2^(n-2)). lia.
    destruct n. lia. destruct n. lia. simpl. rewrite Nat.sub_0_r. lia.
  }
  unfold modadder21. remember (bccont 1 (subtractor01 n); bcx 1) as csub01. simpl. subst.
  rewrite swapper02_correct by lia. rewrite adder01_correct_carry0 by lia.
  rewrite swapper02_correct by lia. rewrite comparator01_correct by lia.
  replace (bcexec (bccont 1 (subtractor01 n); bcx 1) (false ` (M <=? x + y) ` [M ]_ n [x + y ]_ n [x ]_ n f)) with (false ` ¬ (M <=? x + y) ` [M ]_ n [(x + y) mod M]_ n [x ]_ n f).
  2:{ simpl. bdestruct (M <=? x + y).
      - rewrite subtractor01_correct by lia.
        replace (x + y + 2^n - M) with (x + y - M + 2^n) by lia.
        rewrite reg_push_exceed with (x := x + y - M + 2 ^ n).
        assert (2^n <> 0) by (apply Nat.pow_nonzero; easy).
        rewrite <- Nat.add_mod_idemp_r with (a := x + y - M) by easy.
        rewrite Nat.mod_same by easy.
        rewrite Nat.add_0_r. rewrite <- reg_push_exceed.
        rewrite Nat.mod_eq by lia.
        assert (x + y < 2 * M) by lia.
        assert ((x + y) / M < 2) by (apply Nat.div_lt_upper_bound; lia).
        assert (1 <= (x + y) / M) by (apply Nat.div_le_lower_bound; lia).
        assert ((x + y) / M = 1) by lia.
        replace (x + y - M * ((x + y) / M)) with (x + y - M) by lia.
        apply functional_extensionality; intro i.
        destruct i. easy. destruct i. simpl. update_simpl. easy. update_simpl. easy.
      - rewrite Nat.mod_small by lia. 
        apply functional_extensionality; intro i.
        destruct i. easy. destruct i. simpl. update_simpl. easy. update_simpl. easy.
  }
  rewrite swapper02_correct by lia. erewrite bcinv_reverse.
  3:{ assert ((x + y) mod M < M) by (apply Nat.mod_upper_bound; lia).
      rewrite mod_sum_lt_bool by easy. rewrite comparator01_correct. reflexivity.
      1-3 : lia.
  }
  rewrite swapper02_correct by lia. easy.
  apply comparator01_eWF. lia.
Qed.








Fixpoint copier21' i n :=
  match i with
  | 0 => bcskip
  | S i' => bccnot (2 + 2 * n + i') (2 + n + i')
  end.
Definition copier21 n := copier21' n n.

Lemma copier21_correct :
  forall n x M f,
    0 < n ->
    bcexec (copier21 n) (false ` false ` [M]_n [0]_n [x]_n f) = false ` false ` [M]_n [x]_n [x]_n f.
Admitted.

Fixpoint swapperin' j i n :=
  match j with
  | 0 => bcskip
  | S j' => bcswap (2 + i * n + j') (2 + n * n + j'); swapperin' j' i n
  end.
Definition swapperin i n := swapperin' n i n.
  
Fixpoint rotator' i n :=
  match i with
  | 0 => bcskip
  | S i' => swapperin i n; rotator' i' n
  end.
Definition rotator n := rotator' (n - 1) n.

Fixpoint regl_push (l : list nat) n f :=
  match l with
  | List.nil => f
  | x :: l' => [x]_n (regl_push l' n f)
  end.

Definition list_rotate {A} (l : list A) :=
  match rev l with
  | List.nil => l
  | a :: l' => rev l' ++ (a :: List.nil)
  end.

Lemma rotator_correct :
  forall n l M f,
    0 < n ->
    length l = n ->
    bcexec (rotator n) (false ` false ` [M]_n (regl_push l n f)) = false ` false ` [M]_n (regl_push (list_rotate l) n f).
Admitted.

Fixpoint powertower (n x M : nat) :=
  match n with
  | 0 => List.nil
  | S n' => (2^n' * x mod M) :: powertower n' x M
  end.

Fixpoint towerbuilder' i n :=
  match i with
  | 0 => bcskip
  | S i' => towerbuilder' i' n; rotator n; copier21 n; modadder21 n
  end.
Definition towerbuilder n := towerbuilder' (n - 1) n.

Lemma towerbuilder_correct :
  forall n x M f,
    0 < n ->
    x < M < 2^(n - 1) ->
    bcexec (towerbuilder n) (false ` false ` [M]_n [x]_n (regl_push (repeat 0 (n - 1)) n f))
                = false ` false ` [M]_n (regl_push (powertower n x M) n f).
Admitted.

Fixpoint swapper1C' j n :=
  match j with
  | 0 => bcskip
  | S j' => bcswap (2 + n + j') (2 + (n + 1) * n + j'); swapper1C' j' n
  end.
Fixpoint swapper1C n := swapper1C' n n.

Lemma swapper1C_correct :
  forall n l M x y f,
    0 < n ->
    length l = n - 1 ->
    bcexec (swapper1C n) (false ` false ` [M]_n [x]_n (regl_push l n ([y]_n f)))
                 = false ` false ` [M]_n [y]_n (regl_push l n ([x]_n f)).
Admitted.

Fixpoint calcmodmult' i n (f : nat -> bool) :=
  match i with
  | 0 => bcskip
  | S i' => calcmodmult' i' n f; rotator n; if (f i') then (swapper1C n; modadder21 n; swapper1C n) else bcskip
  end.
Definition calcmodmult C n := rotator n; calcmodmult' n n (N2fb (N.of_nat C)); bcinv (rotator n).

Lemma calcmodmult_correct :
  forall n M x C f,
    0 < n ->
    x < M ->
    C < M ->
    M < 2^(n-1) ->
    bcexec (calcmodmult C n) (false ` false ` [M]_n (regl_push (powertower x n M) n ([0]_n f)))
             = (false ` false ` [M]_n (regl_push (powertower x n M) n ([C * x mod M]_n f))).
Admitted.

Definition calcmodmult_half C n := towerbuilder n; calcmodmult C n; bcinv (towerbuilder n).

Lemma calcmodmult_half_correct :
  forall n M x C,
    0 < n ->
    x < M ->
    C < M ->
    M < 2^(n-1) ->
    bcexec (calcmodmult_half C n) (false ` false ` [M]_n [x]_n allfalse)
              = false ` false ` [M]_n [x]_n (regl_push (repeat 0 (n - 1)) n ([C * x mod M]_n allfalse)).
Admitted.

Definition calcmodmult_full C Cinv n := calcmodmult_half C n; swapper1C n; bcinv (calcmodmult_half Cinv n).

Lemma calcmodmult_full_correct :
  forall n M x C Cinv,
    0 < n ->
    x < M ->
    C < M ->
    Cinv < M ->
    C * Cinv mod M = 1 ->
    M < 2^(n-1) ->
    bcexec (calcmodmult_full C Cinv n) (false ` false ` [M]_n [x]_n allfalse)
                   = false ` false ` [M]_n [C * x mod M]_n allfalse.
Admitted.

(* head and register 1 *)
Fixpoint swapperh1' j n :=
  match j with
  | 0 => bcskip
  | S j' => bcswap j' (2 + n + j'); swapperh1' j' n
  end.
Definition swapperh1 n := swapperh1' n n.

Lemma swapperh1_correct :
  forall n x,
    0 < n ->
    x < 2^n ->
    bcexec (swapperh1 n) ([x]_n allfalse) = false ` false ` [0]_n [x]_n allfalse.
Admitted.


Fixpoint genM0' i (f : nat -> bool) : bccom :=
  match i with
  | 0 => bcskip
  | S i' => genM0' i' f; if (f i') then bcx (2 + i') else bcskip
  end.
Definition genM0 M n := genM0' n (N2fb (N.of_nat M)).

Lemma genM0_correct :
  forall n M f b0 b1,
    M <= 2^(n-1) ->
    bcexec (genM0 M n) (b0 ` b1 ` [0]_n f) = b0 ` b1 ` [M]_n f.
Admitted.

Definition modmult M C Cinv n := swapperh1 n; genM0 M n; calcmodmult_full C Cinv n; bcinv (swapperh1 n; genM0 M n).

Lemma modmult_correct :
  forall n x M C Cinv,
    0 < n ->
    x < M ->
    C < M ->
    Cinv < M ->
    C * Cinv mod M = 1 ->
    M < 2^(n-1) ->
    bcexec (modmult M C Cinv n) ([x]_n allfalse) = [C * x mod M]_n allfalse.
Admitted.    
