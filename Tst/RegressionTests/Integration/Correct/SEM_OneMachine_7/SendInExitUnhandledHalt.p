event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Real1_Init_entry14(Real1_Real1_Init_entry14__payload_0: any)
{


send this, E1;


}
fun Real1_Real1_Init_exit17()
{


send this, halt;


}
fun Real1_Real1_S1_entry22(Real1_Real1_S1_entry22__payload_2: any)
{


Real1_test = true;


}
fun Real1_Real1_S1_exit0_rand_471882642()
{


;


}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1323666847(Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1323666847__payload_skip: any)
{


;


}start  state Real1_Real1_Init
{entry (payload: any) {
Real1_Real1_Init_entry14(payload);
}
exit  {
Real1_Real1_Init_exit17();
}
}
 state Real1_Real1_S1
{entry (payload: any) {
Real1_Real1_S1_entry22(payload);
}
exit  {
Real1_Real1_S1_exit0_rand_471882642();
}
}
}

