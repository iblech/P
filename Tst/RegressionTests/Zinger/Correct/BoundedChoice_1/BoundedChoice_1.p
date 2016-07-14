event halt;
event null;
event unit;

main machine TestMachine
{
var TestMachine_x: int;

fun TestMachine_Init_entry6()
{


TestMachine_x = 0;

raise unit;


}
fun TestMachine_Init_exit0_rand_1535400500()
{


;


}
fun TestMachine_test_entry14()
{
var _tmp658: bool;


_tmp658 = $;

if(_tmp658)
{

TestMachine_x = (TestMachine_x + 1);

TestMachine_x = (TestMachine_x + 1);



}
else
{

TestMachine_x = 1;

TestMachine_x = 1;



}

assert (TestMachine_x < 4);

if((TestMachine_x < 10))
{

send this, unit;

send this, unit;



}
else
{

;

;



}


}
fun TestMachine_test_exit0_rand_1680295400()
{


;


}
fun TestMachine_Init_on_unit_goto_TestMachine_test0_rand_305440329()
{


;


}
fun TestMachine_test_on_unit_goto_TestMachine_test0_rand_726602902()
{


;


}start  state TestMachine_Init
{entry  {
TestMachine_Init_entry6();
}
exit  {
TestMachine_Init_exit0_rand_1535400500();
}
}
 state TestMachine_test
{entry  {
TestMachine_test_entry14();
}
exit  {
TestMachine_test_exit0_rand_1680295400();
}
}
}

