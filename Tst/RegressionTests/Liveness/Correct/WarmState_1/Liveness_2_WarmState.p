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
fun EventHandler_Init_exit0_rand_1852376246()
{


;


}
fun EventHandler_WaitForUser_entry0_rand_291759208(EventHandler_WaitForUser_entry0_rand_291759208__payload_1: any)
{


;
;
send this, UserEvent;


}
fun EventHandler_WaitForUser_exit0_rand_849396846()
{


;


}
fun EventHandler_HandleEvent_entry0_rand_1329019682(EventHandler_HandleEvent_entry0_rand_1329019682__payload_2: any)
{


;


}
fun EventHandler_HandleEvent_exit0_rand_1062768558()
{


;


}
fun EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1255956130(EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_1255956130__payload_skip: any)
{


;


}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1301377988(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1301377988__payload_skip: any)
{


;


}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_832477843(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_832477843__payload_skip: any)
{


;


}start  state EventHandler_Init
{entry (payload: any) {
EventHandler_Init_entry12(payload);
}
exit  {
EventHandler_Init_exit0_rand_1852376246();
}
}
 state EventHandler_WaitForUser
{entry (payload: any) {
EventHandler_WaitForUser_entry0_rand_291759208(payload);
}
exit  {
EventHandler_WaitForUser_exit0_rand_849396846();
}
}
 state EventHandler_HandleEvent
{entry (payload: any) {
EventHandler_HandleEvent_entry0_rand_1329019682(payload);
}
exit  {
EventHandler_HandleEvent_exit0_rand_1062768558();
}
}
}

