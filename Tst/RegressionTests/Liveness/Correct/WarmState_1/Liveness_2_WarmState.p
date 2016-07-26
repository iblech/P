event Unit;
event UserEvent;
event Done;
event Waiting: int;
event Computing;

main machine EventHandler
{

fun EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_208367218(EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_208367218__payload_skip: any)
{


;

;

return;
}
fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1275138860(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1275138860__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1440803018(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1440803018__payload_skip: any)
{


;

;

return;
}
fun EventHandler_Init_entry12(EventHandler_Init_entry12__payload_0: null)
{


;

raise Unit;
return;
}
fun EventHandler_Init_exit0_rand_863586285(EventHandler_Init_exit0_rand_863586285__payload_skip: any)
{


;

;

return;
}
fun EventHandler_WaitForUser_entry19(EventHandler_WaitForUser_entry19__payload_1: null)
{


;

monitor (Waiting), (0);
;

send this, UserEvent;
return;
}
fun EventHandler_WaitForUser_exit0_rand_2137284843(EventHandler_WaitForUser_exit0_rand_2137284843__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_entry28(EventHandler_HandleEvent_entry28__payload_2: null)
{


;

monitor (Computing), (null);
return;
}
fun EventHandler_HandleEvent_exit0_rand_524630256(EventHandler_HandleEvent_exit0_rand_524630256__payload_skip: any)
{


;

;

return;
}start 
 state EventHandler_Init
{
entry (payload: null) {
EventHandler_Init_entry12(payload);
}exit {
EventHandler_Init_exit0_rand_863586285(null);
}on Unit goto EventHandler_WaitForUser with (payload: null) {
EventHandler_Init_on_Unit_goto_EventHandler_WaitForUser0_rand_208367218(payload);
}}

 state EventHandler_WaitForUser
{
entry (payload: null) {
EventHandler_WaitForUser_entry19(payload);
}exit {
EventHandler_WaitForUser_exit0_rand_2137284843(null);
}on UserEvent goto EventHandler_HandleEvent with (payload: null) {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1275138860(payload);
}}

 state EventHandler_HandleEvent
{
entry (payload: null) {
EventHandler_HandleEvent_entry28(payload);
}exit {
EventHandler_HandleEvent_exit0_rand_524630256(null);
}on Done goto EventHandler_WaitForUser with (payload: null) {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1440803018(payload);
}}
}

spec WatchDog monitors Computing, Waiting 
{

fun WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1468184323(WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1468184323__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_2038157941(WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_2038157941__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_700455543(WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_700455543__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1079876743(WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1079876743__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_entry0_rand_1748906683(WatchDog_CanGetUserInput_entry0_rand_1748906683__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_exit0_rand_655768297(WatchDog_CanGetUserInput_exit0_rand_655768297__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_entry0_rand_1154212005(WatchDog_CannotGetUserInput_entry0_rand_1154212005__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_exit0_rand_2024000336(WatchDog_CannotGetUserInput_exit0_rand_2024000336__payload_skip: any)
{


;

;

return;
}start 
cold state WatchDog_CanGetUserInput
{
entry (payload: any) {
WatchDog_CanGetUserInput_entry0_rand_1748906683(payload);
}exit {
WatchDog_CanGetUserInput_exit0_rand_655768297(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: int) {
WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1468184323(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_2038157941(payload);
}}

 state WatchDog_CannotGetUserInput
{
entry (payload: any) {
WatchDog_CannotGetUserInput_entry0_rand_1154212005(payload);
}exit {
WatchDog_CannotGetUserInput_exit0_rand_2024000336(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: int) {
WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_700455543(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1079876743(payload);
}}
}

