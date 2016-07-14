event halt;
event null;
event E1  assert 1;

main machine Real1
{
var Real1_test: bool;

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
fun Real1_Real1_S1_exit0_rand_1383149619()
{


;


}
fun Real1_Real1_Init_on_E1_goto_Real1_Real1_S10_rand_1739066835()
{


;


}start  state Real1_Real1_Init
{entry  {
Real1_Real1_Init_entry14();
}
exit  {
Real1_Real1_Init_exit17();
}
}
 state Real1_Real1_S1
{entry  {
Real1_Real1_S1_entry22();
}
exit  {
Real1_Real1_S1_exit0_rand_1383149619();
}
}
}

