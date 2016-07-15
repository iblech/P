event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_623694123()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1234721931()
{


;

}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_541958186()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_183708462()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_1027612671()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_2001216097()
{
var _tmp656: bool;


;

_tmp656 = $;
if(_tmp656)
{

send this, Done;

}
else
{

send this, Loop;

}

}
fun EventHandler_HandleEvent_exit0_rand_1603811345()
{


;

}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_183708462();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1027612671();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_623694123();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_2001216097();
}
exit  {
EventHandler_HandleEvent_exit0_rand_1603811345();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1234721931();
}

on Loop goto EventHandler_HandleEvent with   {
EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_541958186();
}
}
}

