event unit;

main machine TestMachine
{
var TestMachine_x: int;

fun TestMachine_Init_on_unit_goto_TestMachine_test0_rand_2095158201()
{


;

}
fun TestMachine_test_on_unit_goto_TestMachine_test0_rand_1865098906()
{


;

}
fun TestMachine_Init_entry6()
{


TestMachine_x = 0;
raise unit;
}
fun TestMachine_Init_exit0_rand_1728583556()
{


;

}
fun TestMachine_test_entry14()
{
var Tmp658: bool;


Tmp658 = $;
if(Tmp658)
{

TestMachine_x = (TestMachine_x + 1);

}
else
{

TestMachine_x = 1;

}

assert (TestMachine_x < 4);
if((TestMachine_x < 10))
{

send this, unit;

}
else
{

;


}

}
fun TestMachine_test_exit0_rand_1328291234()
{


;

}start 
 state TestMachine_Init
{
entry  {
TestMachine_Init_entry6();
}
exit  {
TestMachine_Init_exit0_rand_1728583556();
}
on unit goto TestMachine_test with   {
TestMachine_Init_on_unit_goto_TestMachine_test0_rand_2095158201();
}
}

 state TestMachine_test
{
entry  {
TestMachine_test_entry14();
}
exit  {
TestMachine_test_exit0_rand_1328291234();
}
on unit goto TestMachine_test with   {
TestMachine_test_on_unit_goto_TestMachine_test0_rand_1865098906();
}
}
}

