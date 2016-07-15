event Unit;
event UserEvent;
event Done;
event Waiting: int;
event Computing;

main machine EventHandler
{

fun EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1548047012()
{


;

}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_909330848()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_540202351()
{


;

}
fun EventHandler_Init_entry12()
{


raise Unit;
}
fun EventHandler_Init_exit0_rand_731349551()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_799072216()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_722683697()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1928479330()
{


;

}
fun EventHandler_HandleEvent_exit0_rand_681669691()
{


;

}start 
 state EventHandler_Init
{
entry  {
EventHandler_Init_entry12();
}
exit  {
EventHandler_Init_exit0_rand_731349551();
}
on Unit goto EventHandler_WaitForUser with   {
EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1548047012();
}
}

 state EventHandler_WaitForUser
{
entry  {
EventHandler_WaitForUser_entry0_rand_799072216();
}
exit  {
EventHandler_WaitForUser_exit0_rand_722683697();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_909330848();
}
}

 state EventHandler_HandleEvent
{
entry  {
EventHandler_HandleEvent_entry0_rand_1928479330();
}
exit  {
EventHandler_HandleEvent_exit0_rand_681669691();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_540202351();
}
}
}

