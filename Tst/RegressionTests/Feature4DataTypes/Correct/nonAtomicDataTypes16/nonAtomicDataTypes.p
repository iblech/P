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

fun M_S_entry22(M_S_entry22__payload_0: null)
{
var Tmp406: bool;
var Tmp407: bool;
var Tmp408: bool;
var Tmp409: bool;
var Tmp410: bool;
var Tmp411: bool;
var Tmp412: bool;
var Tmp413: bool;


;

M_y = 2;
;

Tmp406 = (M_y == 2);
assert Tmp406;
;

M_y = default(int);
;

Tmp407 = (M_y == 0);
assert Tmp407;
;

M_b = true;
;

Tmp408 = (M_b == true);
assert Tmp408;
;

M_b = default(bool);
;

Tmp409 = (M_b == false);
assert Tmp409;
;

M_e = E;
;

Tmp410 = (M_e == E);
assert Tmp410;
;

M_e = default(event);
;

Tmp411 = (M_e == null);
assert Tmp411;
;

M_mac = this;
;

M_mac = default(machine);
;

Tmp412 = (M_mac == null);
assert Tmp412;
;

M_a = true;
;

M_a = default(any);
;

Tmp413 = (M_a == null);
if(Tmp413)
{

;

M_a = 1;

}
else
{

;

;


}

;

;

;

raise halt;
return;
}
fun M_S_exit0_rand_1482366552(M_S_exit0_rand_1482366552__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry22(payload);
}exit {
M_S_exit0_rand_1482366552(null);
}}
}

