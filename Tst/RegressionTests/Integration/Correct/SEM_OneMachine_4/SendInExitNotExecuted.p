event E2  assert 1;

main machine Real1
{

fun Real1_Action2()
{


assert false;


}
fun Real1_Real1_Init_entry0_rand_2146536311(Real1_Real1_Init_entry0_rand_2146536311__payload_0: any)
{


;


}
fun Real1_Real1_Init_exit10()
{


send this, E2;


}start  state Real1_Real1_Init
{entry (payload: any) {
Real1_Real1_Init_entry0_rand_2146536311(payload);
}
exit  {
Real1_Real1_Init_exit10();
}
}
}

