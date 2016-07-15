event x;

main machine TestMachine
{
var TestMachine_x1: int;

fun TestMachine_foo(TestMachine_foo_x: any, TestMachine_foo_y: int, TestMachine_foo_z: event): int
{


return (0);
}
fun TestMachine_Init_entry6()
{


TestMachine_foo(1, 3, x);
}
fun TestMachine_Init_exit0_rand_589839363()
{


;

}start 
 state TestMachine_Init
{
entry  {
TestMachine_Init_entry6();
}
exit  {
TestMachine_Init_exit0_rand_589839363();
}
}
}

