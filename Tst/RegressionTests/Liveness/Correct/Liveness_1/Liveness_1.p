event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_718653684()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1906620381()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_515277386()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_1660548378()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_533808355()
{


;

send this, Done;
}
fun EventHandler_HandleEvent_exit0_rand_422267851()
{


;

}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_515277386();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1660548378();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_718653684();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_533808355();
}
exit  {
EventHandler_HandleEvent_exit0_rand_422267851();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1906620381();
}
}
}

