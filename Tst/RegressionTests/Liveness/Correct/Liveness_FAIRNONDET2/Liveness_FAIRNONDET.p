event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_1759368254(EventHandler_WaitForUser_entry0_rand_1759368254__payload_0: any)
{


;
;
send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_220296777()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_697388349(EventHandler_HandleEvent_entry0_rand_697388349__payload_1: any)
{
var _tmp1239: bool;


;
;
_tmp1239 = $;
;
if(_tmp1239)
{

send this, Loop;
;
send this, Loop;



}
else
{

send this, Done;
;
send this, Done;



}


}
fun EventHandler_HandleEvent_exit0_rand_987685627()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1299731508(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1299731508__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_447685181(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_447685181__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1736312506(EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1736312506__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_1759368254(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_220296777();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_697388349(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_987685627();
}
}
}

