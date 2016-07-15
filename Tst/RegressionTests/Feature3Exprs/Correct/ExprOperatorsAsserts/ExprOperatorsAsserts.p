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
var _tmp0: bool;
var _tmp1: bool;
var _tmp10: bool;
var _tmp11: bool;
var _tmp12: bool;
var _tmp13: bool;
var _tmp14: bool;
var _tmp15: bool;
var _tmp16: bool;
var _tmp17: bool;
var _tmp18: bool;
var _tmp19: bool;
var _tmp2: bool;
var _tmp20: bool;
var _tmp21: int;
var _tmp22: int;
var _tmp23: bool;
var _tmp24: bool;
var _tmp25: int;
var _tmp26: seq[int];
var _tmp27: bool;
var _tmp28: int;
var _tmp29: int;
var _tmp3: bool;
var _tmp30: int;
var _tmp31: bool;
var _tmp32: int;
var _tmp33: int;
var _tmp34: int;
var _tmp35: int;
var _tmp36: int;
var _tmp37: int;
var _tmp38: int;
var _tmp39: int;
var _tmp4: bool;
var _tmp40: bool;
var _tmp41: bool;
var _tmp42: bool;
var _tmp43: bool;
var _tmp44: (seq[int], map[int, seq[int]]);
var _tmp45: int;
var _tmp46: bool;
var _tmp47: int;
var _tmp48: bool;
var _tmp49: int;
var _tmp5: bool;
var _tmp50: bool;
var _tmp51: int;
var _tmp52: bool;
var _tmp53: int;
var _tmp54: bool;
var _tmp55: int;
var _tmp56: seq[int];
var _tmp57: bool;
var _tmp58: int;
var _tmp59: seq[int];
var _tmp6: bool;
var _tmp60: bool;
var _tmp61: int;
var _tmp62: bool;
var _tmp63: int;
var _tmp64: bool;
var _tmp65: int;
var _tmp66: seq[int];
var _tmp67: bool;
var _tmp68: int;
var _tmp69: seq[int];
var _tmp7: bool;
var _tmp70: bool;
var _tmp71: int;
var _tmp72: seq[int];
var _tmp73: bool;
var _tmp74: int;
var _tmp75: seq[int];
var _tmp76: bool;
var _tmp77: (int, int);
var _tmp78: (int, int);
var _tmp79: (int, int);
var _tmp8: bool;
var _tmp80: (int, int);
var _tmp81: (int, int);
var _tmp82: (int, int);
var _tmp83: (int, int);
var _tmp84: (int, int);
var _tmp85: (int, int);
var _tmp86: bool;
var _tmp87: (int, int);
var _tmp88: (int, int);
var _tmp89: (int, int);
var _tmp9: bool;
var _tmp90: bool;


