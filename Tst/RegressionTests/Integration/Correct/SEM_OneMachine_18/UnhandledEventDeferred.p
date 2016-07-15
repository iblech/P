event E2  assert 2;
event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Action2()
{
var _tmp582: bool;


_tmp582 = (Real1_test == false);
assert _tmp582;
}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_41148811()
{


;

}
fun Real1_Real1_Init_entry11()
{


send this, E1;
}
fun Real1_Real1_Init_exit16()
{


send this, E2;
}
fun Real1_Real1_S1_entry20()
{


Real1_test = true;
}
fun Real1_Real1_S1_exit0_rand_1376584183()
{


;

}start  state Real1_Real1_Init
{entry  {
Real1_Real1_Init_entry11();
}
exit  {
Real1_Real1_Init_exit16();
}
on E2 do   {
Real1_Action2();
}
on E1 goto Real1_Real1_S1 with   {
Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_41148811();
}
}
 state Real1_Real1_S1
{entry  {
Real1_Real1_S1_entry20();
}
exit  {
Real1_Real1_S1_exit0_rand_1376584183();
}
defer E2;}
}

