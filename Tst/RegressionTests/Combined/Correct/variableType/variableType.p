event x;

main machine TestMachine
{
var TestMachine_x: int;

fun TestMachine_foo(TestMachine_foo_x: event)
{


send this, TestMachine_foo_x;


}
fun TestMachine_Init_entry6(TestMachine_Init_entry6__payload_0: any)
{


TestMachine_x = (TestMachine_x + 1);


}
fun TestMachine_Init_exit0_rand_1987191087()
{


;


}start  state TestMachine_Init
{entry (payload: any) {
TestMachine_Init_entry6(payload);
}
exit  {
TestMachine_Init_exit0_rand_1987191087();
}
}
}

machine Xsender
{

fun Xsender_Init_entry20(Xsender_Init_entry20__payload_1: any)
{


send this, x;


}
fun Xsender_Init_exit0_rand_47476058()
{


;


}start  state Xsender_Init
{entry (payload: any) {
Xsender_Init_entry20(payload);
}
exit  {
Xsender_Init_exit0_rand_47476058();
}
}
}

