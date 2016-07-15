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
var _tmp584: bool;


_tmp584 = (Real1_test == false);
assert _tmp584;
}
fun Real1_Real1_Init_entry10()
{


raise E1;
send this, E2;
}
fun Real1_Real1_Init_exit0_rand_1762261999()
{


;

}start  state Real1_Real1_Init
{entry  {
Real1_Real1_Init_entry10();
}
exit  {
Real1_Real1_Init_exit0_rand_1762261999();
}
on E1 do   {
Real1_Action1();
}

on E2 do   {
Real1_Action2();
}
}
}

