event UserEvent;
event Done;
event Waiting;
event Computing;

main machine EventHandler
{

fun EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1604638136(EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1604638136__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_225029989(EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_225029989__payload_skip: any)
{


;

;

return;
}
fun EventHandler_WaitForUser_entry17(EventHandler_WaitForUser_entry17__payload_0: null)
{


;

monitor (Waiting), (null);
;

send this, UserEvent;
return;
}
fun EventHandler_WaitForUser_exit0_rand_425111324(EventHandler_WaitForUser_exit0_rand_425111324__payload_skip: any)
{


;

;

return;
}
fun EventHandler_HandleEvent_entry26(EventHandler_HandleEvent_entry26__payload_1: null)
{


;

monitor (Computing), (null);
;

send this, Done;
return;
}
fun EventHandler_HandleEvent_exit0_rand_466225289(EventHandler_HandleEvent_exit0_rand_466225289__payload_skip: any)
{


;

;

return;
}start 
 state EventHandler_WaitForUser
{
entry (payload: null) {
EventHandler_WaitForUser_entry17(payload);
}exit {
EventHandler_WaitForUser_exit0_rand_425111324(null);
}on UserEvent goto EventHandler_HandleEvent with (payload: null) {
EventHandler_WaitForUser_on_UserEvent_goto_EventHandler_HandleEvent0_rand_1604638136(payload);
}}

 state EventHandler_HandleEvent
{
entry (payload: null) {
EventHandler_HandleEvent_entry26(payload);
}exit {
EventHandler_HandleEvent_exit0_rand_466225289(null);
}on Done goto EventHandler_WaitForUser with (payload: null) {
EventHandler_HandleEvent_on_Done_goto_EventHandler_WaitForUser0_rand_225029989(payload);
}}
}

spec WatchDog monitors Waiting, Computing 
{

fun WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_307960134(WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_307960134__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1861825785(WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1861825785__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_442320793(WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_442320793__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_887616184(WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_887616184__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_entry0_rand_155239331(WatchDog_CanGetUserInput_entry0_rand_155239331__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CanGetUserInput_exit0_rand_306033608(WatchDog_CanGetUserInput_exit0_rand_306033608__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_entry0_rand_1115177060(WatchDog_CannotGetUserInput_entry0_rand_1115177060__payload_skip: any)
{


;

;

return;
}
fun WatchDog_CannotGetUserInput_exit0_rand_593411056(WatchDog_CannotGetUserInput_exit0_rand_593411056__payload_skip: any)
{


;

;

return;
}start 
cold state WatchDog_CanGetUserInput
{
entry (payload: any) {
WatchDog_CanGetUserInput_entry0_rand_155239331(payload);
}exit {
WatchDog_CanGetUserInput_exit0_rand_306033608(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_307960134(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CanGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_1861825785(payload);
}}

hot state WatchDog_CannotGetUserInput
{
entry (payload: any) {
WatchDog_CannotGetUserInput_entry0_rand_1115177060(payload);
}exit {
WatchDog_CannotGetUserInput_exit0_rand_593411056(null);
}on Waiting goto WatchDog_CanGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Waiting_goto_WatchDog_CanGetUserInput0_rand_442320793(payload);
}
on Computing goto WatchDog_CannotGetUserInput with (payload: null) {
WatchDog_CannotGetUserInput_on_Computing_goto_WatchDog_CannotGetUserInput0_rand_887616184(payload);
}}
}

