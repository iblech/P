event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_456941704()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1877046484()
{


;

}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1911497025()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_1767064024()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_1499707032()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1120684821()
{
var Tmp656: bool;


;

Tmp656 = $;
if(Tmp656)
{

send this, Done;

}
else
{

send this, Loop;

}

}
fun EventHandler_HandleEvent_exit0_rand_64155108()
{


;

}start 
 state EventHandler_WaitForUser
{
entry  {
EventHandler_WaitForUser_entry0_rand_1767064024();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1499707032();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_456941704();
}
}

 state EventHandler_HandleEvent
{
entry  {
EventHandler_HandleEvent_entry0_rand_1120684821();
}
exit  {
EventHandler_HandleEvent_exit0_rand_64155108();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1877046484();
}

on Loop goto EventHandler_HandleEvent with   {
EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1911497025();
}
}
}

