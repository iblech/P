event E  assert 1;

main machine M
{
var M_t: (seq[int], map[int, seq[int]]);
var M_ts: (int, int);
var M_tt: (int, int);
var M_y: int;
var M_tmp: int;
var M_tmp1: int;
var M_tmp2: (seq[any], map[int, seq[any]]);
var M_tmp3: map[int, seq[int]];
var M_s: seq[int];
var M_s1: seq[any];
var M_s2: seq[int];
var M_i: int;
var M_mac: machine;
var M_m1: map[int, int];
var M_m2: map[int, map[int, int]];
var M_m3: map[int, bool];

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
fun M_S_entry28(M_S_entry28__payload_0: any)
{
var _tmp367: bool;
var _tmp368: bool;
var _tmp369: int;
var _tmp370: bool;
var _tmp371: int;
var _tmp372: bool;
var _tmp373: bool;


M_s += (0, 1);
;
M_s += (1, 2);
;
M_s1 = M_s;
;
M_s -= 0;
;
_tmp367 = (sizeof(M_s) == 1);
;
assert _tmp367;
;
M_s -= 0;
;
_tmp368 = (sizeof(M_s) == 0);
;
assert _tmp368;
;
M_s += (0, 5);
;
M_s += (0, 6);
;
_tmp369 = M_s[0];
;
_tmp370 = (_tmp369 == 6);
;
assert _tmp370;
;
_tmp371 = M_s[1];
;
_tmp372 = (_tmp371 == 5);
;
assert _tmp372;
;
M_s -= 1;
;
_tmp373 = (sizeof(M_s) == 1);
;
assert _tmp373;
;
raise halt;


}
fun M_S_exit0_rand_1749707999()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry28(payload);
}
exit  {
M_S_exit0_rand_1749707999();
}
}
}

machine Test
{
var Test_ss: seq[int];

fun Test_init_entry75(Test_init_entry75_payload: seq[int])
{
var _tmp374: int;
var _tmp375: bool;


Test_ss = Test_init_entry75_payload;
;
_tmp374 = Test_ss[0];
;
_tmp375 = (_tmp374 == 3);
;
assert _tmp375;


}
fun Test_init_exit0_rand_1995984468()
{


;


}start  state Test_init
{entry (payload: seq[int]) {
Test_init_entry75(payload);
}
exit  {
Test_init_exit0_rand_1995984468();
}
}
}

