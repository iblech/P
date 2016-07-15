event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_645355815()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1800602500()
{


;

}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_226909982()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_448128750()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_403596354()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1152274839()
{
var Tmp657: bool;


;

Tmp657 = $;
if(Tmp657)
{

send this, Loop;

}
else
{

send this, Done;

}

}
fun EventHandler_HandleEvent_exit0_rand_724319340()
{


;

}start 
 state EventHandler_WaitForUser
{
entry  {
EventHandler_WaitForUser_entry0_rand_448128750();
}
exit  {
EventHandler_WaitForUser_exit0_rand_403596354();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_645355815();
}
}

 state EventHandler_HandleEvent
{
entry  {
EventHandler_HandleEvent_entry0_rand_1152274839();
}
exit  {
EventHandler_HandleEvent_exit0_rand_724319340();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1800602500();
}

on Loop goto EventHandler_HandleEvent with   {
EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_226909982();
}
}
}

