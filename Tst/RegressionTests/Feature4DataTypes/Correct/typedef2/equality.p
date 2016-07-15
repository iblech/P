
main machine MyMachine
{

fun MyMachine_Init_entry12()
{
var MyMachine_Init_entry12_f: bool;
var MyMachine_Init_entry12_g: bool;
var Tmp373: bool;


Tmp373 = (MyMachine_Init_entry12_f == MyMachine_Init_entry12_g);
assert Tmp373;
}
fun MyMachine_Init_exit0_rand_381287388()
{


;

}start 
 state MyMachine_Init
{
entry  {
MyMachine_Init_entry12();
}
exit  {
MyMachine_Init_exit0_rand_381287388();
}
}
}

