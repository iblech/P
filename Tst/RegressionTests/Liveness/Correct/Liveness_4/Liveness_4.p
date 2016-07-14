event halt;
event null;
event UserEvent;
event Done;
event Continue;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry14()
{


new Loop();

;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_1647320899()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_273422953()
{


;

send this, Continue;


}
fun EventHandler_HandleEvent_exit0_rand_674269459()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_789161424()
{


;


}
fun EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_733163711()
{


;


}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry14();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1647320899();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_273422953();
}
exit  {
EventHandler_HandleEvent_exit0_rand_674269459();
}
}
}

machine Loop
{

fun Loop_Looping_entry35()
{


send this, Done;


}
fun Loop_Looping_exit0_rand_1901258670()
{


;


}
fun Loop_Looping_on_Done_goto_Loop_Looping0_rand_1158718054()
{


;


}start  state Loop_Looping
{entry  {
Loop_Looping_entry35();
}
exit  {
Loop_Looping_exit0_rand_1901258670();
}
}
}

