event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1605402610()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_35295386()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_1533778727()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_1772774473()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1370660291()
{


;

send this, Done;
}
fun EventHandler_HandleEvent_exit0_rand_1695307384()
{


;

}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_1533778727();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1772774473();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1605402610();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_1370660291();
}
exit  {
EventHandler_HandleEvent_exit0_rand_1695307384();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_35295386();
}
}
}

