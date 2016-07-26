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

fun M_S_entry23(M_S_entry23__payload_0: null)
{
var Tmp395: bool;
var Tmp396: bool;
var Tmp397: bool;
var Tmp398: bool;
var Tmp399: bool;
var Tmp400: bool;
var Tmp401: bool;
var Tmp402: bool;
var Tmp403: bool;


;

M_y = 2;
;

Tmp395 = (M_y == 2);
assert Tmp395;
;

M_y = default(int);
;

Tmp396 = (M_y == 0);
assert Tmp396;
;

M_b = true;
;

Tmp397 = (M_b == true);
assert Tmp397;
;

M_b = default(bool);
;

Tmp398 = (M_b == false);
assert Tmp398;
;

M_e = E;
;

Tmp399 = (M_e == E);
assert Tmp399;
;

M_e = default(event);
;

Tmp400 = (M_e == null);
assert Tmp400;
;

M_mac = this;
;

M_mac = default(machine);
;

Tmp401 = (M_mac == null);
assert Tmp401;
;

M_a = true;
;

M_a = default(any);
;

Tmp402 = (M_a == null);
assert Tmp402;
;

Tmp403 = (M_a == null);
if(Tmp403)
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
fun M_S_exit0_rand_1427004829(M_S_exit0_rand_1427004829__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry23(payload);
}exit {
M_S_exit0_rand_1427004829(null);
}}
}

