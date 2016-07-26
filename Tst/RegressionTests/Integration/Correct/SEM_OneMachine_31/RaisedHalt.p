event E2  assert 1;
event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action2()
{
var Tmp653: bool;


;

Tmp653 = (Real1_test == false);
assert Tmp653;
}
fun Real1_Real1_Init_do_E2(payload: null)
{


Real1_Action2();
}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1801617010(Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1801617010__payload_skip: any)
{


;

;

return;
}
fun Real1_Real1_Init_entry10(Real1_Real1_Init_entry10__payload_0: null)
{


;

send this, E1;
;

raise halt;
return;
}
fun Real1_Real1_Init_exit15(Real1_Real1_Init_exit15__payload_1: null)
{


;

send this, E2;
return;
}
fun Real1_Real1_S1_entry19(Real1_Real1_S1_entry19__payload_2: null)
{


;

Real1_test = true;
return;
}
fun Real1_Real1_S1_exit0_rand_2018792719(Real1_Real1_S1_exit0_rand_2018792719__payload_skip: any)
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
Real1_Real1_Init_exit15(null);
}on E2 do (payload: null) {
Real1_Real1_Init_do_E2(payload);
}on E1 goto Real1_Real1_S1 with (payload: null) {
Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1801617010(payload);
}}

 state Real1_Real1_S1
{
entry (payload: null) {
Real1_Real1_S1_entry19(payload);
}exit {
Real1_Real1_S1_exit0_rand_2018792719(null);
}}
}

