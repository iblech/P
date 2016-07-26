event E2  assert 2;
event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action2()
{
var Tmp649: bool;


;

Tmp649 = (Real1_test == false);
assert Tmp649;
}
fun Real1_Real1_Init_do_E2(payload: null)
{


Real1_Action2();
}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_115941162(Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_115941162__payload_skip: any)
{


;

;

return;
}
fun Real1_Real1_Init_entry11(Real1_Real1_Init_entry11__payload_0: null)
{


;

send this, E1;
return;
}
fun Real1_Real1_Init_exit16(Real1_Real1_Init_exit16__payload_1: null)
{


;

send this, E2;
return;
}
fun Real1_Real1_S1_entry20(Real1_Real1_S1_entry20__payload_2: null)
{


;

Real1_test = true;
return;
}
fun Real1_Real1_S1_exit0_rand_182251295(Real1_Real1_S1_exit0_rand_182251295__payload_skip: any)
{


;

;

return;
}start 
 state Real1_Real1_Init
{
entry (payload: null) {
Real1_Real1_Init_entry11(payload);
}exit {
Real1_Real1_Init_exit16(null);
}on E2 do (payload: null) {
Real1_Real1_Init_do_E2(payload);
}on E1 goto Real1_Real1_S1 with (payload: null) {
Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_115941162(payload);
}}

 state Real1_Real1_S1
{
entry (payload: null) {
Real1_Real1_S1_entry20(payload);
}exit {
Real1_Real1_S1_exit0_rand_182251295(null);
}defer E2;}
}

