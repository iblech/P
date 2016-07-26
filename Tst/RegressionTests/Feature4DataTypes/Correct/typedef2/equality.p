
main machine MyMachine
{

fun MyMachine_Init_entry12(MyMachine_Init_entry12__payload_0: null)
{
var MyMachine_Init_entry12_f: bool;
var MyMachine_Init_entry12_g: bool;
var Tmp418: bool;


;

Tmp418 = (MyMachine_Init_entry12_f == MyMachine_Init_entry12_g);
assert Tmp418;
return;
}
fun MyMachine_Init_exit0_rand_1231292182(MyMachine_Init_exit0_rand_1231292182__payload_skip: any)
{


;

;

return;
}start 
 state MyMachine_Init
{
entry (payload: null) {
MyMachine_Init_entry12(payload);
}exit {
MyMachine_Init_exit0_rand_1231292182(null);
}}
}

