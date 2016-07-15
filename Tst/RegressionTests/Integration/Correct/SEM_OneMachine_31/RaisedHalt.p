event E2  assert 1;
event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action2()
{
var Tmp586: bool;


Tmp586 = (Real1_test == false);
assert Tmp586;
}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_498922131()
{


;

}
fun Real1_Real1_Init_entry10()
{


send this, E1;
raise halt;
}
fun Real1_Real1_Init_exit15()
{


send this, E2;
}
fun Real1_Real1_S1_entry19()
{


Real1_test = true;
}
fun Real1_Real1_S1_exit0_rand_1551512501()
{


;

}start 
 state Real1_Real1_Init
{
entry  {
Real1_Real1_Init_entry10();
}
exit  {
Real1_Real1_Init_exit15();
}
on E2 do   {
Real1_Action2();
}
on E1 goto Real1_Real1_S1 with   {
Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_498922131();
}
}

 state Real1_Real1_S1
{
entry  {
Real1_Real1_S1_entry19();
}
exit  {
Real1_Real1_S1_exit0_rand_1551512501();
}
}
}

