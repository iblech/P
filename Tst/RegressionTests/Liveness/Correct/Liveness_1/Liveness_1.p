event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_405439435(EventHandler_WaitForUser_entry0_rand_405439435__payload_0: any)
{


;
;
send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_1746691261()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1592174523(EventHandler_HandleEvent_entry0_rand_1592174523__payload_1: any)
{


;
;
send this, Done;


}
fun EventHandler_HandleEvent_exit0_rand_266189609()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_971408051(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_971408051__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_656103717(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_656103717__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_405439435(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_1746691261();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1592174523(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_266189609();
}
}
}

