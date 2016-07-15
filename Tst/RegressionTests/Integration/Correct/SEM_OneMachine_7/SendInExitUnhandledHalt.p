event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1392686820()
{


;

}
fun Real1_Real1_Init_entry14()
{


send this, E1;
}
fun Real1_Real1_Init_exit17()
{


send this, halt;
}
fun Real1_Real1_S1_entry22()
{


Real1_test = true;
}
fun Real1_Real1_S1_exit0_rand_546539289()
{


;

}start 
 state Real1_Real1_Init
{
entry  {
Real1_Real1_Init_entry14();
}
exit  {
Real1_Real1_Init_exit17();
}
on E1 goto Real1_Real1_S1 with   {
Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1392686820();
}
}

 state Real1_Real1_S1
{
entry  {
Real1_Real1_S1_entry22();
}
exit  {
Real1_Real1_S1_exit0_rand_546539289();
}
}
}

