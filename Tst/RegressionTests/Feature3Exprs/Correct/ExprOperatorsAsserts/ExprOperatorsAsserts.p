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
;
return (M_y);


}
fun M_S_entry56(M_S_entry56__payload_0: any)
{
var _tmp100: bool;
var _tmp101: bool;
var _tmp102: bool;
var _tmp103: bool;
var _tmp104: bool;
var _tmp105: bool;
var _tmp106: bool;
var _tmp107: bool;
var _tmp108: bool;
var _tmp109: bool;
var _tmp110: bool;
var _tmp111: bool;
var _tmp112: bool;
var _tmp113: bool;
var _tmp114: int;
var _tmp115: int;
var _tmp116: bool;
var _tmp117: bool;
var _tmp118: int;
var _tmp119: seq[int];
var _tmp120: bool;
var _tmp121: int;
var _tmp122: int;
var _tmp123: int;
var _tmp124: bool;
var _tmp125: int;
var _tmp126: int;
var _tmp127: int;
var _tmp128: int;
var _tmp129: int;
var _tmp130: int;
var _tmp131: int;
var _tmp132: int;
var _tmp133: bool;
var _tmp134: bool;
var _tmp135: bool;
var _tmp136: bool;
var _tmp137: (seq[int], map[int, seq[int]]);
var _tmp138: int;
var _tmp139: bool;
var _tmp140: int;
var _tmp141: bool;
var _tmp142: int;
var _tmp143: bool;
var _tmp144: int;
var _tmp145: bool;
var _tmp146: int;
var _tmp147: bool;
var _tmp148: int;
var _tmp149: seq[int];
var _tmp150: bool;
var _tmp151: int;
var _tmp152: seq[int];
var _tmp153: bool;
var _tmp154: int;
var _tmp155: bool;
var _tmp156: int;
var _tmp157: bool;
var _tmp158: int;
var _tmp159: seq[int];
var _tmp160: bool;
var _tmp161: int;
var _tmp162: seq[int];
var _tmp163: bool;
var _tmp164: int;
var _tmp165: seq[int];
var _tmp166: bool;
var _tmp167: int;
var _tmp168: seq[int];
var _tmp169: bool;
var _tmp170: (int, int);
var _tmp171: (int, int);
var _tmp172: (int, int);
var _tmp173: (int, int);
var _tmp174: (int, int);
var _tmp175: (int, int);
var _tmp176: (int, int);
var _tmp177: (int, int);
var _tmp178: (int, int);
var _tmp179: bool;
var _tmp180: (int, int);
var _tmp181: (int, int);
var _tmp182: (int, int);
var _tmp183: bool;
var _tmp93: bool;
var _tmp94: bool;
var _tmp95: bool;
var _tmp96: bool;
var _tmp97: bool;
var _tmp98: bool;
var _tmp99: bool;


M_tbool.0 = true;
;
M_tbool.1 = !(M_tbool.0);
;
_tmp93 = (M_tbool.1 == false);
;
assert _tmp93;
;
_tmp94 = (M_tbool.1 == false);
;
assert (M_tbool.0 && _tmp94);
;
_tmp95 = (M_tbool.1 == true);
;
assert (M_tbool.0 || _tmp95);
;
_tmp96 = (M_tbool.0 == M_tbool.1);
;
assert !(_tmp96);
;
M_ev = E;
;
_tmp97 = (M_ev == null);
;
assert !(_tmp97);
;
M_tt.0 = 1;
;
M_tt.1 = ~(M_tt.0);
;
_tmp98 = ((M_tt.0 + M_tt.1) == 0);
;
assert _tmp98;
;
_tmp99 = ((M_tt.0 - M_tt.1) == 2);
;
assert _tmp99;
;
_tmp100 = ((M_tt.0 * M_tt.1) == ~(1));
;
assert _tmp100;
;
_tmp101 = ((M_tt.0 / M_tt.1) == ~(1));
;
assert _tmp101;
;
_tmp102 = (((M_tt.0 * 5) / 2) == 2);
;
assert _tmp102;
;
_tmp103 = (M_tt.0 == M_tt.1);
;
assert !(_tmp103);
;
M_a = null;
;
_tmp104 = (M_tt.1 == M_a);
;
assert !(_tmp104);
;
M_a = ~(1);
;
_tmp105 = (M_tt.1 == M_a);
;
assert _tmp105;
;
_tmp106 = (M_a == M_ev);
;
assert !(_tmp106);
;
M_a = null;
;
_tmp107 = (M_mac == M_a);
;
assert _tmp107;
;
M_a = 1;
;
M_a = !(M_tbool.0);
;
_tmp108 = (M_a == M_tbool.1);
;
assert _tmp108;
;
M_a = null;
;
_tmp109 = (M_a == 1);
;
assert !(_tmp109);
;
M_a = 1;
;
_tmp110 = (M_a == 1);
;
assert _tmp110;
;
M_s12 += (0, true);
;
_tmp111 = M_s12[0];
;
M_s12 += (1, !(_tmp111));
;
_tmp112 = M_s12[1];
;
_tmp113 = (_tmp112 == false);
;
assert _tmp113;
;
M_s2 += (0, 1);
;
_tmp114 = M_s2[0];
;
M_s2 += (1, ~(_tmp114));
;
_tmp115 = M_s2[1];
;
_tmp116 = (_tmp115 == ~(1));
;
assert _tmp116;
;
M_m1[0] = 1;
;
_tmp117 = (0 in M_m1);
;
assert _tmp117;
;
_tmp119 = keys(M_m1);
;
_tmp118 = _tmp119[0];
;
M_i = _tmp118;
;
_tmp120 = (M_i == 0);
;
assert _tmp120;
;
M_m1[1] = 3;
;
_tmp121 = M_m1[1];
;
M_m1[2] = ~(_tmp121);
;
_tmp122 = M_m1[1];
;
_tmp123 = M_m1[2];
;
_tmp124 = ((_tmp122 + _tmp123) == 0);
;
assert _tmp124;
;
_tmp125 = M_m1[0];
;
_tmp126 = M_m1[1];
;
assert (_tmp125 < _tmp126);
;
M_m1[0] = 3;
;
_tmp127 = M_m1[0];
;
_tmp128 = M_m1[1];
;
assert (_tmp127 <= _tmp128);
;
_tmp129 = M_m1[1];
;
_tmp130 = M_m1[2];
;
assert (_tmp129 > _tmp130);
;
M_m1[4] = 3;
;
_tmp131 = M_m1[1];
;
_tmp132 = M_m1[4];
;
assert (_tmp131 >= _tmp132);
;
M_m3[0] = true;
;
M_m3[2] = false;
;
_tmp133 = M_m3[0];
;
_tmp134 = M_m3[2];
;
_tmp135 = (_tmp133 == !(_tmp134));
;
assert _tmp135;
;
_tmp136 = (sizeof(M_m3) == 2);
;
assert _tmp136;
;
M_s += (0, 1);
;
M_tmp3[0] = M_s;
;
_tmp137 = (M_s, M_tmp3);
;
M_t = _tmp137;
;
M_t.0 += (0, 2);
;
_tmp138 = M_t.0[0];
;
_tmp139 = (_tmp138 == 2);
;
assert _tmp139;
;
M_t.0 += (1, 2);
;
_tmp140 = M_t.0[1];
;
_tmp141 = (_tmp140 == 2);
;
assert _tmp141;
;
M_t.0 += (0, 3);
;
_tmp142 = M_t.0[0];
;
_tmp143 = (_tmp142 == 3);
;
assert _tmp143;
;
_tmp144 = M_t.0[1];
;
_tmp145 = (_tmp144 == 2);
;
assert _tmp145;
;
_tmp146 = M_s[0];
;
_tmp147 = (_tmp146 == 1);
;
assert _tmp147;
;
_tmp149 = M_tmp3[0];
;
_tmp148 = _tmp149[0];
;
_tmp150 = (_tmp148 == 1);
;
assert _tmp150;
;
_tmp152 = M_t.1[0];
;
_tmp151 = _tmp152[0];
;
_tmp153 = (_tmp151 == 1);
;
assert _tmp153;
;
M_s += (0, 2);
;
_tmp154 = M_s[0];
;
_tmp155 = (_tmp154 == 2);
;
_tmp156 = M_s[1];
;
_tmp157 = (_tmp156 == 1);
;
assert (_tmp155 && _tmp157);
;
_tmp159 = M_tmp3[0];
;
_tmp158 = _tmp159[0];
;
_tmp160 = (_tmp158 == 1);
;
assert _tmp160;
;
_tmp162 = M_t.1[0];
;
_tmp161 = _tmp162[0];
;
_tmp163 = (_tmp161 == 1);
;
assert _tmp163;
;
M_tmp3[0] = M_s;
;
_tmp165 = M_tmp3[0];
;
_tmp164 = _tmp165[0];
;
_tmp166 = (_tmp164 == 2);
;
assert _tmp166;
;
_tmp168 = M_t.1[0];
;
_tmp167 = _tmp168[0];
;
_tmp169 = (_tmp167 == 1);
;
assert _tmp169;
;
_tmp170 = (0, 0);
;
M_s4 += (0, _tmp170);
;
_tmp171 = (1, 1);
;
M_s4 += (1, _tmp171);
;
_tmp172 = (2, 2);
;
M_s4 += (2, _tmp172);
;
_tmp173 = (1, 2);
;
M_s8 += (0, _tmp173);
;
_tmp174 = (2, 3);
;
M_s8 += (1, _tmp174);
;
_tmp175 = (3, 4);
;
M_s8 += (2, _tmp175);
;
_tmp176 = M_s4[0];
;
_tmp177 = M_s8[1];
;
_tmp178 = M_s8[2];
;
_tmp179 = (((_tmp176.0 + _tmp177.1) - _tmp178.0) == 0);
;
assert _tmp179;
;
_tmp180 = M_s4[1];
;
_tmp181 = M_s8[1];
;
_tmp182 = M_s8[2];
;
_tmp183 = (((_tmp180.0 * _tmp181.1) / _tmp182.0) == 1);
;
assert _tmp183;
;
raise halt;


}
fun M_S_exit0_rand_1626526164()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry56(payload);
}
exit  {
M_S_exit0_rand_1626526164();
}
}
}

machine Test
{
var Test_ss: seq[int];

fun Test_init_entry200(Test_init_entry200_payload: seq[int])
{
var _tmp184: int;
var _tmp185: bool;


Test_ss = Test_init_entry200_payload;
;
_tmp184 = Test_ss[0];
;
_tmp185 = (_tmp184 == 3);
;
assert _tmp185;


}
fun Test_init_exit0_rand_2007576740()
{


;


}start  state Test_init
{entry (payload: seq[int]) {
Test_init_entry200(payload);
}
exit  {
Test_init_exit0_rand_2007576740();
}
}
}

