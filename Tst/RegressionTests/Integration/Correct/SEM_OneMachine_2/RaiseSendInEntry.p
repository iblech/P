event E1  assert 1;
event E2  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action1()
{


Real1_test = true;


}
fun Real1_Action2()
{
var _tmp1173: bool;


_tmp1173 = (Real1_test == false);

assert _tmp1173;


}
fun Real1_Real1_Init_entry10(Real1_Real1_Init_entry10__payload_0: any)
{


raise E1;

send this, E2;


}
fun Real1_Real1_Init_exit0_rand_573792702()
{


;


}start  state Real1_Real1_Init
{entry (payload: any) {
Real1_Real1_Init_entry10(payload);
}
exit  {
Real1_Real1_Init_exit0_rand_573792702();
}
}
}

