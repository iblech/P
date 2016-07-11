event local;
event global: int;

main machine MAIN
{

fun MAIN_Init_entry16(MAIN_Init_entry16__payload_2: any)
{


send this, local;
;
;
;
;


}
fun MAIN_Init_exit0_rand_719089966()
{


;


}start  state MAIN_Init
{entry (payload: any) {
MAIN_Init_entry16(payload);
}
exit  {
MAIN_Init_exit0_rand_719089966();
}
}
}

