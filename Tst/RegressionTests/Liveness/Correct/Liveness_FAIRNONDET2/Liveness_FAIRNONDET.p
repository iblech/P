event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_105162623()
{


;

}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1441513076()
{


;

}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_2097544684()
{


;

}
fun EventHandler_WaitForUser_entry0_rand_718714144()
{


;

send this, UserEvent;
}
fun EventHandler_WaitForUser_exit0_rand_215839311()
{


;

}
fun EventHandler_HandleEvent_entry0_rand_1606884562()
{
var _tmp657: bool;


;

_tmp657 = $;
if(_tmp657)
{

send this, Loop;

}
else
{

send this, Done;

}

}
fun EventHandler_HandleEvent_exit0_rand_1670698846()
{


;

}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_718714144();
}
exit  {
EventHandler_WaitForUser_exit0_rand_215839311();
}
on UserEvent goto EventHandler_HandleEvent with   {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_105162623();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_1606884562();
}
exit  {
EventHandler_HandleEvent_exit0_rand_1670698846();
}
on Done goto EventHandler_WaitForUser with   {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1441513076();
}

on Loop goto EventHandler_HandleEvent with   {
EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_2097544684();
}
}
}

