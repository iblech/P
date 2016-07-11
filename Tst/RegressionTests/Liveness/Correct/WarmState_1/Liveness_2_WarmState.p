event Unit;
event UserEvent;
event Done;
event Waiting: int;
event Computing;

main machine EventHandler
{

fun EventHandler_Init_entry12(EventHandler_Init_entry12__payload_0: any)
{


raise Unit;


}
fun EventHandler_Init_exit0_rand_261242102()
{


;


}
fun EventHandler_WaitForUser_entry0_rand_134202139(EventHandler_WaitForUser_entry0_rand_134202139__payload_1: any)
{


;

send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_459710856()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1881759341(EventHandler_HandleEvent_entry0_rand_1881759341__payload_2: any)
{


;


}
fun EventHandler_HandleEvent_exit0_rand_1269335074()
{


;


}
fun EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1200511990(EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1200511990__payload_skip: any)
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_795512400(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_795512400__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_2049646827(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_2049646827__payload_skip: any)
{


;


}start  state EventHandler_Init
{entry (payload: any) {
EventHandler_Init_entry12(payload);
}
exit  {
EventHandler_Init_exit0_rand_261242102();
}
}
 state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_134202139(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_459710856();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1881759341(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_1269335074();
}
}
}

