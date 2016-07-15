event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_564662775()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_951537393()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1390976448()
{


;

send this, Done;
}
fun EventHandler_HandleEvent_exit0_rand_893217488()
{


;

}start 
 state EventHandler_WaitForUser
{
entry  {
EventHandler_WaitForUser_entry0_rand_564662775();
}
exit  {
EventHandler_WaitForUser_exit0_rand_951537393();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1947917197();
}
}

 state EventHandler_HandleEvent
{
entry  {
EventHandler_HandleEvent_entry0_rand_1390976448();
}
exit  {
EventHandler_HandleEvent_exit0_rand_893217488();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1837406094();
}
}
}

