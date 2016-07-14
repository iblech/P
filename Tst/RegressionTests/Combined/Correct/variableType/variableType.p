event halt;
event null;
event x;

main machine TestMachine
{
var TestMachine_x: int;

fun TestMachine_foo(TestMachine_foo_x: event)
{


send this, TestMachine_foo_x;


}
fun TestMachine_Init_entry6()
{


TestMachine_x = (TestMachine_x + 1);


}
fun TestMachine_Init_exit0_rand_1080265841()
{


;


}start  state TestMachine_Init
{entry  {
TestMachine_Init_entry6();
}
exit  {
TestMachine_Init_exit0_rand_1080265841();
}
}
}

machine Xsender
{

fun Xsender_Init_entry20()
{


send this, x;


}
fun Xsender_Init_exit0_rand_1995373251()
{


;


}start  state Xsender_Init
{entry  {
Xsender_Init_entry20();
}
exit  {
Xsender_Init_exit0_rand_1995373251();
}
}
}

