OPENQASM 2.0;
include "qelib1.inc";
qreg q[32];
h q[16];
cx q[17], q[16];
rzq(-1,4) q[16];
cx q[17], q[16];
rzq(1,4) q[16];
rzq(1,4) q[17];
h q[17];
cx q[18], q[16];
rzq(-1,8) q[16];
cx q[18], q[16];
rzq(1,8) q[16];
rzq(1,8) q[18];
cx q[18], q[17];
rzq(-1,4) q[17];
cx q[18], q[17];
rzq(1,4) q[17];
rzq(1,4) q[18];
h q[18];
cx q[19], q[16];
rzq(-1,16) q[16];
cx q[19], q[16];
rzq(1,16) q[16];
rzq(1,16) q[19];
cx q[19], q[17];
rzq(-1,8) q[17];
cx q[19], q[17];
rzq(1,8) q[17];
rzq(1,8) q[19];
cx q[19], q[18];
rzq(-1,4) q[18];
cx q[19], q[18];
rzq(1,4) q[18];
rzq(1,4) q[19];
h q[19];
cx q[20], q[16];
rzq(-1,32) q[16];
cx q[20], q[16];
rzq(1,32) q[16];
rzq(1,32) q[20];
cx q[20], q[17];
rzq(-1,16) q[17];
cx q[20], q[17];
rzq(1,16) q[17];
rzq(1,16) q[20];
cx q[20], q[18];
rzq(-1,8) q[18];
cx q[20], q[18];
rzq(1,8) q[18];
rzq(1,8) q[20];
cx q[20], q[19];
rzq(-1,4) q[19];
cx q[20], q[19];
rzq(1,4) q[19];
rzq(1,4) q[20];
h q[20];
cx q[21], q[16];
rzq(-1,64) q[16];
cx q[21], q[16];
rzq(1,64) q[16];
rzq(1,64) q[21];
cx q[21], q[17];
rzq(-1,32) q[17];
cx q[21], q[17];
rzq(1,32) q[17];
rzq(1,32) q[21];
cx q[21], q[18];
rzq(-1,16) q[18];
cx q[21], q[18];
rzq(1,16) q[18];
rzq(1,16) q[21];
cx q[21], q[19];
rzq(-1,8) q[19];
cx q[21], q[19];
rzq(1,8) q[19];
rzq(1,8) q[21];
cx q[21], q[20];
rzq(-1,4) q[20];
cx q[21], q[20];
rzq(1,4) q[20];
rzq(1,4) q[21];
h q[21];
cx q[22], q[16];
rzq(-1,128) q[16];
cx q[22], q[16];
rzq(1,128) q[16];
rzq(1,128) q[22];
cx q[22], q[17];
rzq(-1,64) q[17];
cx q[22], q[17];
rzq(1,64) q[17];
rzq(1,64) q[22];
cx q[22], q[18];
rzq(-1,32) q[18];
cx q[22], q[18];
rzq(1,32) q[18];
rzq(1,32) q[22];
cx q[22], q[19];
rzq(-1,16) q[19];
cx q[22], q[19];
rzq(1,16) q[19];
rzq(1,16) q[22];
cx q[22], q[20];
rzq(-1,8) q[20];
cx q[22], q[20];
rzq(1,8) q[20];
rzq(1,8) q[22];
cx q[22], q[21];
rzq(-1,4) q[21];
cx q[22], q[21];
rzq(1,4) q[21];
rzq(1,4) q[22];
h q[22];
cx q[23], q[16];
rzq(-1,256) q[16];
cx q[23], q[16];
rzq(1,256) q[16];
rzq(1,256) q[23];
cx q[23], q[17];
rzq(-1,128) q[17];
cx q[23], q[17];
rzq(1,128) q[17];
rzq(1,128) q[23];
cx q[23], q[18];
rzq(-1,64) q[18];
cx q[23], q[18];
rzq(1,64) q[18];
rzq(1,64) q[23];
cx q[23], q[19];
rzq(-1,32) q[19];
cx q[23], q[19];
rzq(1,32) q[19];
rzq(1,32) q[23];
cx q[23], q[20];
rzq(-1,16) q[20];
cx q[23], q[20];
rzq(1,16) q[20];
rzq(1,16) q[23];
cx q[23], q[21];
rzq(-1,8) q[21];
cx q[23], q[21];
rzq(1,8) q[21];
rzq(1,8) q[23];
cx q[23], q[22];
rzq(-1,4) q[22];
cx q[23], q[22];
rzq(1,4) q[22];
rzq(1,4) q[23];
h q[23];
cx q[24], q[16];
rzq(-1,512) q[16];
cx q[24], q[16];
rzq(1,512) q[16];
rzq(1,512) q[24];
cx q[24], q[17];
rzq(-1,256) q[17];
cx q[24], q[17];
rzq(1,256) q[17];
rzq(1,256) q[24];
cx q[24], q[18];
rzq(-1,128) q[18];
cx q[24], q[18];
rzq(1,128) q[18];
rzq(1,128) q[24];
cx q[24], q[19];
rzq(-1,64) q[19];
cx q[24], q[19];
rzq(1,64) q[19];
rzq(1,64) q[24];
cx q[24], q[20];
rzq(-1,32) q[20];
cx q[24], q[20];
rzq(1,32) q[20];
rzq(1,32) q[24];
cx q[24], q[21];
rzq(-1,16) q[21];
cx q[24], q[21];
rzq(1,16) q[21];
rzq(1,16) q[24];
cx q[24], q[22];
rzq(-1,8) q[22];
cx q[24], q[22];
rzq(1,8) q[22];
rzq(1,8) q[24];
cx q[24], q[23];
rzq(-1,4) q[23];
cx q[24], q[23];
rzq(1,4) q[23];
rzq(1,4) q[24];
h q[24];
cx q[25], q[16];
rzq(-1,1024) q[16];
cx q[25], q[16];
rzq(1,1024) q[16];
rzq(1,1024) q[25];
cx q[25], q[17];
rzq(-1,512) q[17];
cx q[25], q[17];
rzq(1,512) q[17];
rzq(1,512) q[25];
cx q[25], q[18];
rzq(-1,256) q[18];
cx q[25], q[18];
rzq(1,256) q[18];
rzq(1,256) q[25];
cx q[25], q[19];
rzq(-1,128) q[19];
cx q[25], q[19];
rzq(1,128) q[19];
rzq(1,128) q[25];
cx q[25], q[20];
rzq(-1,64) q[20];
cx q[25], q[20];
rzq(1,64) q[20];
rzq(1,64) q[25];
cx q[25], q[21];
rzq(-1,32) q[21];
cx q[25], q[21];
rzq(1,32) q[21];
rzq(1,32) q[25];
cx q[25], q[22];
rzq(-1,16) q[22];
cx q[25], q[22];
rzq(1,16) q[22];
rzq(1,16) q[25];
cx q[25], q[23];
rzq(-1,8) q[23];
cx q[25], q[23];
rzq(1,8) q[23];
rzq(1,8) q[25];
cx q[25], q[24];
rzq(-1,4) q[24];
cx q[25], q[24];
rzq(1,4) q[24];
rzq(1,4) q[25];
h q[25];
cx q[26], q[16];
rzq(-1,2048) q[16];
cx q[26], q[16];
rzq(1,2048) q[16];
rzq(1,2048) q[26];
cx q[26], q[17];
rzq(-1,1024) q[17];
cx q[26], q[17];
rzq(1,1024) q[17];
rzq(1,1024) q[26];
cx q[26], q[18];
rzq(-1,512) q[18];
cx q[26], q[18];
rzq(1,512) q[18];
rzq(1,512) q[26];
cx q[26], q[19];
rzq(-1,256) q[19];
cx q[26], q[19];
rzq(1,256) q[19];
rzq(1,256) q[26];
cx q[26], q[20];
rzq(-1,128) q[20];
cx q[26], q[20];
rzq(1,128) q[20];
rzq(1,128) q[26];
cx q[26], q[21];
rzq(-1,64) q[21];
cx q[26], q[21];
rzq(1,64) q[21];
rzq(1,64) q[26];
cx q[26], q[22];
rzq(-1,32) q[22];
cx q[26], q[22];
rzq(1,32) q[22];
rzq(1,32) q[26];
cx q[26], q[23];
rzq(-1,16) q[23];
cx q[26], q[23];
rzq(1,16) q[23];
rzq(1,16) q[26];
cx q[26], q[24];
rzq(-1,8) q[24];
cx q[26], q[24];
rzq(1,8) q[24];
rzq(1,8) q[26];
cx q[26], q[25];
rzq(-1,4) q[25];
cx q[26], q[25];
rzq(1,4) q[25];
rzq(1,4) q[26];
h q[26];
cx q[27], q[16];
rzq(-1,4096) q[16];
cx q[27], q[16];
rzq(1,4096) q[16];
rzq(1,4096) q[27];
cx q[27], q[17];
rzq(-1,2048) q[17];
cx q[27], q[17];
rzq(1,2048) q[17];
rzq(1,2048) q[27];
cx q[27], q[18];
rzq(-1,1024) q[18];
cx q[27], q[18];
rzq(1,1024) q[18];
rzq(1,1024) q[27];
cx q[27], q[19];
rzq(-1,512) q[19];
cx q[27], q[19];
rzq(1,512) q[19];
rzq(1,512) q[27];
cx q[27], q[20];
rzq(-1,256) q[20];
cx q[27], q[20];
rzq(1,256) q[20];
rzq(1,256) q[27];
cx q[27], q[21];
rzq(-1,128) q[21];
cx q[27], q[21];
rzq(1,128) q[21];
rzq(1,128) q[27];
cx q[27], q[22];
rzq(-1,64) q[22];
cx q[27], q[22];
rzq(1,64) q[22];
rzq(1,64) q[27];
cx q[27], q[23];
rzq(-1,32) q[23];
cx q[27], q[23];
rzq(1,32) q[23];
rzq(1,32) q[27];
cx q[27], q[24];
rzq(-1,16) q[24];
cx q[27], q[24];
rzq(1,16) q[24];
rzq(1,16) q[27];
cx q[27], q[25];
rzq(-1,8) q[25];
cx q[27], q[25];
rzq(1,8) q[25];
rzq(1,8) q[27];
cx q[27], q[26];
rzq(-1,4) q[26];
cx q[27], q[26];
rzq(1,4) q[26];
rzq(1,4) q[27];
h q[27];
cx q[28], q[16];
rzq(-1,8192) q[16];
cx q[28], q[16];
rzq(1,8192) q[16];
rzq(1,8192) q[28];
cx q[28], q[17];
rzq(-1,4096) q[17];
cx q[28], q[17];
rzq(1,4096) q[17];
rzq(1,4096) q[28];
cx q[28], q[18];
rzq(-1,2048) q[18];
cx q[28], q[18];
rzq(1,2048) q[18];
rzq(1,2048) q[28];
cx q[28], q[19];
rzq(-1,1024) q[19];
cx q[28], q[19];
rzq(1,1024) q[19];
rzq(1,1024) q[28];
cx q[28], q[20];
rzq(-1,512) q[20];
cx q[28], q[20];
rzq(1,512) q[20];
rzq(1,512) q[28];
cx q[28], q[21];
rzq(-1,256) q[21];
cx q[28], q[21];
rzq(1,256) q[21];
rzq(1,256) q[28];
cx q[28], q[22];
rzq(-1,128) q[22];
cx q[28], q[22];
rzq(1,128) q[22];
rzq(1,128) q[28];
cx q[28], q[23];
rzq(-1,64) q[23];
cx q[28], q[23];
rzq(1,64) q[23];
rzq(1,64) q[28];
cx q[28], q[24];
rzq(-1,32) q[24];
cx q[28], q[24];
rzq(1,32) q[24];
rzq(1,32) q[28];
cx q[28], q[25];
rzq(-1,16) q[25];
cx q[28], q[25];
rzq(1,16) q[25];
rzq(1,16) q[28];
cx q[28], q[26];
rzq(-1,8) q[26];
cx q[28], q[26];
rzq(1,8) q[26];
rzq(1,8) q[28];
cx q[28], q[27];
rzq(-1,4) q[27];
cx q[28], q[27];
rzq(1,4) q[27];
rzq(1,4) q[28];
h q[28];
cx q[29], q[17];
rzq(-1,8192) q[17];
cx q[29], q[17];
rzq(1,8192) q[17];
rzq(1,8192) q[29];
cx q[29], q[18];
rzq(-1,4096) q[18];
cx q[29], q[18];
rzq(1,4096) q[18];
rzq(1,4096) q[29];
cx q[29], q[19];
rzq(-1,2048) q[19];
cx q[29], q[19];
rzq(1,2048) q[19];
rzq(1,2048) q[29];
cx q[29], q[20];
rzq(-1,1024) q[20];
cx q[29], q[20];
rzq(1,1024) q[20];
rzq(1,1024) q[29];
cx q[29], q[21];
rzq(-1,512) q[21];
cx q[29], q[21];
rzq(1,512) q[21];
rzq(1,512) q[29];
cx q[29], q[22];
rzq(-1,256) q[22];
cx q[29], q[22];
rzq(1,256) q[22];
rzq(1,256) q[29];
cx q[29], q[23];
rzq(-1,128) q[23];
cx q[29], q[23];
rzq(1,128) q[23];
rzq(1,128) q[29];
cx q[29], q[24];
rzq(-1,64) q[24];
cx q[29], q[24];
rzq(1,64) q[24];
rzq(1,64) q[29];
cx q[29], q[25];
rzq(-1,32) q[25];
cx q[29], q[25];
rzq(1,32) q[25];
rzq(1,32) q[29];
cx q[29], q[26];
rzq(-1,16) q[26];
cx q[29], q[26];
rzq(1,16) q[26];
rzq(1,16) q[29];
cx q[29], q[27];
rzq(-1,8) q[27];
cx q[29], q[27];
rzq(1,8) q[27];
rzq(1,8) q[29];
cx q[29], q[28];
rzq(-1,4) q[28];
cx q[29], q[28];
rzq(1,4) q[28];
rzq(1,4) q[29];
h q[29];
cx q[30], q[18];
rzq(-1,8192) q[18];
cx q[30], q[18];
rzq(1,8192) q[18];
rzq(1,8192) q[30];
cx q[30], q[19];
rzq(-1,4096) q[19];
cx q[30], q[19];
rzq(1,4096) q[19];
rzq(1,4096) q[30];
cx q[30], q[20];
rzq(-1,2048) q[20];
cx q[30], q[20];
rzq(1,2048) q[20];
rzq(1,2048) q[30];
cx q[30], q[21];
rzq(-1,1024) q[21];
cx q[30], q[21];
rzq(1,1024) q[21];
rzq(1,1024) q[30];
cx q[30], q[22];
rzq(-1,512) q[22];
cx q[30], q[22];
rzq(1,512) q[22];
rzq(1,512) q[30];
cx q[30], q[23];
rzq(-1,256) q[23];
cx q[30], q[23];
rzq(1,256) q[23];
rzq(1,256) q[30];
cx q[30], q[24];
rzq(-1,128) q[24];
cx q[30], q[24];
rzq(1,128) q[24];
rzq(1,128) q[30];
cx q[30], q[25];
rzq(-1,64) q[25];
cx q[30], q[25];
rzq(1,64) q[25];
rzq(1,64) q[30];
cx q[30], q[26];
rzq(-1,32) q[26];
cx q[30], q[26];
rzq(1,32) q[26];
rzq(1,32) q[30];
cx q[30], q[27];
rzq(-1,16) q[27];
cx q[30], q[27];
rzq(1,16) q[27];
rzq(1,16) q[30];
cx q[30], q[28];
rzq(-1,8) q[28];
cx q[30], q[28];
rzq(1,8) q[28];
rzq(1,8) q[30];
cx q[30], q[29];
rzq(-1,4) q[29];
cx q[30], q[29];
rzq(1,4) q[29];
rzq(1,4) q[30];
h q[30];
cx q[31], q[19];
rzq(-1,8192) q[19];
cx q[31], q[19];
rzq(1,8192) q[19];
rzq(1,8192) q[31];
cx q[31], q[20];
rzq(-1,4096) q[20];
cx q[31], q[20];
rzq(1,4096) q[20];
rzq(1,4096) q[31];
cx q[31], q[21];
rzq(-1,2048) q[21];
cx q[31], q[21];
rzq(1,2048) q[21];
rzq(1,2048) q[31];
cx q[31], q[22];
rzq(-1,1024) q[22];
cx q[31], q[22];
rzq(1,1024) q[22];
rzq(1,1024) q[31];
cx q[31], q[23];
rzq(-1,512) q[23];
cx q[31], q[23];
rzq(1,512) q[23];
rzq(1,512) q[31];
cx q[31], q[24];
rzq(-1,256) q[24];
cx q[31], q[24];
rzq(1,256) q[24];
rzq(1,256) q[31];
cx q[31], q[25];
rzq(-1,128) q[25];
cx q[31], q[25];
rzq(1,128) q[25];
rzq(1,128) q[31];
cx q[31], q[26];
rzq(-1,64) q[26];
cx q[31], q[26];
rzq(1,64) q[26];
rzq(1,64) q[31];
cx q[31], q[27];
rzq(-1,32) q[27];
cx q[31], q[27];
rzq(1,32) q[27];
rzq(1,32) q[31];
cx q[31], q[28];
rzq(-1,16) q[28];
cx q[31], q[28];
rzq(1,16) q[28];
rzq(1,16) q[31];
cx q[31], q[29];
rzq(-1,8) q[29];
cx q[31], q[29];
rzq(1,8) q[29];
rzq(1,8) q[31];
cx q[31], q[30];
rzq(-1,4) q[30];
cx q[31], q[30];
rzq(1,4) q[30];
rzq(1,4) q[31];
h q[31];
cx q[0], q[16];
rzq(-1,2) q[16];
cx q[0], q[16];
rzq(1,2) q[16];
rzq(1,2) q[0];
cx q[1], q[16];
rzq(-1,4) q[16];
cx q[1], q[16];
rzq(1,4) q[16];
rzq(1,4) q[1];
cx q[2], q[16];
rzq(-1,8) q[16];
cx q[2], q[16];
rzq(1,8) q[16];
rzq(1,8) q[2];
cx q[3], q[16];
rzq(-1,16) q[16];
cx q[3], q[16];
rzq(1,16) q[16];
rzq(1,16) q[3];
cx q[4], q[16];
rzq(-1,32) q[16];
cx q[4], q[16];
rzq(1,32) q[16];
rzq(1,32) q[4];
cx q[5], q[16];
rzq(-1,64) q[16];
cx q[5], q[16];
rzq(1,64) q[16];
rzq(1,64) q[5];
cx q[6], q[16];
rzq(-1,128) q[16];
cx q[6], q[16];
rzq(1,128) q[16];
rzq(1,128) q[6];
cx q[7], q[16];
rzq(-1,256) q[16];
cx q[7], q[16];
rzq(1,256) q[16];
rzq(1,256) q[7];
cx q[8], q[16];
rzq(-1,512) q[16];
cx q[8], q[16];
rzq(1,512) q[16];
rzq(1,512) q[8];
cx q[9], q[16];
rzq(-1,1024) q[16];
cx q[9], q[16];
rzq(1,1024) q[16];
rzq(1,1024) q[9];
cx q[10], q[16];
rzq(-1,2048) q[16];
cx q[10], q[16];
rzq(1,2048) q[16];
rzq(1,2048) q[10];
cx q[11], q[16];
rzq(-1,4096) q[16];
cx q[11], q[16];
rzq(1,4096) q[16];
rzq(1,4096) q[11];
cx q[12], q[16];
rzq(-1,8192) q[16];
cx q[12], q[16];
rzq(1,8192) q[16];
rzq(1,8192) q[12];
cx q[1], q[17];
rzq(-1,2) q[17];
cx q[1], q[17];
rzq(1,2) q[17];
rzq(1,2) q[1];
cx q[2], q[17];
rzq(-1,4) q[17];
cx q[2], q[17];
rzq(1,4) q[17];
rzq(1,4) q[2];
cx q[3], q[17];
rzq(-1,8) q[17];
cx q[3], q[17];
rzq(1,8) q[17];
rzq(1,8) q[3];
cx q[4], q[17];
rzq(-1,16) q[17];
cx q[4], q[17];
rzq(1,16) q[17];
rzq(1,16) q[4];
cx q[5], q[17];
rzq(-1,32) q[17];
cx q[5], q[17];
rzq(1,32) q[17];
rzq(1,32) q[5];
cx q[6], q[17];
rzq(-1,64) q[17];
cx q[6], q[17];
rzq(1,64) q[17];
rzq(1,64) q[6];
cx q[7], q[17];
rzq(-1,128) q[17];
cx q[7], q[17];
rzq(1,128) q[17];
rzq(1,128) q[7];
cx q[8], q[17];
rzq(-1,256) q[17];
cx q[8], q[17];
rzq(1,256) q[17];
rzq(1,256) q[8];
cx q[9], q[17];
rzq(-1,512) q[17];
cx q[9], q[17];
rzq(1,512) q[17];
rzq(1,512) q[9];
cx q[10], q[17];
rzq(-1,1024) q[17];
cx q[10], q[17];
rzq(1,1024) q[17];
rzq(1,1024) q[10];
cx q[11], q[17];
rzq(-1,2048) q[17];
cx q[11], q[17];
rzq(1,2048) q[17];
rzq(1,2048) q[11];
cx q[12], q[17];
rzq(-1,4096) q[17];
cx q[12], q[17];
rzq(1,4096) q[17];
rzq(1,4096) q[12];
cx q[13], q[17];
rzq(-1,8192) q[17];
cx q[13], q[17];
rzq(1,8192) q[17];
rzq(1,8192) q[13];
cx q[2], q[18];
rzq(-1,2) q[18];
cx q[2], q[18];
rzq(1,2) q[18];
rzq(1,2) q[2];
cx q[3], q[18];
rzq(-1,4) q[18];
cx q[3], q[18];
rzq(1,4) q[18];
rzq(1,4) q[3];
cx q[4], q[18];
rzq(-1,8) q[18];
cx q[4], q[18];
rzq(1,8) q[18];
rzq(1,8) q[4];
cx q[5], q[18];
rzq(-1,16) q[18];
cx q[5], q[18];
rzq(1,16) q[18];
rzq(1,16) q[5];
cx q[6], q[18];
rzq(-1,32) q[18];
cx q[6], q[18];
rzq(1,32) q[18];
rzq(1,32) q[6];
cx q[7], q[18];
rzq(-1,64) q[18];
cx q[7], q[18];
rzq(1,64) q[18];
rzq(1,64) q[7];
cx q[8], q[18];
rzq(-1,128) q[18];
cx q[8], q[18];
rzq(1,128) q[18];
rzq(1,128) q[8];
cx q[9], q[18];
rzq(-1,256) q[18];
cx q[9], q[18];
rzq(1,256) q[18];
rzq(1,256) q[9];
cx q[10], q[18];
rzq(-1,512) q[18];
cx q[10], q[18];
rzq(1,512) q[18];
rzq(1,512) q[10];
cx q[11], q[18];
rzq(-1,1024) q[18];
cx q[11], q[18];
rzq(1,1024) q[18];
rzq(1,1024) q[11];
cx q[12], q[18];
rzq(-1,2048) q[18];
cx q[12], q[18];
rzq(1,2048) q[18];
rzq(1,2048) q[12];
cx q[13], q[18];
rzq(-1,4096) q[18];
cx q[13], q[18];
rzq(1,4096) q[18];
rzq(1,4096) q[13];
cx q[14], q[18];
rzq(-1,8192) q[18];
cx q[14], q[18];
rzq(1,8192) q[18];
rzq(1,8192) q[14];
cx q[3], q[19];
rzq(-1,2) q[19];
cx q[3], q[19];
rzq(1,2) q[19];
rzq(1,2) q[3];
cx q[4], q[19];
rzq(-1,4) q[19];
cx q[4], q[19];
rzq(1,4) q[19];
rzq(1,4) q[4];
cx q[5], q[19];
rzq(-1,8) q[19];
cx q[5], q[19];
rzq(1,8) q[19];
rzq(1,8) q[5];
cx q[6], q[19];
rzq(-1,16) q[19];
cx q[6], q[19];
rzq(1,16) q[19];
rzq(1,16) q[6];
cx q[7], q[19];
rzq(-1,32) q[19];
cx q[7], q[19];
rzq(1,32) q[19];
rzq(1,32) q[7];
cx q[8], q[19];
rzq(-1,64) q[19];
cx q[8], q[19];
rzq(1,64) q[19];
rzq(1,64) q[8];
cx q[9], q[19];
rzq(-1,128) q[19];
cx q[9], q[19];
rzq(1,128) q[19];
rzq(1,128) q[9];
cx q[10], q[19];
rzq(-1,256) q[19];
cx q[10], q[19];
rzq(1,256) q[19];
rzq(1,256) q[10];
cx q[11], q[19];
rzq(-1,512) q[19];
cx q[11], q[19];
rzq(1,512) q[19];
rzq(1,512) q[11];
cx q[12], q[19];
rzq(-1,1024) q[19];
cx q[12], q[19];
rzq(1,1024) q[19];
rzq(1,1024) q[12];
cx q[13], q[19];
rzq(-1,2048) q[19];
cx q[13], q[19];
rzq(1,2048) q[19];
rzq(1,2048) q[13];
cx q[14], q[19];
rzq(-1,4096) q[19];
cx q[14], q[19];
rzq(1,4096) q[19];
rzq(1,4096) q[14];
cx q[15], q[19];
rzq(-1,8192) q[19];
cx q[15], q[19];
rzq(1,8192) q[19];
rzq(1,8192) q[15];
cx q[4], q[20];
rzq(-1,2) q[20];
cx q[4], q[20];
rzq(1,2) q[20];
rzq(1,2) q[4];
cx q[5], q[20];
rzq(-1,4) q[20];
cx q[5], q[20];
rzq(1,4) q[20];
rzq(1,4) q[5];
cx q[6], q[20];
rzq(-1,8) q[20];
cx q[6], q[20];
rzq(1,8) q[20];
rzq(1,8) q[6];
cx q[7], q[20];
rzq(-1,16) q[20];
cx q[7], q[20];
rzq(1,16) q[20];
rzq(1,16) q[7];
cx q[8], q[20];
rzq(-1,32) q[20];
cx q[8], q[20];
rzq(1,32) q[20];
rzq(1,32) q[8];
cx q[9], q[20];
rzq(-1,64) q[20];
cx q[9], q[20];
rzq(1,64) q[20];
rzq(1,64) q[9];
cx q[10], q[20];
rzq(-1,128) q[20];
cx q[10], q[20];
rzq(1,128) q[20];
rzq(1,128) q[10];
cx q[11], q[20];
rzq(-1,256) q[20];
cx q[11], q[20];
rzq(1,256) q[20];
rzq(1,256) q[11];
cx q[12], q[20];
rzq(-1,512) q[20];
cx q[12], q[20];
rzq(1,512) q[20];
rzq(1,512) q[12];
cx q[13], q[20];
rzq(-1,1024) q[20];
cx q[13], q[20];
rzq(1,1024) q[20];
rzq(1,1024) q[13];
cx q[14], q[20];
rzq(-1,2048) q[20];
cx q[14], q[20];
rzq(1,2048) q[20];
rzq(1,2048) q[14];
cx q[15], q[20];
rzq(-1,4096) q[20];
cx q[15], q[20];
rzq(1,4096) q[20];
rzq(1,4096) q[15];
cx q[5], q[21];
rzq(-1,2) q[21];
cx q[5], q[21];
rzq(1,2) q[21];
rzq(1,2) q[5];
cx q[6], q[21];
rzq(-1,4) q[21];
cx q[6], q[21];
rzq(1,4) q[21];
rzq(1,4) q[6];
cx q[7], q[21];
rzq(-1,8) q[21];
cx q[7], q[21];
rzq(1,8) q[21];
rzq(1,8) q[7];
cx q[8], q[21];
rzq(-1,16) q[21];
cx q[8], q[21];
rzq(1,16) q[21];
rzq(1,16) q[8];
cx q[9], q[21];
rzq(-1,32) q[21];
cx q[9], q[21];
rzq(1,32) q[21];
rzq(1,32) q[9];
cx q[10], q[21];
rzq(-1,64) q[21];
cx q[10], q[21];
rzq(1,64) q[21];
rzq(1,64) q[10];
cx q[11], q[21];
rzq(-1,128) q[21];
cx q[11], q[21];
rzq(1,128) q[21];
rzq(1,128) q[11];
cx q[12], q[21];
rzq(-1,256) q[21];
cx q[12], q[21];
rzq(1,256) q[21];
rzq(1,256) q[12];
cx q[13], q[21];
rzq(-1,512) q[21];
cx q[13], q[21];
rzq(1,512) q[21];
rzq(1,512) q[13];
cx q[14], q[21];
rzq(-1,1024) q[21];
cx q[14], q[21];
rzq(1,1024) q[21];
rzq(1,1024) q[14];
cx q[15], q[21];
rzq(-1,2048) q[21];
cx q[15], q[21];
rzq(1,2048) q[21];
rzq(1,2048) q[15];
cx q[6], q[22];
rzq(-1,2) q[22];
cx q[6], q[22];
rzq(1,2) q[22];
rzq(1,2) q[6];
cx q[7], q[22];
rzq(-1,4) q[22];
cx q[7], q[22];
rzq(1,4) q[22];
rzq(1,4) q[7];
cx q[8], q[22];
rzq(-1,8) q[22];
cx q[8], q[22];
rzq(1,8) q[22];
rzq(1,8) q[8];
cx q[9], q[22];
rzq(-1,16) q[22];
cx q[9], q[22];
rzq(1,16) q[22];
rzq(1,16) q[9];
cx q[10], q[22];
rzq(-1,32) q[22];
cx q[10], q[22];
rzq(1,32) q[22];
rzq(1,32) q[10];
cx q[11], q[22];
rzq(-1,64) q[22];
cx q[11], q[22];
rzq(1,64) q[22];
rzq(1,64) q[11];
cx q[12], q[22];
rzq(-1,128) q[22];
cx q[12], q[22];
rzq(1,128) q[22];
rzq(1,128) q[12];
cx q[13], q[22];
rzq(-1,256) q[22];
cx q[13], q[22];
rzq(1,256) q[22];
rzq(1,256) q[13];
cx q[14], q[22];
rzq(-1,512) q[22];
cx q[14], q[22];
rzq(1,512) q[22];
rzq(1,512) q[14];
cx q[15], q[22];
rzq(-1,1024) q[22];
cx q[15], q[22];
rzq(1,1024) q[22];
rzq(1,1024) q[15];
cx q[7], q[23];
rzq(-1,2) q[23];
cx q[7], q[23];
rzq(1,2) q[23];
rzq(1,2) q[7];
cx q[8], q[23];
rzq(-1,4) q[23];
cx q[8], q[23];
rzq(1,4) q[23];
rzq(1,4) q[8];
cx q[9], q[23];
rzq(-1,8) q[23];
cx q[9], q[23];
rzq(1,8) q[23];
rzq(1,8) q[9];
cx q[10], q[23];
rzq(-1,16) q[23];
cx q[10], q[23];
rzq(1,16) q[23];
rzq(1,16) q[10];
cx q[11], q[23];
rzq(-1,32) q[23];
cx q[11], q[23];
rzq(1,32) q[23];
rzq(1,32) q[11];
cx q[12], q[23];
rzq(-1,64) q[23];
cx q[12], q[23];
rzq(1,64) q[23];
rzq(1,64) q[12];
cx q[13], q[23];
rzq(-1,128) q[23];
cx q[13], q[23];
rzq(1,128) q[23];
rzq(1,128) q[13];
cx q[14], q[23];
rzq(-1,256) q[23];
cx q[14], q[23];
rzq(1,256) q[23];
rzq(1,256) q[14];
cx q[15], q[23];
rzq(-1,512) q[23];
cx q[15], q[23];
rzq(1,512) q[23];
rzq(1,512) q[15];
cx q[8], q[24];
rzq(-1,2) q[24];
cx q[8], q[24];
rzq(1,2) q[24];
rzq(1,2) q[8];
cx q[9], q[24];
rzq(-1,4) q[24];
cx q[9], q[24];
rzq(1,4) q[24];
rzq(1,4) q[9];
cx q[10], q[24];
rzq(-1,8) q[24];
cx q[10], q[24];
rzq(1,8) q[24];
rzq(1,8) q[10];
cx q[11], q[24];
rzq(-1,16) q[24];
cx q[11], q[24];
rzq(1,16) q[24];
rzq(1,16) q[11];
cx q[12], q[24];
rzq(-1,32) q[24];
cx q[12], q[24];
rzq(1,32) q[24];
rzq(1,32) q[12];
cx q[13], q[24];
rzq(-1,64) q[24];
cx q[13], q[24];
rzq(1,64) q[24];
rzq(1,64) q[13];
cx q[14], q[24];
rzq(-1,128) q[24];
cx q[14], q[24];
rzq(1,128) q[24];
rzq(1,128) q[14];
cx q[15], q[24];
rzq(-1,256) q[24];
cx q[15], q[24];
rzq(1,256) q[24];
rzq(1,256) q[15];
cx q[9], q[25];
rzq(-1,2) q[25];
cx q[9], q[25];
rzq(1,2) q[25];
rzq(1,2) q[9];
cx q[10], q[25];
rzq(-1,4) q[25];
cx q[10], q[25];
rzq(1,4) q[25];
rzq(1,4) q[10];
cx q[11], q[25];
rzq(-1,8) q[25];
cx q[11], q[25];
rzq(1,8) q[25];
rzq(1,8) q[11];
cx q[12], q[25];
rzq(-1,16) q[25];
cx q[12], q[25];
rzq(1,16) q[25];
rzq(1,16) q[12];
cx q[13], q[25];
rzq(-1,32) q[25];
cx q[13], q[25];
rzq(1,32) q[25];
rzq(1,32) q[13];
cx q[14], q[25];
rzq(-1,64) q[25];
cx q[14], q[25];
rzq(1,64) q[25];
rzq(1,64) q[14];
cx q[15], q[25];
rzq(-1,128) q[25];
cx q[15], q[25];
rzq(1,128) q[25];
rzq(1,128) q[15];
cx q[10], q[26];
rzq(-1,2) q[26];
cx q[10], q[26];
rzq(1,2) q[26];
rzq(1,2) q[10];
cx q[11], q[26];
rzq(-1,4) q[26];
cx q[11], q[26];
rzq(1,4) q[26];
rzq(1,4) q[11];
cx q[12], q[26];
rzq(-1,8) q[26];
cx q[12], q[26];
rzq(1,8) q[26];
rzq(1,8) q[12];
cx q[13], q[26];
rzq(-1,16) q[26];
cx q[13], q[26];
rzq(1,16) q[26];
rzq(1,16) q[13];
cx q[14], q[26];
rzq(-1,32) q[26];
cx q[14], q[26];
rzq(1,32) q[26];
rzq(1,32) q[14];
cx q[15], q[26];
rzq(-1,64) q[26];
cx q[15], q[26];
rzq(1,64) q[26];
rzq(1,64) q[15];
cx q[11], q[27];
rzq(-1,2) q[27];
cx q[11], q[27];
rzq(1,2) q[27];
rzq(1,2) q[11];
cx q[12], q[27];
rzq(-1,4) q[27];
cx q[12], q[27];
rzq(1,4) q[27];
rzq(1,4) q[12];
cx q[13], q[27];
rzq(-1,8) q[27];
cx q[13], q[27];
rzq(1,8) q[27];
rzq(1,8) q[13];
cx q[14], q[27];
rzq(-1,16) q[27];
cx q[14], q[27];
rzq(1,16) q[27];
rzq(1,16) q[14];
cx q[15], q[27];
rzq(-1,32) q[27];
cx q[15], q[27];
rzq(1,32) q[27];
rzq(1,32) q[15];
cx q[12], q[28];
rzq(-1,2) q[28];
cx q[12], q[28];
rzq(1,2) q[28];
rzq(1,2) q[12];
cx q[13], q[28];
rzq(-1,4) q[28];
cx q[13], q[28];
rzq(1,4) q[28];
rzq(1,4) q[13];
cx q[14], q[28];
rzq(-1,8) q[28];
cx q[14], q[28];
rzq(1,8) q[28];
rzq(1,8) q[14];
cx q[15], q[28];
rzq(-1,16) q[28];
cx q[15], q[28];
rzq(1,16) q[28];
rzq(1,16) q[15];
cx q[13], q[29];
rzq(-1,2) q[29];
cx q[13], q[29];
rzq(1,2) q[29];
rzq(1,2) q[13];
cx q[14], q[29];
rzq(-1,4) q[29];
cx q[14], q[29];
rzq(1,4) q[29];
rzq(1,4) q[14];
cx q[15], q[29];
rzq(-1,8) q[29];
cx q[15], q[29];
rzq(1,8) q[29];
rzq(1,8) q[15];
cx q[14], q[30];
rzq(-1,2) q[30];
cx q[14], q[30];
rzq(1,2) q[30];
rzq(1,2) q[14];
cx q[15], q[30];
rzq(-1,4) q[30];
cx q[15], q[30];
rzq(1,4) q[30];
rzq(1,4) q[15];
cx q[15], q[31];
rzq(-1,2) q[31];
cx q[15], q[31];
rzq(1,2) q[31];
rzq(1,2) q[15];
h q[31];
cx q[31], q[30];
rzq(-1,4) q[30];
cx q[31], q[30];
rzq(1,4) q[30];
rzq(1,4) q[31];
cx q[31], q[29];
rzq(-1,8) q[29];
cx q[31], q[29];
rzq(1,8) q[29];
rzq(1,8) q[31];
cx q[31], q[28];
rzq(-1,16) q[28];
cx q[31], q[28];
rzq(1,16) q[28];
rzq(1,16) q[31];
cx q[31], q[27];
rzq(-1,32) q[27];
cx q[31], q[27];
rzq(1,32) q[27];
rzq(1,32) q[31];
cx q[31], q[26];
rzq(-1,64) q[26];
cx q[31], q[26];
rzq(1,64) q[26];
rzq(1,64) q[31];
cx q[31], q[25];
rzq(-1,128) q[25];
cx q[31], q[25];
rzq(1,128) q[25];
rzq(1,128) q[31];
cx q[31], q[24];
rzq(-1,256) q[24];
cx q[31], q[24];
rzq(1,256) q[24];
rzq(1,256) q[31];
cx q[31], q[23];
rzq(-1,512) q[23];
cx q[31], q[23];
rzq(1,512) q[23];
rzq(1,512) q[31];
cx q[31], q[22];
rzq(-1,1024) q[22];
cx q[31], q[22];
rzq(1,1024) q[22];
rzq(1,1024) q[31];
cx q[31], q[21];
rzq(-1,2048) q[21];
cx q[31], q[21];
rzq(1,2048) q[21];
rzq(1,2048) q[31];
cx q[31], q[20];
rzq(-1,4096) q[20];
cx q[31], q[20];
rzq(1,4096) q[20];
rzq(1,4096) q[31];
cx q[31], q[19];
rzq(-1,8192) q[19];
cx q[31], q[19];
rzq(1,8192) q[19];
rzq(1,8192) q[31];
h q[30];
cx q[30], q[29];
rzq(-1,4) q[29];
cx q[30], q[29];
rzq(1,4) q[29];
rzq(1,4) q[30];
cx q[30], q[28];
rzq(-1,8) q[28];
cx q[30], q[28];
rzq(1,8) q[28];
rzq(1,8) q[30];
cx q[30], q[27];
rzq(-1,16) q[27];
cx q[30], q[27];
rzq(1,16) q[27];
rzq(1,16) q[30];
cx q[30], q[26];
rzq(-1,32) q[26];
cx q[30], q[26];
rzq(1,32) q[26];
rzq(1,32) q[30];
cx q[30], q[25];
rzq(-1,64) q[25];
cx q[30], q[25];
rzq(1,64) q[25];
rzq(1,64) q[30];
cx q[30], q[24];
rzq(-1,128) q[24];
cx q[30], q[24];
rzq(1,128) q[24];
rzq(1,128) q[30];
cx q[30], q[23];
rzq(-1,256) q[23];
cx q[30], q[23];
rzq(1,256) q[23];
rzq(1,256) q[30];
cx q[30], q[22];
rzq(-1,512) q[22];
cx q[30], q[22];
rzq(1,512) q[22];
rzq(1,512) q[30];
cx q[30], q[21];
rzq(-1,1024) q[21];
cx q[30], q[21];
rzq(1,1024) q[21];
rzq(1,1024) q[30];
cx q[30], q[20];
rzq(-1,2048) q[20];
cx q[30], q[20];
rzq(1,2048) q[20];
rzq(1,2048) q[30];
cx q[30], q[19];
rzq(-1,4096) q[19];
cx q[30], q[19];
rzq(1,4096) q[19];
rzq(1,4096) q[30];
cx q[30], q[18];
rzq(-1,8192) q[18];
cx q[30], q[18];
rzq(1,8192) q[18];
rzq(1,8192) q[30];
h q[29];
cx q[29], q[28];
rzq(-1,4) q[28];
cx q[29], q[28];
rzq(1,4) q[28];
rzq(1,4) q[29];
cx q[29], q[27];
rzq(-1,8) q[27];
cx q[29], q[27];
rzq(1,8) q[27];
rzq(1,8) q[29];
cx q[29], q[26];
rzq(-1,16) q[26];
cx q[29], q[26];
rzq(1,16) q[26];
rzq(1,16) q[29];
cx q[29], q[25];
rzq(-1,32) q[25];
cx q[29], q[25];
rzq(1,32) q[25];
rzq(1,32) q[29];
cx q[29], q[24];
rzq(-1,64) q[24];
cx q[29], q[24];
rzq(1,64) q[24];
rzq(1,64) q[29];
cx q[29], q[23];
rzq(-1,128) q[23];
cx q[29], q[23];
rzq(1,128) q[23];
rzq(1,128) q[29];
cx q[29], q[22];
rzq(-1,256) q[22];
cx q[29], q[22];
rzq(1,256) q[22];
rzq(1,256) q[29];
cx q[29], q[21];
rzq(-1,512) q[21];
cx q[29], q[21];
rzq(1,512) q[21];
rzq(1,512) q[29];
cx q[29], q[20];
rzq(-1,1024) q[20];
cx q[29], q[20];
rzq(1,1024) q[20];
rzq(1,1024) q[29];
cx q[29], q[19];
rzq(-1,2048) q[19];
cx q[29], q[19];
rzq(1,2048) q[19];
rzq(1,2048) q[29];
cx q[29], q[18];
rzq(-1,4096) q[18];
cx q[29], q[18];
rzq(1,4096) q[18];
rzq(1,4096) q[29];
cx q[29], q[17];
rzq(-1,8192) q[17];
cx q[29], q[17];
rzq(1,8192) q[17];
rzq(1,8192) q[29];
h q[28];
cx q[28], q[27];
rzq(-1,4) q[27];
cx q[28], q[27];
rzq(1,4) q[27];
rzq(1,4) q[28];
cx q[28], q[26];
rzq(-1,8) q[26];
cx q[28], q[26];
rzq(1,8) q[26];
rzq(1,8) q[28];
cx q[28], q[25];
rzq(-1,16) q[25];
cx q[28], q[25];
rzq(1,16) q[25];
rzq(1,16) q[28];
cx q[28], q[24];
rzq(-1,32) q[24];
cx q[28], q[24];
rzq(1,32) q[24];
rzq(1,32) q[28];
cx q[28], q[23];
rzq(-1,64) q[23];
cx q[28], q[23];
rzq(1,64) q[23];
rzq(1,64) q[28];
cx q[28], q[22];
rzq(-1,128) q[22];
cx q[28], q[22];
rzq(1,128) q[22];
rzq(1,128) q[28];
cx q[28], q[21];
rzq(-1,256) q[21];
cx q[28], q[21];
rzq(1,256) q[21];
rzq(1,256) q[28];
cx q[28], q[20];
rzq(-1,512) q[20];
cx q[28], q[20];
rzq(1,512) q[20];
rzq(1,512) q[28];
cx q[28], q[19];
rzq(-1,1024) q[19];
cx q[28], q[19];
rzq(1,1024) q[19];
rzq(1,1024) q[28];
cx q[28], q[18];
rzq(-1,2048) q[18];
cx q[28], q[18];
rzq(1,2048) q[18];
rzq(1,2048) q[28];
cx q[28], q[17];
rzq(-1,4096) q[17];
cx q[28], q[17];
rzq(1,4096) q[17];
rzq(1,4096) q[28];
cx q[28], q[16];
rzq(-1,8192) q[16];
cx q[28], q[16];
rzq(1,8192) q[16];
rzq(1,8192) q[28];
h q[27];
cx q[27], q[26];
rzq(-1,4) q[26];
cx q[27], q[26];
rzq(1,4) q[26];
rzq(1,4) q[27];
cx q[27], q[25];
rzq(-1,8) q[25];
cx q[27], q[25];
rzq(1,8) q[25];
rzq(1,8) q[27];
cx q[27], q[24];
rzq(-1,16) q[24];
cx q[27], q[24];
rzq(1,16) q[24];
rzq(1,16) q[27];
cx q[27], q[23];
rzq(-1,32) q[23];
cx q[27], q[23];
rzq(1,32) q[23];
rzq(1,32) q[27];
cx q[27], q[22];
rzq(-1,64) q[22];
cx q[27], q[22];
rzq(1,64) q[22];
rzq(1,64) q[27];
cx q[27], q[21];
rzq(-1,128) q[21];
cx q[27], q[21];
rzq(1,128) q[21];
rzq(1,128) q[27];
cx q[27], q[20];
rzq(-1,256) q[20];
cx q[27], q[20];
rzq(1,256) q[20];
rzq(1,256) q[27];
cx q[27], q[19];
rzq(-1,512) q[19];
cx q[27], q[19];
rzq(1,512) q[19];
rzq(1,512) q[27];
cx q[27], q[18];
rzq(-1,1024) q[18];
cx q[27], q[18];
rzq(1,1024) q[18];
rzq(1,1024) q[27];
cx q[27], q[17];
rzq(-1,2048) q[17];
cx q[27], q[17];
rzq(1,2048) q[17];
rzq(1,2048) q[27];
cx q[27], q[16];
rzq(-1,4096) q[16];
cx q[27], q[16];
rzq(1,4096) q[16];
rzq(1,4096) q[27];
h q[26];
cx q[26], q[25];
rzq(-1,4) q[25];
cx q[26], q[25];
rzq(1,4) q[25];
rzq(1,4) q[26];
cx q[26], q[24];
rzq(-1,8) q[24];
cx q[26], q[24];
rzq(1,8) q[24];
rzq(1,8) q[26];
cx q[26], q[23];
rzq(-1,16) q[23];
cx q[26], q[23];
rzq(1,16) q[23];
rzq(1,16) q[26];
cx q[26], q[22];
rzq(-1,32) q[22];
cx q[26], q[22];
rzq(1,32) q[22];
rzq(1,32) q[26];
cx q[26], q[21];
rzq(-1,64) q[21];
cx q[26], q[21];
rzq(1,64) q[21];
rzq(1,64) q[26];
cx q[26], q[20];
rzq(-1,128) q[20];
cx q[26], q[20];
rzq(1,128) q[20];
rzq(1,128) q[26];
cx q[26], q[19];
rzq(-1,256) q[19];
cx q[26], q[19];
rzq(1,256) q[19];
rzq(1,256) q[26];
cx q[26], q[18];
rzq(-1,512) q[18];
cx q[26], q[18];
rzq(1,512) q[18];
rzq(1,512) q[26];
cx q[26], q[17];
rzq(-1,1024) q[17];
cx q[26], q[17];
rzq(1,1024) q[17];
rzq(1,1024) q[26];
cx q[26], q[16];
rzq(-1,2048) q[16];
cx q[26], q[16];
rzq(1,2048) q[16];
rzq(1,2048) q[26];
h q[25];
cx q[25], q[24];
rzq(-1,4) q[24];
cx q[25], q[24];
rzq(1,4) q[24];
rzq(1,4) q[25];
cx q[25], q[23];
rzq(-1,8) q[23];
cx q[25], q[23];
rzq(1,8) q[23];
rzq(1,8) q[25];
cx q[25], q[22];
rzq(-1,16) q[22];
cx q[25], q[22];
rzq(1,16) q[22];
rzq(1,16) q[25];
cx q[25], q[21];
rzq(-1,32) q[21];
cx q[25], q[21];
rzq(1,32) q[21];
rzq(1,32) q[25];
cx q[25], q[20];
rzq(-1,64) q[20];
cx q[25], q[20];
rzq(1,64) q[20];
rzq(1,64) q[25];
cx q[25], q[19];
rzq(-1,128) q[19];
cx q[25], q[19];
rzq(1,128) q[19];
rzq(1,128) q[25];
cx q[25], q[18];
rzq(-1,256) q[18];
cx q[25], q[18];
rzq(1,256) q[18];
rzq(1,256) q[25];
cx q[25], q[17];
rzq(-1,512) q[17];
cx q[25], q[17];
rzq(1,512) q[17];
rzq(1,512) q[25];
cx q[25], q[16];
rzq(-1,1024) q[16];
cx q[25], q[16];
rzq(1,1024) q[16];
rzq(1,1024) q[25];
h q[24];
cx q[24], q[23];
rzq(-1,4) q[23];
cx q[24], q[23];
rzq(1,4) q[23];
rzq(1,4) q[24];
cx q[24], q[22];
rzq(-1,8) q[22];
cx q[24], q[22];
rzq(1,8) q[22];
rzq(1,8) q[24];
cx q[24], q[21];
rzq(-1,16) q[21];
cx q[24], q[21];
rzq(1,16) q[21];
rzq(1,16) q[24];
cx q[24], q[20];
rzq(-1,32) q[20];
cx q[24], q[20];
rzq(1,32) q[20];
rzq(1,32) q[24];
cx q[24], q[19];
rzq(-1,64) q[19];
cx q[24], q[19];
rzq(1,64) q[19];
rzq(1,64) q[24];
cx q[24], q[18];
rzq(-1,128) q[18];
cx q[24], q[18];
rzq(1,128) q[18];
rzq(1,128) q[24];
cx q[24], q[17];
rzq(-1,256) q[17];
cx q[24], q[17];
rzq(1,256) q[17];
rzq(1,256) q[24];
cx q[24], q[16];
rzq(-1,512) q[16];
cx q[24], q[16];
rzq(1,512) q[16];
rzq(1,512) q[24];
h q[23];
cx q[23], q[22];
rzq(-1,4) q[22];
cx q[23], q[22];
rzq(1,4) q[22];
rzq(1,4) q[23];
cx q[23], q[21];
rzq(-1,8) q[21];
cx q[23], q[21];
rzq(1,8) q[21];
rzq(1,8) q[23];
cx q[23], q[20];
rzq(-1,16) q[20];
cx q[23], q[20];
rzq(1,16) q[20];
rzq(1,16) q[23];
cx q[23], q[19];
rzq(-1,32) q[19];
cx q[23], q[19];
rzq(1,32) q[19];
rzq(1,32) q[23];
cx q[23], q[18];
rzq(-1,64) q[18];
cx q[23], q[18];
rzq(1,64) q[18];
rzq(1,64) q[23];
cx q[23], q[17];
rzq(-1,128) q[17];
cx q[23], q[17];
rzq(1,128) q[17];
rzq(1,128) q[23];
cx q[23], q[16];
rzq(-1,256) q[16];
cx q[23], q[16];
rzq(1,256) q[16];
rzq(1,256) q[23];
h q[22];
cx q[22], q[21];
rzq(-1,4) q[21];
cx q[22], q[21];
rzq(1,4) q[21];
rzq(1,4) q[22];
cx q[22], q[20];
rzq(-1,8) q[20];
cx q[22], q[20];
rzq(1,8) q[20];
rzq(1,8) q[22];
cx q[22], q[19];
rzq(-1,16) q[19];
cx q[22], q[19];
rzq(1,16) q[19];
rzq(1,16) q[22];
cx q[22], q[18];
rzq(-1,32) q[18];
cx q[22], q[18];
rzq(1,32) q[18];
rzq(1,32) q[22];
cx q[22], q[17];
rzq(-1,64) q[17];
cx q[22], q[17];
rzq(1,64) q[17];
rzq(1,64) q[22];
cx q[22], q[16];
rzq(-1,128) q[16];
cx q[22], q[16];
rzq(1,128) q[16];
rzq(1,128) q[22];
h q[21];
cx q[21], q[20];
rzq(-1,4) q[20];
cx q[21], q[20];
rzq(1,4) q[20];
rzq(1,4) q[21];
cx q[21], q[19];
rzq(-1,8) q[19];
cx q[21], q[19];
rzq(1,8) q[19];
rzq(1,8) q[21];
cx q[21], q[18];
rzq(-1,16) q[18];
cx q[21], q[18];
rzq(1,16) q[18];
rzq(1,16) q[21];
cx q[21], q[17];
rzq(-1,32) q[17];
cx q[21], q[17];
rzq(1,32) q[17];
rzq(1,32) q[21];
cx q[21], q[16];
rzq(-1,64) q[16];
cx q[21], q[16];
rzq(1,64) q[16];
rzq(1,64) q[21];
h q[20];
cx q[20], q[19];
rzq(-1,4) q[19];
cx q[20], q[19];
rzq(1,4) q[19];
rzq(1,4) q[20];
cx q[20], q[18];
rzq(-1,8) q[18];
cx q[20], q[18];
rzq(1,8) q[18];
rzq(1,8) q[20];
cx q[20], q[17];
rzq(-1,16) q[17];
cx q[20], q[17];
rzq(1,16) q[17];
rzq(1,16) q[20];
cx q[20], q[16];
rzq(-1,32) q[16];
cx q[20], q[16];
rzq(1,32) q[16];
rzq(1,32) q[20];
h q[19];
cx q[19], q[18];
rzq(-1,4) q[18];
cx q[19], q[18];
rzq(1,4) q[18];
rzq(1,4) q[19];
cx q[19], q[17];
rzq(-1,8) q[17];
cx q[19], q[17];
rzq(1,8) q[17];
rzq(1,8) q[19];
cx q[19], q[16];
rzq(-1,16) q[16];
cx q[19], q[16];
rzq(1,16) q[16];
rzq(1,16) q[19];
h q[18];
cx q[18], q[17];
rzq(-1,4) q[17];
cx q[18], q[17];
rzq(1,4) q[17];
rzq(1,4) q[18];
cx q[18], q[16];
rzq(-1,8) q[16];
cx q[18], q[16];
rzq(1,8) q[16];
rzq(1,8) q[18];
h q[17];
cx q[17], q[16];
rzq(-1,4) q[16];
cx q[17], q[16];
rzq(1,4) q[16];
rzq(1,4) q[17];
h q[16];
