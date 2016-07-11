
main machine MyMachine
{

fun MyMachine_Init_entry12(MyMachine_Init_entry12__payload_0: any)
{
var MyMachine_Init_entry12_f: bool;
var MyMachine_Init_entry12_g: bool;
var _tmp962: bool;


_tmp962 = (MyMachine_Init_entry12_f == MyMachine_Init_entry12_g);

assert _tmp962;


}
fun MyMachine_Init_exit0_rand_512978236()
{


;


}start  state MyMachine_Init
{entry (payload: any) {
MyMachine_Init_entry12(payload);
}
exit  {
MyMachine_Init_exit0_rand_512978236();
}
}
}

