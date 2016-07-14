event halt;
event null;
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
var _tmp100: bool;
var _tmp101: int;
var _tmp102: seq[int];
var _tmp103: bool;
var _tmp104: int;
var _tmp105: int;
var _tmp106: int;
var _tmp107: bool;
var _tmp108: int;
var _tmp109: int;
var _tmp110: int;
var _tmp111: int;
var _tmp112: int;
var _tmp113: int;
var _tmp114: int;
var _tmp115: int;
var _tmp116: bool;
var _tmp117: bool;
var _tmp118: bool;
var _tmp119: bool;
var _tmp120: (seq[int], map[int, seq[int]]);
var _tmp121: int;
var _tmp122: bool;
var _tmp123: int;
var _tmp124: bool;
var _tmp125: int;
var _tmp126: bool;
var _tmp127: int;
var _tmp128: bool;
var _tmp129: int;
var _tmp130: bool;
var _tmp131: int;
var _tmp132: seq[int];
var _tmp133: bool;
var _tmp134: int;
var _tmp135: seq[int];
var _tmp136: bool;
var _tmp137: int;
var _tmp138: bool;
var _tmp139: int;
var _tmp140: bool;
var _tmp141: int;
var _tmp142: seq[int];
var _tmp143: bool;
var _tmp144: int;
var _tmp145: seq[int];
var _tmp146: bool;
var _tmp147: int;
var _tmp148: seq[int];
var _tmp149: bool;
var _tmp150: int;
var _tmp151: seq[int];
var _tmp152: bool;
var _tmp153: (int, int);
var _tmp154: (int, int);
var _tmp155: (int, int);
var _tmp156: (int, int);
var _tmp157: (int, int);
var _tmp158: (int, int);
var _tmp159: (int, int);
var _tmp160: (int, int);
var _tmp161: (int, int);
var _tmp162: bool;
var _tmp163: (int, int);
var _tmp164: (int, int);
var _tmp165: (int, int);
var _tmp166: bool;
var _tmp76: bool;
var _tmp77: bool;
var _tmp78: bool;
var _tmp79: bool;
var _tmp80: bool;
var _tmp81: bool;
var _tmp82: bool;
var _tmp83: bool;
var _tmp84: bool;
var _tmp85: bool;
var _tmp86: bool;
var _tmp87: bool;
var _tmp88: bool;
var _tmp89: bool;
var _tmp90: bool;
var _tmp91: bool;
var _tmp92: bool;
var _tmp93: bool;
var _tmp94: bool;
var _tmp95: bool;
var _tmp96: bool;
var _tmp97: int;
var _tmp98: int;
var _tmp99: bool;


M_tbool.0 = true;

M_tbool.1 = !(M_tbool.0);

_tmp76 = (M_tbool.1 == false);

assert _tmp76;

_tmp77 = (M_tbool.1 == false);

assert (M_tbool.0 && _tmp77);

_tmp78 = (M_tbool.1 == true);

assert (M_tbool.0 || _tmp78);

_tmp79 = (M_tbool.0 == M_tbool.1);

assert !(_tmp79);

M_ev = E;

_tmp80 = (M_ev == null);

assert !(_tmp80);

M_tt.0 = 1;

M_tt.1 = ~(M_tt.0);

_tmp81 = ((M_tt.0 + M_tt.1) == 0);

assert _tmp81;

_tmp82 = ((M_tt.0 - M_tt.1) == 2);

assert _tmp82;

_tmp83 = ((M_tt.0 * M_tt.1) == ~(1));

assert _tmp83;

_tmp84 = ((M_tt.0 / M_tt.1) == ~(1));

assert _tmp84;

_tmp85 = (((M_tt.0 * 5) / 2) == 2);

assert _tmp85;

_tmp86 = (M_tt.0 == M_tt.1);

assert !(_tmp86);

M_a = null;

_tmp87 = (M_tt.1 == M_a);

assert !(_tmp87);

M_a = ~(1);

_tmp88 = (M_tt.1 == M_a);

assert _tmp88;

_tmp89 = (M_a == M_ev);

assert !(_tmp89);

M_a = null;

_tmp90 = (M_mac == M_a);

assert _tmp90;

M_a = 1;

M_a = !(M_tbool.0);

_tmp91 = (M_a == M_tbool.1);

assert _tmp91;

M_a = null;

_tmp92 = (M_a == 1);

assert !(_tmp92);

M_a = 1;

_tmp93 = (M_a == 1);

assert _tmp93;

M_s12 += (0, true);

_tmp94 = M_s12[0];

M_s12 += (1, !(_tmp94));

_tmp95 = M_s12[1];

_tmp96 = (_tmp95 == false);

assert _tmp96;

M_s2 += (0, 1);

_tmp97 = M_s2[0];

M_s2 += (1, ~(_tmp97));

_tmp98 = M_s2[1];

_tmp99 = (_tmp98 == ~(1));

assert _tmp99;

M_m1[0] = 1;

_tmp100 = (0 in M_m1);

