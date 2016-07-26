event UserEvent  assert 1;
event Done  assert 1;
event Loop  assert 1;
event Waiting  assert 1;
event Computing  assert 1;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_897814988(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_897814988__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_2047964715(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_2047964715__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_864802253(EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_864802253__payload_skip: any)
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
fun EventHandler_WaitForUser_exit0_rand_806409285(EventHandler_WaitForUser_exit0_rand_806409285__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_entry24(EventHandler_HandleEvent_entry24__payload_1: null)
{
var Tmp730: bool;


;

monitor (Computing), (null);
;

Tmp730 = $;
if(Tmp730)
{

;

send this, Done;

}
else
{

;

send this, Loop;

}

return;
}
fun EventHandler_HandleEvent_exit0_rand_1108386428(EventHandler_HandleEvent_exit0_rand_1108386428__payload_skip: any)
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
EventHandler_WaitForUser_exit0_rand_806409285(null);
}on UserEvent goto EventHandler_HandleEvent with (payload: null) {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_897814988(payload);
}}

 state EventHandler_HandleEvent
{
entry (payload: null) {
EventHandler_HandleEvent_entry24(payload);
}exit {
EventHandler_HandleEvent_exit0_rand_1108386428(null);
}on Done goto EventHandler_WaitForUser with (payload: null) {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_2047964715(payload);
}
on Loop goto EventHandler_HandleEvent with (payload: null) {
EventHandler_HandleEvent_on_Loop_goto_EventHandler_HandleEvent0_rand_864802253(payload);
}}
}

spec WatchDog monitors Computing, Waiting 
{

fun WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1646954681(WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1646954681__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1299305250(WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1299305250__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1238660371(WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1238660371__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1514611215(WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1514611215__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_entry0_rand_147350137(WatchDog_CanGetUserInput_entry0_rand_147350137__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_exit0_rand_5732468(WatchDog_CanGetUserInput_exit0_rand_5732468__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_entry0_rand_1371706721(WatchDog_CannotGetUserInput_entry0_rand_1371706721__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_exit0_rand_743031835(WatchDog_CannotGetUserInput_exit0_rand_743031835__payload_skip: any)
{


;

;

return;
}start 
cold state WatchDog_CanGetUserInput
{
entry (payload: any) {
WatchDog_CanGetUserInput_entry0_rand_147350137(payload);
}exit {
WatchDog_CanGetUserInput_exit0_rand_5732468(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1646954681(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1299305250(payload);
}}

hot state WatchDog_CannotGetUserInput
{
entry (payload: any) {
WatchDog_CannotGetUserInput_entry0_rand_1371706721(payload);
}exit {
WatchDog_CannotGetUserInput_exit0_rand_743031835(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1238660371(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1514611215(payload);
}}
}

