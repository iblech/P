event Unit;
event UserEvent;
event Done;
event Waiting: int;
event Computing;

main machine EventHandler
{

fun EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1633993119()
{


;

}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_315664642()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1462785430()
{


;

}
fun EventHandler_Init_entry12()
{


raise Unit;
}
fun EventHandler_Init_exit0_rand_281202434()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_1986117149()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_980644208()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_993833326()
{


;

}
fun EventHandler_HandleEvent_exit0_rand_633251746()
{


;

}start  state EventHandler_Init
{entry  {
EventHandler_Init_entry12();
}
exit  {
EventHandler_Init_exit0_rand_281202434();
}
on Unit goto EventHandler_WaitForUser with   {
EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1633993119();
}
}
 state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_1986117149();
}
exit  {
EventHandler_WaitForUser_exit0_rand_980644208();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_315664642();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_993833326();
}
exit  {
EventHandler_HandleEvent_exit0_rand_633251746();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1462785430();
}
}
}

