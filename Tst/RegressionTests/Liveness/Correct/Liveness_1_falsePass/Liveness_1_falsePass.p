event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_1888173136(EventHandler_WaitForUser_entry0_rand_1888173136__payload_0: any)
{


;
;
send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_100888775()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1724641490(EventHandler_HandleEvent_entry0_rand_1724641490__payload_1: any)
{


;
;
send this, Done;


}
fun EventHandler_HandleEvent_exit0_rand_1951235571()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1265078244(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1265078244__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_985132647(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_985132647__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_1888173136(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_100888775();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1724641490(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_1951235571();
}
}
}

