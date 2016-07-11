event E2  assert 1;
event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action2()
{
var _tmp1168: bool;


_tmp1168 = (Real1_test == false);
;
assert _tmp1168;


}
fun Real1_Real1_Init_entry10(Real1_Real1_Init_entry10__payload_0: any)
{


send this, E1;
;
raise halt;


}
fun Real1_Real1_Init_exit15()
{


send this, E2;


}
fun Real1_Real1_S1_entry19(Real1_Real1_S1_entry19__payload_2: any)
{


Real1_test = true;


}
fun Real1_Real1_S1_exit0_rand_104128729()
{


;


}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_112610146(Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_112610146__payload_skip: any)
{


;


}start  state Real1_Real1_Init
{entry (payload: any) {
Real1_Real1_Init_entry10(payload);
}
exit  {
Real1_Real1_Init_exit15();
}
}
 state Real1_Real1_S1
{entry (payload: any) {
Real1_Real1_S1_entry19(payload);
}
exit  {
Real1_Real1_S1_exit0_rand_104128729();
}
}
}

