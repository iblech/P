event halt;
event null;
event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_132075132()
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_315710197()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1884631669()
{
var _tmp657: bool;


;

_tmp657 = $;

if(_tmp657)
{

send this, Loop;

send this, Loop;



}
else
{

send this, Done;

send this, Done;



}


}
fun EventHandler_HandleEvent_exit0_rand_2052491914()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_330629577()
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1176563881()
{


;


}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_387346564()
{


;


}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_132075132();
}
exit  {
EventHandler_WaitForUser_exit0_rand_315710197();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_1884631669();
}
exit  {
EventHandler_HandleEvent_exit0_rand_2052491914();
}
}
}

