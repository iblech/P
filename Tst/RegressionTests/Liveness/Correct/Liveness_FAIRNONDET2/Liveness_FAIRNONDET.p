event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_59665104(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_59665104__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1366581730(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1366581730__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1718118507(EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1718118507__payload_skip: any)
{


;

;

return;
}
fun EventHandler_WaitForUser_entry16(EventHandler_WaitForUser_entry16__payload_0: null)
{


;

monitor (Waiting), (null);
;

send this, UserEvent;
return;
}
fun EventHandler_WaitForUser_exit0_rand_1162836147(EventHandler_WaitForUser_exit0_rand_1162836147__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_entry25(EventHandler_HandleEvent_entry25__payload_1: null)
{
var Tmp731: bool;


;

monitor (Computing), (null);
;

Tmp731 = $;
if(Tmp731)
{

;

send this, Loop;

}
else
{

;

send this, Done;

}

return;
}
fun EventHandler_HandleEvent_exit0_rand_850045065(EventHandler_HandleEvent_exit0_rand_850045065__payload_skip: any)
{


;

;

return;
}start 
 state EventHandler_WaitForUser
{
entry (payload: null) {
EventHandler_WaitForUser_entry16(payload);
}exit {
EventHandler_WaitForUser_exit0_rand_1162836147(null);
}on UserEvent goto EventHandler_HandleEvent with (payload: null) {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_59665104(payload);
}}

 state EventHandler_HandleEvent
{
entry (payload: null) {
EventHandler_HandleEvent_entry25(payload);
}exit {
EventHandler_HandleEvent_exit0_rand_850045065(null);
}on Done goto EventHandler_WaitForUser with (payload: null) {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_1366581730(payload);
}
on Loop goto EventHandler_HandleEvent with (payload: null) {
EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_1718118507(payload);
}}
}

spec WatchDog monitors Computing, Waiting 
{

fun WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1351639753(WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1351639753__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_230950199(WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_230950199__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_416743778(WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_416743778__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_2109422661(WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_2109422661__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_entry0_rand_1447501199(WatchDog_CanGetUserInput_entry0_rand_1447501199__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_exit0_rand_511495421(WatchDog_CanGetUserInput_exit0_rand_511495421__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_entry0_rand_1013244837(WatchDog_CannotGetUserInput_entry0_rand_1013244837__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_exit0_rand_1512462613(WatchDog_CannotGetUserInput_exit0_rand_1512462613__payload_skip: any)
{


;

;

return;
}start 
cold state WatchDog_CanGetUserInput
{
entry (payload: any) {
WatchDog_CanGetUserInput_entry0_rand_1447501199(payload);
}exit {
WatchDog_CanGetUserInput_exit0_rand_511495421(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1351639753(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_230950199(payload);
}}

hot state WatchDog_CannotGetUserInput
{
entry (payload: any) {
WatchDog_CannotGetUserInput_entry0_rand_1013244837(payload);
}exit {
WatchDog_CannotGetUserInput_exit0_rand_1512462613(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_416743778(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_2109422661(payload);
}}
}

