event halt;
event null;
event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_entry0_rand_2097012853()
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_1573897198()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_72224726()
{
var _tmp656: bool;


;

_tmp656 = $;

if(_tmp656)
{

send this, Done;

send this, Done;



}
else
{

send this, Loop;

send this, Loop;



}


}
fun EventHandler_HandleEvent_exit0_rand_1345898040()
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1021421239()
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_124049793()
{


;


}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1907027942()
{


;


}start  state EventHandler_WaitForUser
{entry  {
EventHandler_WaitForUser_entry0_rand_2097012853();
}
exit  {
EventHandler_WaitForUser_exit0_rand_1573897198();
}
}
 state EventHandler_HandleEvent
{entry  {
EventHandler_HandleEvent_entry0_rand_72224726();
}
exit  {
EventHandler_HandleEvent_exit0_rand_1345898040();
}
}
}