M_tbool.0 = true;
M_tbool.1 = !(M_tbool.0);
_tmp0 = (M_tbool.1 == false);
assert _tmp0;
_tmp1 = (M_tbool.1 == false);
assert (M_tbool.0 && _tmp1);
_tmp2 = (M_tbool.1 == true);
assert (M_tbool.0 || _tmp2);
_tmp3 = (M_tbool.0 == M_tbool.1);
assert !(_tmp3);
M_ev = E;
_tmp4 = (M_ev == null);
assert !(_tmp4);
M_tt.0 = 1;
M_tt.1 = -(M_tt.0);
_tmp5 = ((M_tt.0 + M_tt.1) == 0);
assert _tmp5;
_tmp6 = ((M_tt.0 - M_tt.1) == 2);
assert _tmp6;
_tmp7 = ((M_tt.0 * M_tt.1) == -(1));
assert _tmp7;
_tmp8 = ((M_tt.0 / M_tt.1) == -(1));
assert _tmp8;
_tmp9 = (((M_tt.0 * 5) / 2) == 2);
assert _tmp9;
_tmp10 = (M_tt.0 == M_tt.1);
assert !(_tmp10);
M_a = null;
_tmp11 = (M_tt.1 == M_a);
assert !(_tmp11);
M_a = -(1);
_tmp12 = (M_tt.1 == M_a);
assert _tmp12;
_tmp13 = (M_a == M_ev);
assert !(_tmp13);
M_a = null;
_tmp14 = (M_mac == M_a);
assert _tmp14;
M_a = 1;
M_a = !(M_tbool.0);
_tmp15 = (M_a == M_tbool.1);
assert _tmp15;
M_a = null;
_tmp16 = (M_a == 1);
assert !(_tmp16);
M_a = 1;
_tmp17 = (M_a == 1);
assert _tmp17;
M_s12 += (0, true);
_tmp18 = M_s12[0];
M_s12 += (1, !(_tmp18));
_tmp19 = M_s12[1];
_tmp20 = (_tmp19 == false);
assert _tmp20;
M_s2 += (0, 1);
_tmp21 = M_s2[0];
M_s2 += (1, -(_tmp21));
_tmp22 = M_s2[1];
_tmp23 = (_tmp22 == -(1));
assert _tmp23;
M_m1[0] = 1;
_tmp24 = (0 in M_m1);
assert _tmp24;
_tmp26 = keys(M_m1);
_tmp25 = _tmp26[0];
M_i = _tmp25;
_tmp27 = (M_i == 0);
assert _tmp27;
M_m1[1] = 3;
_tmp28 = M_m1[1];
M_m1[2] = -(_tmp28);
_tmp29 = M_m1[1];
_tmp30 = M_m1[2];
_tmp31 = ((_tmp29 + _tmp30) == 0);
assert _tmp31;
_tmp32 = M_m1[0];
_tmp33 = M_m1[1];
assert (_tmp32 < _tmp33);
M_m1[0] = 3;
_tmp34 = M_m1[0];
_tmp35 = M_m1[1];
assert (_tmp34 <= _tmp35);
_tmp36 = M_m1[1];
_tmp37 = M_m1[2];
assert (_tmp36 > _tmp37);
M_m1[4] = 3;
_tmp38 = M_m1[1];
_tmp39 = M_m1[4];
assert (_tmp38 >= _tmp39);
M_m3[0] = true;
M_m3[2] = false;
_tmp40 = M_m3[0];
_tmp41 = M_m3[2];
_tmp42 = (_tmp40 == !(_tmp41));
assert _tmp42;
_tmp43 = (sizeof(M_m3) == 2);
assert _tmp43;
M_s += (0, 1);
M_tmp3[0] = M_s;
_tmp44 = (M_s, M_tmp3);
M_t = _tmp44;
M_t.0 += (0, 2);
_tmp45 = M_t.0[0];
_tmp46 = (_tmp45 == 2);
assert _tmp46;
M_t.0 += (1, 2);
_tmp47 = M_t.0[1];
_tmp48 = (_tmp47 == 2);
assert _tmp48;
M_t.0 += (0, 3);
_tmp49 = M_t.0[0];
_tmp50 = (_tmp49 == 3);
assert _tmp50;
_tmp51 = M_t.0[1];
_tmp52 = (_tmp51 == 2);
assert _tmp52;
_tmp53 = M_s[0];
_tmp54 = (_tmp53 == 1);
assert _tmp54;
_tmp56 = M_tmp3[0];
_tmp55 = _tmp56[0];
_tmp57 = (_tmp55 == 1);
assert _tmp57;
_tmp59 = M_t.1[0];
_tmp58 = _tmp59[0];
_tmp60 = (_tmp58 == 1);
assert _tmp60;
M_s += (0, 2);
_tmp61 = M_s[0];
_tmp62 = (_tmp61 == 2);
_tmp63 = M_s[1];
_tmp64 = (_tmp63 == 1);
assert (_tmp62 && _tmp64);
_tmp66 = M_tmp3[0];
_tmp65 = _tmp66[0];
_tmp67 = (_tmp65 == 1);
assert _tmp67;
_tmp69 = M_t.1[0];
_tmp68 = _tmp69[0];
_tmp70 = (_tmp68 == 1);
assert _tmp70;
M_tmp3[0] = M_s;
_tmp72 = M_tmp3[0];
_tmp71 = _tmp72[0];
_tmp73 = (_tmp71 == 2);
assert _tmp73;
_tmp75 = M_t.1[0];
_tmp74 = _tmp75[0];
_tmp76 = (_tmp74 == 1);
assert _tmp76;
_tmp77 = (0, 0);
M_s4 += (0, _tmp77);
_tmp78 = (1, 1);
M_s4 += (1, _tmp78);
_tmp79 = (2, 2);
M_s4 += (2, _tmp79);
_tmp80 = (1, 2);
M_s8 += (0, _tmp80);
_tmp81 = (2, 3);
M_s8 += (1, _tmp81);
_tmp82 = (3, 4);
M_s8 += (2, _tmp82);
_tmp83 = M_s4[0];
_tmp84 = M_s8[1];
_tmp85 = M_s8[2];
_tmp86 = (((_tmp83.0 + _tmp84.1) - _tmp85.0) == 0);
assert _tmp86;
_tmp87 = M_s4[1];
_tmp88 = M_s8[1];
_tmp89 = M_s8[2];
_tmp90 = (((_tmp87.0 * _tmp88.1) / _tmp89.0) == 1);
assert _tmp90;
raise halt;
}
fun M_S_exit0_rand_1424056736()
{


;

}start 
 state M_S
{
entry  {
M_S_entry56();
}
exit  {
M_S_exit0_rand_1424056736();
}
}
}

machine Test
{
var Test_ss: seq[int];

fun Test_init_entry200(Test_init_entry200_payload: seq[int])
{
var _tmp91: int;
var _tmp92: bool;


Test_ss = Test_init_entry200_payload;
_tmp91 = Test_ss[0];
_tmp92 = (_tmp91 == 3);
assert _tmp92;
}
fun Test_init_exit0_rand_1558484730()
{


;

}start 
 state Test_init
{
entry (payload: seq[int]) {
Test_init_entry200(payload);
}
exit  {
Test_init_exit0_rand_1558484730();
}
}
}

