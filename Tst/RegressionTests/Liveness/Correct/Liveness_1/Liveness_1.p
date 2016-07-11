event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_2000836687(EventHandler_WaitForUser_entry0_rand_2000836687__payload_0: any)
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_510361187()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1825385537(EventHandler_HandleEvent_entry0_rand_1825385537__payload_1: any)
{


;

send this, Done;


}
fun EventHandler_HandleEvent_exit0_rand_2086312035()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_898259222(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_898259222__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_88873984(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_88873984__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_2000836687(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_510361187();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1825385537(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_2086312035();
}
}
}

