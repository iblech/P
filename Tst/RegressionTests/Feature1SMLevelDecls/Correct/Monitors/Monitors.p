event halt;
event null;
event local;
event global: int;

main machine MAIN
{

fun MAIN_Init_entry16()
{


send this, local;

;

;


}
fun MAIN_Init_exit0_rand_1812110743()
{


;


}start  state MAIN_Init
{entry  {
MAIN_Init_entry16();
}
exit  {
MAIN_Init_exit0_rand_1812110743();
}
}
}

