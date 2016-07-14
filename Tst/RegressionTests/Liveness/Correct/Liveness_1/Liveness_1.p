event halt;
event null;
event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_1804722340()
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_315395436()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_414989908()
{


;

send this, Done;


}
fun EventHandler_HandleEvent_exit0_rand_150945642()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1447203876()
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_554123583()
{


;


}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_1804722340();
}
exit  {
EventHandler_WaitForUser_exit0_rand_315395436();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_414989908();
}
exit  {
EventHandler_HandleEvent_exit0_rand_150945642();
}
}
}

