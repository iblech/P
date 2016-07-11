event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_1026363438(EventHandler_WaitForUser_entry0_rand_1026363438__payload_0: any)
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_489693221()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1080799684(EventHandler_HandleEvent_entry0_rand_1080799684__payload_1: any)
{
var _tmp1245: bool;


;

_tmp1245 = $;

if(_tmp1245)
{

send this, Done;

send this, Done;



}
else
{

send this, Loop;

send this, Loop;



}


}
fun EventHandler_HandleEvent_exit0_rand_1776056814()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_132151278(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_132151278__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1095444685(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1095444685__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1094878654(EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1094878654__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_1026363438(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_489693221();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1080799684(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_1776056814();
}
}
}

