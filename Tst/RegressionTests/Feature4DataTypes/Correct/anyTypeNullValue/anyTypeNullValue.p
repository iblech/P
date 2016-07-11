event E  assert 1;
event E1  assert 1;
event E2  assert 1;
event E3  assert 1;

main machine M
{
var M_y: int;
var M_b: bool;
var M_e: event;
var M_a: any;
var M_mac: machine;

fun M_S_entry23(M_S_entry23__payload_0: any)
{
var _tmp376: bool;
var _tmp377: bool;
var _tmp378: bool;
var _tmp379: bool;
var _tmp380: bool;
var _tmp381: bool;
var _tmp382: bool;
var _tmp383: bool;
var _tmp384: bool;


M_y = 2;
;
_tmp376 = (M_y == 2);
;
assert _tmp376;
;
M_y = default(int);
;
_tmp377 = (M_y == 0);
;
assert _tmp377;
;
M_b = true;
;
_tmp378 = (M_b == true);
;
assert _tmp378;
;
M_b = default(bool);
;
_tmp379 = (M_b == false);
;
assert _tmp379;
;
M_e = E;
;
_tmp380 = (M_e == E);
;
assert _tmp380;
;
M_e = default(event);
;
_tmp381 = (M_e == null);
;
assert _tmp381;
;
M_mac = this;
;
M_mac = default(machine);
;
_tmp382 = (M_mac == null);
;
assert _tmp382;
;
M_a = true;
;
M_a = default(any);
;
_tmp383 = (M_a == null);
;
assert _tmp383;
;
_tmp384 = (M_a == null);
;
if(_tmp384)
{

M_a = 1;
;
M_a = 1;



}
else
{

;
;
;



}
;
;
;
raise halt;


}
fun M_S_exit0_rand_1233958068()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry23(payload);
}
exit  {
M_S_exit0_rand_1233958068();
}
}
}

