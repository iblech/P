event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_86658065()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_855327941()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_493467503()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_1156084193()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1147477691()
{


;

send this, Done;
}
fun EventHandler_HandleEvent_exit0_rand_399046799()
{


;

}start 
 state EventHandler_WaitForUser
{
entry  {
EventHandler_WaitForUser_entry0_rand_493467503();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1156084193();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_86658065();
}
}

 state EventHandler_HandleEvent
{
entry  {
EventHandler_HandleEvent_entry0_rand_1147477691();
}
exit  {
EventHandler_HandleEvent_exit0_rand_399046799();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_855327941();
}
}
}

