event local;
event global: int;

main machine MAIN
{

fun MAIN_Init_entry16(MAIN_Init_entry16__payload_2: any)
{


send this, local;

;

;


}
fun MAIN_Init_exit0_rand_1399819507()
{


;


}start  state MAIN_Init
{entry (payload: any) {
MAIN_Init_entry16(payload);
}
exit  {
MAIN_Init_exit0_rand_1399819507();
}
}
}

