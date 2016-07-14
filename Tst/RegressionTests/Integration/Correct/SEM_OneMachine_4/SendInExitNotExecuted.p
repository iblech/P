event halt;
event null;
event E2  assert 1;

main machine Real1
{

fun Real1_Action2()
{


assert false;


}
fun Real1_Real1_Init_entry0_rand_1167879669()
{


;


}
fun Real1_Real1_Init_exit10()
{


send this, E2;


}start  state Real1_Real1_Init
{entry  {
Real1_Real1_Init_entry0_rand_1167879669();
}
exit  {
Real1_Real1_Init_exit10();
}
}
}

