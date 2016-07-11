event UserEvent;
event Done;
event Continue;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry14(EventHandler_WaitForUser_entry14__payload_0: any)
{


new Loop();
;
;
;
send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_96756862()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_184095985(EventHandler_HandleEvent_entry0_rand_184095985__payload_1: any)
{


;
;
send this, Continue;


}
fun EventHandler_HandleEvent_exit0_rand_1843476484()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_239646192(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_239646192__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_2071990837(EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_2071990837__payload_skip: any)
{


;


}start  state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry14(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_96756862();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_184095985(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_1843476484();
}
}
}

machine Loop
{

fun Loop_Looping_entry35(Loop_Looping_entry35__payload_2: any)
{


send this, Done;


}
fun Loop_Looping_exit0_rand_9500501()
{


;


}
fun Loop_Looping_on_Done_goto_Loop_Looping0_rand_1725064927(Loop_Looping_on_Done_goto_Loop_Looping0_rand_1725064927__payload_skip: any)
{


;


}start  state Loop_Looping
{entry (payload: any) {
Loop_Looping_entry35(payload);
}
exit  {
Loop_Looping_exit0_rand_9500501();
}
}
}

