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


;

return (1);
}
fun M_GetT(): (seq[int], map[int, seq[int]])
{


;

return (M_t);
}
fun M_IncY(): int
{


;

M_y = (M_y + 1);
;

return (M_y);
}
fun M_S_entry56(M_S_entry56__payload_0: null)
{
var Tmp120: bool;
var Tmp121: bool;
var Tmp122: bool;
var Tmp123: bool;
var Tmp124: bool;
var Tmp125: bool;
var Tmp126: bool;
var Tmp127: bool;
var Tmp128: bool;
var Tmp129: bool;
var Tmp130: bool;
var Tmp131: bool;
var Tmp132: bool;
var Tmp133: bool;
var Tmp134: bool;
var Tmp135: bool;
var Tmp136: bool;
var Tmp137: bool;
var Tmp138: bool;
var Tmp139: bool;
var Tmp140: bool;
var Tmp141: int;
var Tmp142: int;
var Tmp143: bool;
var Tmp144: bool;
var Tmp145: int;
var Tmp146: seq[int];
var Tmp147: bool;
var Tmp148: int;
var Tmp149: int;
var Tmp150: int;
var Tmp151: bool;
var Tmp152: int;
var Tmp153: int;
var Tmp154: int;
var Tmp155: int;
var Tmp156: int;
var Tmp157: int;
var Tmp158: int;
var Tmp159: int;
var Tmp160: bool;
var Tmp161: bool;
var Tmp162: bool;
var Tmp163: bool;
var Tmp164: (seq[int], map[int, seq[int]]);
var Tmp165: int;
var Tmp166: bool;
var Tmp167: int;
var Tmp168: bool;
var Tmp169: int;
var Tmp170: bool;
var Tmp171: int;
var Tmp172: bool;
var Tmp173: int;
var Tmp174: bool;
var Tmp175: int;
var Tmp176: seq[int];
var Tmp177: bool;
var Tmp178: int;
var Tmp179: seq[int];
var Tmp180: bool;
var Tmp181: int;
var Tmp182: bool;
var Tmp183: int;
var Tmp184: bool;
var Tmp185: int;
var Tmp186: seq[int];
var Tmp187: bool;
var Tmp188: int;
var Tmp189: seq[int];
var Tmp190: bool;
var Tmp191: int;
var Tmp192: seq[int];
var Tmp193: bool;
var Tmp194: int;
var Tmp195: seq[int];
var Tmp196: bool;
var Tmp197: (int, int);
var Tmp198: (int, int);
var Tmp199: (int, int);
var Tmp200: (int, int);
var Tmp201: (int, int);
var Tmp202: (int, int);
var Tmp203: (int, int);
var Tmp204: (int, int);
var Tmp205: (int, int);
var Tmp206: bool;
var Tmp207: (int, int);
var Tmp208: (int, int);
var Tmp209: (int, int);
var Tmp210: bool;


;

M_tbool.0 = true;
;

M_tbool.1 = !(M_tbool.0);
;

Tmp120 = (M_tbool.1 == false);
assert Tmp120;
;

Tmp121 = (M_tbool.1 == false);
assert (M_tbool.0 && Tmp121);
;

Tmp122 = (M_tbool.1 == true);
assert (M_tbool.0 || Tmp122);
;

Tmp123 = (M_tbool.0 == M_tbool.1);
assert !(Tmp123);
;

M_ev = E;
;

Tmp124 = (M_ev == null);
assert !(Tmp124);
;

M_tt.0 = 1;
;

M_tt.1 = -(M_tt.0);
;

Tmp125 = ((M_tt.0 + M_tt.1) == 0);
assert Tmp125;
;

Tmp126 = ((M_tt.0 - M_tt.1) == 2);
assert Tmp126;
;

Tmp127 = ((M_tt.0 * M_tt.1) == -(1));
assert Tmp127;
;

Tmp128 = ((M_tt.0 / M_tt.1) == -(1));
assert Tmp128;
;

Tmp129 = (((M_tt.0 * 5) / 2) == 2);
assert Tmp129;
;

Tmp130 = (M_tt.0 == M_tt.1);
assert !(Tmp130);
;

M_a = null;
;

Tmp131 = (M_tt.1 == M_a);
assert !(Tmp131);
;

M_a = -(1);
;

Tmp132 = (M_tt.1 == M_a);
assert Tmp132;
;

Tmp133 = (M_a == M_ev);
assert !(Tmp133);
;

M_a = null;
;

Tmp134 = (M_mac == M_a);
assert Tmp134;
;

M_a = 1;
;

M_a = !(M_tbool.0);
;

Tmp135 = (M_a == M_tbool.1);
assert Tmp135;
;

M_a = null;
;

Tmp136 = (M_a == 1);
assert !(Tmp136);
;

M_a = 1;
;

Tmp137 = (M_a == 1);
assert Tmp137;
;

M_s12 += (0, true);
;

Tmp138 = M_s12[0];
M_s12 += (1, !(Tmp138));
;

Tmp139 = M_s12[1];
Tmp140 = (Tmp139 == false);
assert Tmp140;
;

M_s2 += (0, 1);
;

Tmp141 = M_s2[0];
M_s2 += (1, -(Tmp141));
;

Tmp142 = M_s2[1];
Tmp143 = (Tmp142 == -(1));
assert Tmp143;
;

M_m1[0] = 1;
;

Tmp144 = (0 in M_m1);
assert Tmp144;
;

Tmp146 = keys(M_m1);
Tmp145 = Tmp146[0];
M_i = Tmp145;
;

Tmp147 = (M_i == 0);
assert Tmp147;
;

M_m1[1] = 3;
;

Tmp148 = M_m1[1];
M_m1[2] = -(Tmp148);
;

Tmp149 = M_m1[1];
Tmp150 = M_m1[2];
Tmp151 = ((Tmp149 + Tmp150) == 0);
assert Tmp151;
;

Tmp152 = M_m1[0];
Tmp153 = M_m1[1];
assert (Tmp152 < Tmp153);
;

M_m1[0] = 3;
;

Tmp154 = M_m1[0];
Tmp155 = M_m1[1];
assert (Tmp154 <= Tmp155);
;

Tmp156 = M_m1[1];
Tmp157 = M_m1[2];
assert (Tmp156 > Tmp157);
;

M_m1[4] = 3;
;

Tmp158 = M_m1[1];
Tmp159 = M_m1[4];
assert (Tmp158 >= Tmp159);
;

M_m3[0] = true;
;

M_m3[2] = false;
;

Tmp160 = M_m3[0];
Tmp161 = M_m3[2];
Tmp162 = (Tmp160 == !(Tmp161));
assert Tmp162;
;

Tmp163 = (sizeof(M_m3) == 2);
assert Tmp163;
;

M_s += (0, 1);
;

M_tmp3[0] = M_s;
;

Tmp164 = (M_s, M_tmp3);
M_t = Tmp164;
;

M_t.0 += (0, 2);
;

Tmp165 = M_t.0[0];
Tmp166 = (Tmp165 == 2);
assert Tmp166;
;

M_t.0 += (1, 2);
;

Tmp167 = M_t.0[1];
Tmp168 = (Tmp167 == 2);
assert Tmp168;
;

M_t.0 += (0, 3);
;

Tmp169 = M_t.0[0];
Tmp170 = (Tmp169 == 3);
assert Tmp170;
;

Tmp171 = M_t.0[1];
Tmp172 = (Tmp171 == 2);
assert Tmp172;
;

Tmp173 = M_s[0];
Tmp174 = (Tmp173 == 1);
assert Tmp174;
;

Tmp176 = M_tmp3[0];
Tmp175 = Tmp176[0];
Tmp177 = (Tmp175 == 1);
assert Tmp177;
;

Tmp179 = M_t.1[0];
Tmp178 = Tmp179[0];
Tmp180 = (Tmp178 == 1);
assert Tmp180;
;

M_s += (0, 2);
;

Tmp181 = M_s[0];
Tmp182 = (Tmp181 == 2);
Tmp183 = M_s[1];
Tmp184 = (Tmp183 == 1);
assert (Tmp182 && Tmp184);
;

Tmp186 = M_tmp3[0];
Tmp185 = Tmp186[0];
Tmp187 = (Tmp185 == 1);
assert Tmp187;
;

Tmp189 = M_t.1[0];
Tmp188 = Tmp189[0];
Tmp190 = (Tmp188 == 1);
assert Tmp190;
;

M_tmp3[0] = M_s;
;

Tmp192 = M_tmp3[0];
Tmp191 = Tmp192[0];
Tmp193 = (Tmp191 == 2);
assert Tmp193;
;

Tmp195 = M_t.1[0];
Tmp194 = Tmp195[0];
Tmp196 = (Tmp194 == 1);
assert Tmp196;
;

Tmp197 = (0, 0);
M_s4 += (0, Tmp197);
;

Tmp198 = (1, 1);
M_s4 += (1, Tmp198);
;

Tmp199 = (2, 2);
M_s4 += (2, Tmp199);
;

Tmp200 = (1, 2);
M_s8 += (0, Tmp200);
;

Tmp201 = (2, 3);
M_s8 += (1, Tmp201);
;

Tmp202 = (3, 4);
M_s8 += (2, Tmp202);
;

Tmp203 = M_s4[0];
Tmp204 = M_s8[1];
Tmp205 = M_s8[2];
Tmp206 = (((Tmp203.0 + Tmp204.1) - Tmp205.0) == 0);
assert Tmp206;
;

Tmp207 = M_s4[1];
Tmp208 = M_s8[1];
Tmp209 = M_s8[2];
Tmp210 = (((Tmp207.0 * Tmp208.1) / Tmp209.0) == 1);
assert Tmp210;
;

raise halt;
return;
}
fun M_S_exit0_rand_635999076(M_S_exit0_rand_635999076__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry56(payload);
}exit {
M_S_exit0_rand_635999076(null);
}}
}

machine Test
{
var Test_ss: seq[int];

fun Test_init_entry200(Test_init_entry200_payload: seq[int])
{
var Tmp211: int;
var Tmp212: bool;


;

Test_ss = Test_init_entry200_payload;
;

Tmp211 = Test_ss[0];
Tmp212 = (Tmp211 == 3);
assert Tmp212;
return;
}
fun Test_init_exit0_rand_271478836(Test_init_exit0_rand_271478836__payload_skip: any)
{


;

;

return;
}start 
 state Test_init
{
entry (payload: seq[int]) {
Test_init_entry200(payload);
}exit {
Test_init_exit0_rand_271478836(null);
}}
}

