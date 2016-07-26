event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1904810331(Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1904810331__payload_skip: any)
{


;

;

return;
}
fun Real1_Real1_Init_entry14(Real1_Real1_Init_entry14__payload_0: null)
{


;

send this, E1;
return;
}
fun Real1_Real1_Init_exit17(Real1_Real1_Init_exit17__payload_1: null)
{


;

send this, halt;
return;
}
fun Real1_Real1_S1_entry22(Real1_Real1_S1_entry22__payload_2: null)
{


;

Real1_test = true;
return;
}
fun Real1_Real1_S1_exit0_rand_1690620845(Real1_Real1_S1_exit0_rand_1690620845__payload_skip: any)
{


;

;

return;
}start 
 state Real1_Real1_Init
{
entry (payload: null) {
Real1_Real1_Init_entry14(payload);
}exit {
Real1_Real1_Init_exit17(null);
}on E1 goto Real1_Real1_S1 with (payload: null) {
Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1904810331(payload);
}}

 state Real1_Real1_S1
{
entry (payload: null) {
Real1_Real1_S1_entry22(payload);
}exit {
Real1_Real1_S1_exit0_rand_1690620845(null);
}}
}

