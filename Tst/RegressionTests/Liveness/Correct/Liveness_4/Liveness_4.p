event UserEvent;
event Done;
event Continue;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_715669620()
{


;

}
fun EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_51835975()
{


;

}
fun EventHandler_WaitForUser_entry14()
{


new Loop();
;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_1095838247()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1091378634()
{


;

send this, Continue;
}
fun EventHandler_HandleEvent_exit0_rand_404923720()
{


;

}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry14();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1095838247();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_715669620();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_1091378634();
}
exit  {
EventHandler_HandleEvent_exit0_rand_404923720();
}
on Continue goto EventHandler_HandleEvent with   {
EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_51835975();
}
}
}

machine Loop
{

fun Loop_Looping_on_Done_goto_Loop_Looping0_rand_1208905946()
{


;

}
fun Loop_Looping_entry35()
{


send this, Done;
}
fun Loop_Looping_exit0_rand_991865660()
{


;

}start  state Loop_Looping
{entry  {
Loop_Looping_entry35();
}
exit  {
Loop_Looping_exit0_rand_991865660();
}
on Done goto Loop_Looping with   {
Loop_Looping_on_Done_goto_Loop_Looping0_rand_1208905946();
}
}
}

