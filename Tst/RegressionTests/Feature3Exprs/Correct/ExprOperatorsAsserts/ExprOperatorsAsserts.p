event E  assert 1;
event E1  assert 1;
event E2  assert 1;
event E3  assert 1;

main machine M
{
var M_t: (seq[int], map[int, seq[int]]);
var M_t1: (seq[int], map[int, seq[int]]);
var M_ts: (int, int);
var M_tt: (int, int);
var M_tbool: (bool, bool);
var M_te: (int, event);
var M_b: bool;
var M_y: int;
var M_tmp: int;
var M_tmp1: int;
var M_ev: event;
var M_a: any;
var M_tmp2: (seq[any], map[int, seq[any]]);
var M_tmp3: map[int, seq[int]];
var M_s: seq[int];
var M_s1: seq[any];
var M_s2: seq[int];
var M_s3: seq[seq[any]];
var M_s8: seq[(int, int)];
var M_s4: seq[(int, int)];
var M_s5: seq[bool];
var M_s6: seq[map[int, any]];
var M_s7: seq[int];
var M_s9: seq[event];
var M_s10: seq[any];
var M_s11: seq[int];
var M_s12: seq[bool];
var M_i: int;
var M_mac: machine;
var M_m1: map[int, int];
var M_m4: map[int, int];
var M_m3: map[int, bool];
var M_m6: map[int, any];
var M_m5: map[int, any];
var M_m2: map[int, map[int, any]];
var M_m7: map[bool, seq[(int, int)]];
var M_m8: map[int, event];
var M_m9: map[int, any];

fun M_foo(): int
{


return (1);
}
fun M_GetT(): (seq[int], map[int, seq[int]])
{


return (M_t);
}
fun M_IncY(): int
{


M_y = (M_y + 1);
return (M_y);
}
fun M_S_entry56()
{
var Tmp100: bool;
var Tmp101: int;
var Tmp102: seq[int];
var Tmp103: bool;
var Tmp104: int;
var Tmp105: int;
var Tmp106: int;
var Tmp107: bool;
var Tmp108: int;
var Tmp109: int;
var Tmp110: int;
var Tmp111: int;
var Tmp112: int;
var Tmp113: int;
var Tmp114: int;
var Tmp115: int;
var Tmp116: bool;
var Tmp117: bool;
var Tmp118: bool;
var Tmp119: bool;
var Tmp120: (seq[int], map[int, seq[int]]);
var Tmp121: int;
var Tmp122: bool;
var Tmp123: int;
var Tmp124: bool;
var Tmp125: int;
var Tmp126: bool;
var Tmp127: int;
var Tmp128: bool;
var Tmp129: int;
var Tmp130: bool;
var Tmp131: int;
var Tmp132: seq[int];
var Tmp133: bool;
var Tmp134: int;
var Tmp135: seq[int];
var Tmp136: bool;
var Tmp137: int;
var Tmp138: bool;
var Tmp139: int;
var Tmp140: bool;
var Tmp141: int;
var Tmp142: seq[int];
var Tmp143: bool;
var Tmp144: int;
var Tmp145: seq[int];
var Tmp146: bool;
var Tmp147: int;
var Tmp148: seq[int];
var Tmp149: bool;
var Tmp150: int;
var Tmp151: seq[int];
var Tmp152: bool;
var Tmp153: (int, int);
var Tmp154: (int, int);
var Tmp155: (int, int);
var Tmp156: (int, int);
var Tmp157: (int, int);
var Tmp158: (int, int);
var Tmp159: (int, int);
var Tmp160: (int, int);
var Tmp161: (int, int);
var Tmp162: bool;
var Tmp163: (int, int);
var Tmp164: (int, int);
var Tmp165: (int, int);
var Tmp166: bool;
var Tmp76: bool;
var Tmp77: bool;
var Tmp78: bool;
var Tmp79: bool;
var Tmp80: bool;
var Tmp81: bool;
var Tmp82: bool;
var Tmp83: bool;
var Tmp84: bool;
var Tmp85: bool;
var Tmp86: bool;
var Tmp87: bool;
var Tmp88: bool;
var Tmp89: bool;
var Tmp90: bool;
var Tmp91: bool;
var Tmp92: bool;
var Tmp93: bool;
var Tmp94: bool;
var Tmp95: bool;
var Tmp96: bool;
var Tmp97: int;
var Tmp98: int;
var Tmp99: bool;


M_tbool.0 = true;
M_tbool.1 = !(M_tbool.0);
Tmp76 = (M_tbool.1 == false);
assert Tmp76;
Tmp77 = (M_tbool.1 == false);
assert (M_tbool.0 && Tmp77);
Tmp78 = (M_tbool.1 == true);
assert (M_tbool.0 || Tmp78);
Tmp79 = (M_tbool.0 == M_tbool.1);
assert !(Tmp79);
M_ev = E;
Tmp80 = (M_ev == null);
assert !(Tmp80);
M_tt.0 = 1;
M_tt.1 = -(M_tt.0);
Tmp81 = ((M_tt.0 + M_tt.1) == 0);
assert Tmp81;
Tmp82 = ((M_tt.0 - M_tt.1) == 2);
assert Tmp82;
Tmp83 = ((M_tt.0 * M_tt.1) == -(1));
assert Tmp83;
Tmp84 = ((M_tt.0 / M_tt.1) == -(1));
assert Tmp84;
Tmp85 = (((M_tt.0 * 5) / 2) == 2);
assert Tmp85;
Tmp86 = (M_tt.0 == M_tt.1);
assert !(Tmp86);
M_a = null;
Tmp87 = (M_tt.1 == M_a);
assert !(Tmp87);
M_a = -(1);
Tmp88 = (M_tt.1 == M_a);
assert Tmp88;
Tmp89 = (M_a == M_ev);
assert !(Tmp89);
M_a = null;
Tmp90 = (M_mac == M_a);
assert Tmp90;
M_a = 1;
M_a = !(M_tbool.0);
Tmp91 = (M_a == M_tbool.1);
assert Tmp91;
M_a = null;
Tmp92 = (M_a == 1);
assert !(Tmp92);
M_a = 1;
Tmp93 = (M_a == 1);
assert Tmp93;
M_s12 += (0, true);
Tmp94 = M_s12[0];
M_s12 += (1, !(Tmp94));
Tmp95 = M_s12[1];
Tmp96 = (Tmp95 == false);
assert Tmp96;
M_s2 += (0, 1);
Tmp97 = M_s2[0];
M_s2 += (1, -(Tmp97));
Tmp98 = M_s2[1];
Tmp99 = (Tmp98 == -(1));
assert Tmp99;
M_m1[0] = 1;
Tmp100 = (0 in M_m1);
assert Tmp100;
Tmp102 = keys(M_m1);
Tmp101 = Tmp102[0];
M_i = Tmp101;
Tmp103 = (M_i == 0);
assert Tmp103;
M_m1[1] = 3;
Tmp104 = M_m1[1];
M_m1[2] = -(Tmp104);
Tmp105 = M_m1[1];
Tmp106 = M_m1[2];
Tmp107 = ((Tmp105 + Tmp106) == 0);
assert Tmp107;
Tmp108 = M_m1[0];
Tmp109 = M_m1[1];
assert (Tmp108 < Tmp109);
M_m1[0] = 3;
Tmp110 = M_m1[0];
Tmp111 = M_m1[1];
assert (Tmp110 <= Tmp111);
Tmp112 = M_m1[1];
Tmp113 = M_m1[2];
assert (Tmp112 > Tmp113);
M_m1[4] = 3;
Tmp114 = M_m1[1];
Tmp115 = M_m1[4];
assert (Tmp114 >= Tmp115);
M_m3[0] = true;
M_m3[2] = false;
Tmp116 = M_m3[0];
Tmp117 = M_m3[2];
Tmp118 = (Tmp116 == !(Tmp117));
assert Tmp118;
Tmp119 = (sizeof(M_m3) == 2);
assert Tmp119;
M_s += (0, 1);
M_tmp3[0] = M_s;
Tmp120 = (M_s, M_tmp3);
M_t = Tmp120;
M_t.0 += (0, 2);
Tmp121 = M_t.0[0];
Tmp122 = (Tmp121 == 2);
assert Tmp122;
M_t.0 += (1, 2);
Tmp123 = M_t.0[1];
Tmp124 = (Tmp123 == 2);
assert Tmp124;
M_t.0 += (0, 3);
Tmp125 = M_t.0[0];
Tmp126 = (Tmp125 == 3);
assert Tmp126;
Tmp127 = M_t.0[1];
Tmp128 = (Tmp127 == 2);
assert Tmp128;
Tmp129 = M_s[0];
Tmp130 = (Tmp129 == 1);
assert Tmp130;
Tmp132 = M_tmp3[0];
Tmp131 = Tmp132[0];
Tmp133 = (Tmp131 == 1);
assert Tmp133;
Tmp135 = M_t.1[0];
Tmp134 = Tmp135[0];
Tmp136 = (Tmp134 == 1);
assert Tmp136;
M_s += (0, 2);
Tmp137 = M_s[0];
Tmp138 = (Tmp137 == 2);
Tmp139 = M_s[1];
Tmp140 = (Tmp139 == 1);
assert (Tmp138 && Tmp140);
Tmp142 = M_tmp3[0];
Tmp141 = Tmp142[0];
Tmp143 = (Tmp141 == 1);
assert Tmp143;
Tmp145 = M_t.1[0];
Tmp144 = Tmp145[0];
Tmp146 = (Tmp144 == 1);
assert Tmp146;
M_tmp3[0] = M_s;
Tmp148 = M_tmp3[0];
Tmp147 = Tmp148[0];
Tmp149 = (Tmp147 == 2);
assert Tmp149;
Tmp151 = M_t.1[0];
Tmp150 = Tmp151[0];
Tmp152 = (Tmp150 == 1);
assert Tmp152;
Tmp153 = (0, 0);
M_s4 += (0, Tmp153);
Tmp154 = (1, 1);
M_s4 += (1, Tmp154);
Tmp155 = (2, 2);
M_s4 += (2, Tmp155);
Tmp156 = (1, 2);
M_s8 += (0, Tmp156);
Tmp157 = (2, 3);
M_s8 += (1, Tmp157);
Tmp158 = (3, 4);
M_s8 += (2, Tmp158);
Tmp159 = M_s4[0];
Tmp160 = M_s8[1];
Tmp161 = M_s8[2];
Tmp162 = (((Tmp159.0 + Tmp160.1) - Tmp161.0) == 0);
assert Tmp162;
Tmp163 = M_s4[1];
Tmp164 = M_s8[1];
Tmp165 = M_s8[2];
Tmp166 = (((Tmp163.0 * Tmp164.1) / Tmp165.0) == 1);
assert Tmp166;
raise halt;
}
fun M_S_exit0_rand_1256018301()
{


;

}start 
 state M_S
{
entry  {
M_S_entry56();
}
exit  {
M_S_exit0_rand_1256018301();
}
}
}

machine Test
{
var Test_ss: seq[int];

fun Test_init_entry200(Test_init_entry200_payload: seq[int])
{
var Tmp167: int;
var Tmp168: bool;


Test_ss = Test_init_entry200_payload;
Tmp167 = Test_ss[0];
Tmp168 = (Tmp167 == 3);
assert Tmp168;
}
fun Test_init_exit0_rand_1048870658()
{


;

}start 
 state Test_init
{
entry (payload: seq[int]) {
Test_init_entry200(payload);
}
exit  {
Test_init_exit0_rand_1048870658();
}
}
}

