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
var Tmp218: bool;
var Tmp219: bool;
var Tmp220: bool;
var Tmp221: bool;
var Tmp222: bool;
var Tmp223: bool;
var Tmp224: bool;
var Tmp225: bool;
var Tmp226: bool;


;

M_y = 2;
;

Tmp218 = (M_y == 2);
assert Tmp218;
;

M_y = default(int);
;

Tmp219 = (M_y == 0);
assert Tmp219;
;

M_b = true;
;

Tmp220 = (M_b == true);
assert Tmp220;
;

M_b = default(bool);
;

Tmp221 = (M_b == false);
assert Tmp221;
;

M_e = E;
;

Tmp222 = (M_e == E);
assert Tmp222;
;

M_e = default(event);
;

Tmp223 = (M_e == null);
assert Tmp223;
;

M_mac = this;
;

M_mac = default(machine);
;

Tmp224 = (M_mac == null);
assert Tmp224;
;

M_a = true;
;

M_a = default(any);
;

Tmp225 = (M_a == null);
assert Tmp225;
;

Tmp226 = (M_a == null);
if(Tmp226)
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
fun M_S_exit0_rand_1617685713(M_S_exit0_rand_1617685713__payload_skip: any)
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
M_S_exit0_rand_1617685713(null);
}}
}

