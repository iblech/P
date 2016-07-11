event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_242505861(EventHandler_WaitForUser_entry0_rand_242505861__payload_0: any)
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_149307593()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_555349384(EventHandler_HandleEvent_entry0_rand_555349384__payload_1: any)
{


;

send this, Done;


}
fun EventHandler_HandleEvent_exit0_rand_1305368372()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_120673877(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_120673877__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_113460419(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_113460419__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_242505861(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_149307593();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_555349384(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_1305368372();
}
}
}

