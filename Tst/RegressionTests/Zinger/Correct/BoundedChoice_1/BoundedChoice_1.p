event unit;

main machine TestMachine
{
var TestMachine_x: int;

fun TestMachine_Init_on_unit_goto_TestMachine_test0_rand_1226283488(TestMachine_Init_on_unit_goto_TestMachine_test0_rand_1226283488__payload_skip: any)
{


;

;

return;
}
fun TestMachine_test_on_unit_goto_TestMachine_test0_rand_678539635(TestMachine_test_on_unit_goto_TestMachine_test0_rand_678539635__payload_skip: any)
{


;

;

return;
}
fun TestMachine_Init_entry6(TestMachine_Init_entry6__payload_0: null)
{


;

TestMachine_x = 0;
;

raise unit;
return;
}
fun TestMachine_Init_exit0_rand_1220894821(TestMachine_Init_exit0_rand_1220894821__payload_skip: any)
{


;

;

return;
}
fun TestMachine_test_entry14(TestMachine_test_entry14__payload_1: null)
{
var Tmp732: bool;


;

Tmp732 = $;
if(Tmp732)
{

;

TestMachine_x = (TestMachine_x + 1);

}
else
{

;

TestMachine_x = 1;

}

;

assert (TestMachine_x < 4);
;

if((TestMachine_x < 10))
{

;

send this, unit;

}
else
{

;

;


}

return;
}
fun TestMachine_test_exit0_rand_1910438289(TestMachine_test_exit0_rand_1910438289__payload_skip: any)
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
TestMachine_Init_exit0_rand_1220894821(null);
}on unit goto TestMachine_test with (payload: null) {
TestMachine_Init_on_unit_goto_TestMachine_test0_rand_1226283488(payload);
}}

 state TestMachine_test
{
entry (payload: null) {
TestMachine_test_entry14(payload);
}exit {
TestMachine_test_exit0_rand_1910438289(null);
}on unit goto TestMachine_test with (payload: null) {
TestMachine_test_on_unit_goto_TestMachine_test0_rand_678539635(payload);
}}
}

