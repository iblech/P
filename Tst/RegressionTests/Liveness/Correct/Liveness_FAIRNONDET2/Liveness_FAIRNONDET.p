event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_1487176636(EventHandler_WaitForUser_entry0_rand_1487176636__payload_0: any)
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_1617510511()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1589509011(EventHandler_HandleEvent_entry0_rand_1589509011__payload_1: any)
{
var _tmp1246: bool;


;

_tmp1246 = $;

if(_tmp1246)
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
fun EventHandler_HandleEvent_exit0_rand_727823653()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1560942740(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1560942740__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1186469445(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1186469445__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1090825544(EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1090825544__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_1487176636(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_1617510511();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1589509011(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_727823653();
}
}
}

