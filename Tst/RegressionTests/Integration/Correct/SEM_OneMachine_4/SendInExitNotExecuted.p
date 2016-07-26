event E2  assert 1;

main machine Real1
{

fun Real1_Action2()
{


;

assert false;
}
fun Real1_Real1_Init_do_E2(payload: null)
{


Real1_Action2();
}
fun Real1_Real1_Init_entry0_rand_14801523(Real1_Real1_Init_entry0_rand_14801523__payload_0: null)
{


;

;

return;
}
fun Real1_Real1_Init_exit10(Real1_Real1_Init_exit10__payload_1: null)
{


;

send this, E2;
return;
}start 
 state Real1_Real1_Init
{
entry (payload: null) {
Real1_Real1_Init_entry0_rand_14801523(payload);
}exit {
Real1_Real1_Init_exit10(null);
}on E2 do (payload: null) {
Real1_Real1_Init_do_E2(payload);
}}
}