assert _tmp100;

_tmp102 = keys(M_m1);

_tmp101 = _tmp102[0];

M_i = _tmp101;

_tmp103 = (M_i == 0);

assert _tmp103;

M_m1[1] = 3;

_tmp104 = M_m1[1];

M_m1[2] = ~(_tmp104);

_tmp105 = M_m1[1];

_tmp106 = M_m1[2];

_tmp107 = ((_tmp105 + _tmp106) == 0);

assert _tmp107;

_tmp108 = M_m1[0];

_tmp109 = M_m1[1];

assert (_tmp108 < _tmp109);

M_m1[0] = 3;

_tmp110 = M_m1[0];

_tmp111 = M_m1[1];

assert (_tmp110 <= _tmp111);

_tmp112 = M_m1[1];

_tmp113 = M_m1[2];

assert (_tmp112 > _tmp113);

M_m1[4] = 3;

_tmp114 = M_m1[1];

_tmp115 = M_m1[4];

assert (_tmp114 >= _tmp115);

M_m3[0] = true;

M_m3[2] = false;

_tmp116 = M_m3[0];

_tmp117 = M_m3[2];

_tmp118 = (_tmp116 == !(_tmp117));

assert _tmp118;

_tmp119 = (sizeof(M_m3) == 2);

assert _tmp119;

M_s += (0, 1);

M_tmp3[0] = M_s;

_tmp120 = (M_s, M_tmp3);

M_t = _tmp120;

M_t.0 += (0, 2);

_tmp121 = M_t.0[0];

_tmp122 = (_tmp121 == 2);

assert _tmp122;

M_t.0 += (1, 2);

_tmp123 = M_t.0[1];

_tmp124 = (_tmp123 == 2);

assert _tmp124;

M_t.0 += (0, 3);

_tmp125 = M_t.0[0];

_tmp126 = (_tmp125 == 3);

assert _tmp126;

_tmp127 = M_t.0[1];

_tmp128 = (_tmp127 == 2);

assert _tmp128;

_tmp129 = M_s[0];

_tmp130 = (_tmp129 == 1);

assert _tmp130;

_tmp132 = M_tmp3[0];

_tmp131 = _tmp132[0];

_tmp133 = (_tmp131 == 1);

assert _tmp133;

_tmp135 = M_t.1[0];

_tmp134 = _tmp135[0];

_tmp136 = (_tmp134 == 1);

assert _tmp136;

M_s += (0, 2);

_tmp137 = M_s[0];

_tmp138 = (_tmp137 == 2);

_tmp139 = M_s[1];

_tmp140 = (_tmp139 == 1);

assert (_tmp138 && _tmp140);

_tmp142 = M_tmp3[0];

_tmp141 = _tmp142[0];

_tmp143 = (_tmp141 == 1);

assert _tmp143;

_tmp145 = M_t.1[0];

_tmp144 = _tmp145[0];

_tmp146 = (_tmp144 == 1);

assert _tmp146;

M_tmp3[0] = M_s;

_tmp148 = M_tmp3[0];

_tmp147 = _tmp148[0];

_tmp149 = (_tmp147 == 2);

assert _tmp149;

_tmp151 = M_t.1[0];

_tmp150 = _tmp151[0];

_tmp152 = (_tmp150 == 1);

assert _tmp152;

_tmp153 = (0, 0);

M_s4 += (0, _tmp153);

_tmp154 = (1, 1);

M_s4 += (1, _tmp154);

_tmp155 = (2, 2);

M_s4 += (2, _tmp155);

_tmp156 = (1, 2);

M_s8 += (0, _tmp156);

_tmp157 = (2, 3);

M_s8 += (1, _tmp157);

_tmp158 = (3, 4);

M_s8 += (2, _tmp158);

_tmp159 = M_s4[0];

_tmp160 = M_s8[1];

_tmp161 = M_s8[2];

_tmp162 = (((_tmp159.0 + _tmp160.1) - _tmp161.0) == 0);

assert _tmp162;

_tmp163 = M_s4[1];

_tmp164 = M_s8[1];

_tmp165 = M_s8[2];

_tmp166 = (((_tmp163.0 * _tmp164.1) / _tmp165.0) == 1);

assert _tmp166;

raise halt;


}
fun M_S_exit0_rand_419428920()
{


;


}start  state M_S
{entry  {
M_S_entry56();
}
exit  {
M_S_exit0_rand_419428920();
}
}
}

machine Test
{
var Test_ss: seq[int];

fun Test_init_entry200(Test_init_entry200_payload: seq[int])
{
var _tmp167: int;
var _tmp168: bool;


Test_ss = Test_init_entry200_payload;

_tmp167 = Test_ss[0];

_tmp168 = (_tmp167 == 3);

assert _tmp168;


}
fun Test_init_exit0_rand_2122308970()
{


;


}start  state Test_init
{entry (payload: seq[int]) {
Test_init_entry200(payload);
}
exit  {
Test_init_exit0_rand_2122308970();
}
}
}

