event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_536983807(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_536983807__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1531920838(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1531920838__payload_skip: any)
{


;

;

return;
}
fun EventHandler_WaitForUser_entry15(EventHandler_WaitForUser_entry15__payload_0: null)
{


;

monitor (Waiting), (null);
;

send this, UserEvent;
return;
}
fun EventHandler_WaitForUser_exit0_rand_1891986510(EventHandler_WaitForUser_exit0_rand_1891986510__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_entry24(EventHandler_HandleEvent_entry24__payload_1: null)
{


;

monitor (Computing), (null);
;

send this, Done;
return;
}
fun EventHandler_HandleEvent_exit0_rand_324272596(EventHandler_HandleEvent_exit0_rand_324272596__payload_skip: any)
{


;

;

return;
}start 
 state EventHandler_WaitForUser
{
entry (payload: null) {
EventHandler_WaitForUser_entry15(payload);
}exit {
EventHandler_WaitForUser_exit0_rand_1891986510(null);
}on UserEvent goto EventHandler_HandleEvent with (payload: null) {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_536983807(payload);
}}

 state EventHandler_HandleEvent
{
entry (payload: null) {
EventHandler_HandleEvent_entry24(payload);
}exit {
EventHandler_HandleEvent_exit0_rand_324272596(null);
}on Done goto EventHandler_WaitForUser with (payload: null) {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1531920838(payload);
}}
}

spec WatchDog monitors Waiting, Computing 
{

fun WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_555350070(WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_555350070__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_500301420(WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_500301420__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1031842667(WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1031842667__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1357805978(WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1357805978__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_entry0_rand_938577231(WatchDog_CanGetUserInput_entry0_rand_938577231__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_exit0_rand_1437021254(WatchDog_CanGetUserInput_exit0_rand_1437021254__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_entry0_rand_1705633412(WatchDog_CannotGetUserInput_entry0_rand_1705633412__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_exit0_rand_1471051664(WatchDog_CannotGetUserInput_exit0_rand_1471051664__payload_skip: any)
{


;

;

return;
}start 
cold state WatchDog_CanGetUserInput
{
entry (payload: any) {
WatchDog_CanGetUserInput_entry0_rand_938577231(payload);
}exit {
WatchDog_CanGetUserInput_exit0_rand_1437021254(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_555350070(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_500301420(payload);
}}

hot state WatchDog_CannotGetUserInput
{
entry (payload: any) {
WatchDog_CannotGetUserInput_entry0_rand_1705633412(payload);
}exit {
WatchDog_CannotGetUserInput_exit0_rand_1471051664(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1031842667(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1357805978(payload);
}}
}

