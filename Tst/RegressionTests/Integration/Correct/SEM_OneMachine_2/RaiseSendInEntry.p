event E1  assert 1;
event E2  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action1()
{


;

Real1_test = true;
}
fun Real1_Action2()
{
var Tmp651: bool;


;

Tmp651 = (Real1_test == false);
assert Tmp651;
}
fun Real1_Real1_Init_do_E1(payload: null)
{


Real1_Action1();
}
fun Real1_Real1_Init_do_E2(payload: null)
{


Real1_Action2();
}
fun Real1_Real1_Init_entry10(Real1_Real1_Init_entry10__payload_0: null)
{


;

raise E1;
;

send this, E2;
return;
}
fun Real1_Real1_Init_exit0_rand_840009770(Real1_Real1_Init_exit0_rand_840009770__payload_1: null)
{


;

;

return;
}start 
 state Real1_Real1_Init
{
entry (payload: null) {
Real1_Real1_Init_entry10(payload);
}exit {
Real1_Real1_Init_exit0_rand_840009770(null);
}on E1 do (payload: null) {
Real1_Real1_Init_do_E1(payload);
}
on E2 do (payload: null) {
Real1_Real1_Init_do_E2(payload);
}}
}

