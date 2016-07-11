event unit;

main machine TestMachine
{
var TestMachine_x: int;

fun TestMachine_Init_entry6(TestMachine_Init_entry6__payload_0: any)
{


TestMachine_x = 0;
;
raise unit;


}
fun TestMachine_Init_exit0_rand_1065716891()
{


;


}
fun TestMachine_test_entry14(TestMachine_test_entry14__payload_1: any)
{
var _tmp1240: bool;


_tmp1240 = $;
;
if(_tmp1240)
{

TestMachine_x = (TestMachine_x + 1);
;
TestMachine_x = (TestMachine_x + 1);



}
else
{

TestMachine_x = 1;
;
TestMachine_x = 1;



}
;
assert (TestMachine_x < 4);
;
if((TestMachine_x < 10))
{

send this, unit;
;
send this, unit;



}
else
{

;
;
;



}


}
fun TestMachine_test_exit0_rand_1500173377()
{


;


}
fun TestMachine_Init_on_unit_goto_TestMachine_test0_rand_944418835(TestMachine_Init_on_unit_goto_TestMachine_test0_rand_944418835__payload_skip: any)
{


;


}
fun TestMachine_test_on_unit_goto_TestMachine_test0_rand_1529596863(TestMachine_test_on_unit_goto_TestMachine_test0_rand_1529596863__payload_skip: any)
{


;


}start  state TestMachine_Init
{entry (payload: any) {
TestMachine_Init_entry6(payload);
}
exit  {
TestMachine_Init_exit0_rand_1065716891();
}
}
 state TestMachine_test
{entry (payload: any) {
TestMachine_test_entry14(payload);
}
exit  {
TestMachine_test_exit0_rand_1500173377();
}
}
}

