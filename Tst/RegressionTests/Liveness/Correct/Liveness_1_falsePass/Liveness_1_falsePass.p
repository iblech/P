event halt;
event null;
event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_2050443378()
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_1242776977()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1989164520()
{


;

send this, Done;


}
fun EventHandler_HandleEvent_exit0_rand_1551145443()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1597611690()
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_118083988()
{


;


}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_2050443378();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1242776977();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_1989164520();
}
exit  {
EventHandler_HandleEvent_exit0_rand_1551145443();
}
}
}

