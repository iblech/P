event E2  assert 2;
event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action2()
{
var _tmp1165: bool;


_tmp1165 = (Real1_test == false);
;
assert _tmp1165;


}
fun Real1_Real1_Init_entry11(Real1_Real1_Init_entry11__payload_0: any)
{


send this, E1;


}
fun Real1_Real1_Init_exit16()
{


send this, E2;


}
fun Real1_Real1_S1_entry20(Real1_Real1_S1_entry20__payload_2: any)
{


Real1_test = true;


}
fun Real1_Real1_S1_exit0_rand_1421288433()
{


;


}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1849285841(Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1849285841__payload_skip: any)
{


;


}start  state Real1_Real1_Init
{entry (payload: any) {
Real1_Real1_Init_entry11(payload);
}
exit  {
Real1_Real1_Init_exit16();
}
}
 state Real1_Real1_S1
{entry (payload: any) {
Real1_Real1_S1_entry20(payload);
}
exit  {
Real1_Real1_S1_exit0_rand_1421288433();
}
}
}

