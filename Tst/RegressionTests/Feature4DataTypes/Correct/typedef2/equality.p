event halt;
event null;

main machine MyMachine
{

fun MyMachine_Init_entry12()
{
var MyMachine_Init_entry12_f: bool;
var MyMachine_Init_entry12_g: bool;
var _tmp373: bool;


_tmp373 = (MyMachine_Init_entry12_f == MyMachine_Init_entry12_g);

assert _tmp373;


}
fun MyMachine_Init_exit0_rand_455674949()
{


;


}start  state MyMachine_Init
{entry  {
MyMachine_Init_entry12();
}
exit  {
MyMachine_Init_exit0_rand_455674949();
}
}
}

