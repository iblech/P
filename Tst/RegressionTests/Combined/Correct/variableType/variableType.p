event x;

main machine TestMachine
{
var TestMachine_x: int;

fun TestMachine_foo(TestMachine_foo_x: event)
{


;

send this, TestMachine_foo_x;
}
fun TestMachine_Init_entry6(TestMachine_Init_entry6__payload_0: null)
{


;

TestMachine_x = (TestMachine_x + 1);
return;
}
fun TestMachine_Init_exit0_rand_269193514(TestMachine_Init_exit0_rand_269193514__payload_skip: any)
{


;

;

return;
}start 
 state TestMachine_Init
{
entry (payload: null) {
TestMachine_Init_entry6(payload);
}exit {
TestMachine_Init_exit0_rand_269193514(null);
}}
}

machine Xsender
{

fun Xsender_Init_entry20(Xsender_Init_entry20__payload_1: null)
{


;

send this, x;
return;
}
fun Xsender_Init_exit0_rand_986906981(Xsender_Init_exit0_rand_986906981__payload_skip: any)
{


;

;

return;
}start 
 state Xsender_Init
{
entry (payload: null) {
Xsender_Init_entry20(payload);
}exit {
Xsender_Init_exit0_rand_986906981(null);
}}
}

