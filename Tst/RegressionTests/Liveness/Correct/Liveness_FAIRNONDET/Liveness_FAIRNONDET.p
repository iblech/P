event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_11057056(EventHandler_WaitForUser_entry0_rand_11057056__payload_0: any)
{


;
;
send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_875169129()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1975715931(EventHandler_HandleEvent_entry0_rand_1975715931__payload_1: any)
{
var _tmp1238: bool;


;
;
_tmp1238 = $;
;
if(_tmp1238)
{

send this, Done;
;
send this, Done;



}
else
{

send this, Loop;
;
send this, Loop;



}


}
fun EventHandler_HandleEvent_exit0_rand_1177735683()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_961267039(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_961267039__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_7711800(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_7711800__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1684762467(EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1684762467__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_11057056(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_875169129();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1975715931(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_1177735683();
}
}
}

