event x;

main machine TestMachine
{
var TestMachine_x1: int;

fun TestMachine_foo(TestMachine_foo_x: any, TestMachine_foo_y: int, TestMachine_foo_z: event): int
{


;

return (0);
}
fun TestMachine_Init_entry6(TestMachine_Init_entry6__payload_0: null)
{


;

TestMachine_foo(1, 3, x);
return;
}
fun TestMachine_Init_exit0_rand_1288504890(TestMachine_Init_exit0_rand_1288504890__payload_skip: any)
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
TestMachine_Init_exit0_rand_1288504890(null);
}}
}

