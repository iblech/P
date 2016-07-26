event UserEvent;
event Done;
event Continue;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1484948920(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1484948920__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_181797602(EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_181797602__payload_skip: any)
{


;

;

return;
}
fun EventHandler_WaitForUser_entry14(EventHandler_WaitForUser_entry14__payload_0: null)
{


;

new Loop();
;

monitor (Waiting), (null);
;

send this, UserEvent;
return;
}
fun EventHandler_WaitForUser_exit0_rand_430494552(EventHandler_WaitForUser_exit0_rand_430494552__payload_skip: any)
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

send this, Continue;
return;
}
fun EventHandler_HandleEvent_exit0_rand_30248646(EventHandler_HandleEvent_exit0_rand_30248646__payload_skip: any)
{


;

;

return;
}start 
 state EventHandler_WaitForUser
{
entry (payload: null) {
EventHandler_WaitForUser_entry14(payload);
}exit {
EventHandler_WaitForUser_exit0_rand_430494552(null);
}on UserEvent goto EventHandler_HandleEvent with (payload: null) {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1484948920(payload);
}}

 state EventHandler_HandleEvent
{
entry (payload: null) {
EventHandler_HandleEvent_entry24(payload);
}exit {
EventHandler_HandleEvent_exit0_rand_30248646(null);
}on Continue goto EventHandler_HandleEvent with (payload: null) {
EventHandler_HandleEvent_on_Continue_goto_EventHandler_HandleEvent0_rand_181797602(payload);
}}
}

machine Loop
{

fun Loop_Looping_on_Done_goto_Loop_Looping0_rand_2057788426(Loop_Looping_on_Done_goto_Loop_Looping0_rand_2057788426__payload_skip: any)
{


;

;

return;
}
fun Loop_Looping_entry35(Loop_Looping_entry35__payload_2: null)
{


;

send this, Done;
return;
}
fun Loop_Looping_exit0_rand_136453813(Loop_Looping_exit0_rand_136453813__payload_skip: any)
{


;

;

return;
}start 
 state Loop_Looping
{
entry (payload: null) {
Loop_Looping_entry35(payload);
}exit {
Loop_Looping_exit0_rand_136453813(null);
}on Done goto Loop_Looping with (payload: null) {
Loop_Looping_on_Done_goto_Loop_Looping0_rand_2057788426(payload);
}}
}

spec WatchDog monitors Computing, Waiting 
{

fun WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1380491089(WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1380491089__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1458511406(WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1458511406__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1573598265(WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1573598265__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1228654036(WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1228654036__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_entry0_rand_334355695(WatchDog_CanGetUserInput_entry0_rand_334355695__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_exit0_rand_1754988238(WatchDog_CanGetUserInput_exit0_rand_1754988238__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_entry0_rand_781949042(WatchDog_CannotGetUserInput_entry0_rand_781949042__payload_3: null)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_exit0_rand_1726218155(WatchDog_CannotGetUserInput_exit0_rand_1726218155__payload_skip: any)
{


;

;

return;
}start 
cold state WatchDog_CanGetUserInput
{
entry (payload: any) {
WatchDog_CanGetUserInput_entry0_rand_334355695(payload);
}exit {
WatchDog_CanGetUserInput_exit0_rand_1754988238(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1380491089(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1458511406(payload);
}}

hot state WatchDog_CannotGetUserInput
{
entry (payload: null) {
WatchDog_CannotGetUserInput_entry0_rand_781949042(payload);
}exit {
WatchDog_CannotGetUserInput_exit0_rand_1726218155(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_1573598265(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1228654036(payload);
}}
}

