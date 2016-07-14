event halt;
event null;
event Unit;
event UserEvent;
event Done;
event Waiting: int;
event Computing;

main machine EventHandler
{

fun EventHandler_Init_entry12()
{


raise Unit;


}
fun EventHandler_Init_exit0_rand_1319996857()
{


;


}
fun EventHandler_WaitForUser_entry0_rand_1026700467()
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_610093628()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1680722967()
{


;


}
fun EventHandler_HandleEvent_exit0_rand_901603629()
{


;


}
fun EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_90048947()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_950407550()
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_389543536()
{


;


}start  state EventHandler_Init
{entry  {
EventHandler_Init_entry12();
}
exit  {
EventHandler_Init_exit0_rand_1319996857();
}
}
 state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_1026700467();
}
exit  {
EventHandler_WaitForUser_exit0_rand_610093628();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_1680722967();
}
exit  {
EventHandler_HandleEvent_exit0_rand_901603629();
}
}
}

