event eD0Entry  assume 1;
event eD0Exit  assume 1;
event eTimerFired  assert 1;
event eSwitchStatusChange  assume 1;
event eTransferSuccess  assume 1;
event eTransferFailure  assume 1;
event eStopTimer  assume 1;
event eUpdateBarGraphStateUsingControlTransfer  assume 1;
event eSetLedStateToUnstableUsingControlTransfer  assume 1;
event eStartDebounceTimer  assume 1;
event eSetLedStateToStableUsingControlTransfer  assume 1;
event eStoppingSuccess  assert 1;
event eStoppingFailure  assert 1;
event eOperationSuccess  assert 1;
event eOperationFailure  assert 1;
event eTimerStopped  assert 1;
event eYes  assert 1;
event eNo  assert 1;
event eUnit  assert 1;

main machine User
{
var User_Driver: machine;

fun User_User_Init_on_eUnit_goto_User_S00_rand_1595154434()
{


;

}
fun User_S0_on_eUnit_goto_User_S10_rand_1326829898()
{


;

}
fun User_S1_on_eUnit_goto_User_S00_rand_635753802()
{


;

}
fun User_User_Init_entry29()
{
var _tmp571: machine;


_tmp571 = new OSRDriver(null);
User_Driver = _tmp571;
raise eUnit;
}
fun User_User_Init_exit0_rand_1337318077()
{


;

}
fun User_S0_entry37()
{


send User_Driver, eD0Entry;
raise eUnit;
}
fun User_S0_exit0_rand_1874778549()
{


;

}
fun User_S1_entry45()
{


send User_Driver, eD0Exit;
raise eUnit;
}
fun User_S1_exit0_rand_1024961128()
{


;

}start  state User_User_Init
{entry  {
User_User_Init_entry29();
}
exit  {
User_User_Init_exit0_rand_1337318077();
}
on eUnit goto User_S0 with   {
User_User_Init_on_eUnit_goto_User_S00_rand_1595154434();
}
}
 state User_S0
{entry  {
User_S0_entry37();
}
exit  {
User_S0_exit0_rand_1874778549();
}
on eUnit goto User_S1 with   {
User_S0_on_eUnit_goto_User_S10_rand_1326829898();
}
}
 state User_S1
{entry  {
User_S1_entry45();
}
exit  {
User_S1_exit0_rand_1024961128();
}
on eUnit goto User_S0 with   {
User_S1_on_eUnit_goto_User_S00_rand_635753802();
}
}
}

model Switch
{
var Switch_Driver: machine;

fun Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_1218404450()
{


;

}
fun Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1602743752()
{


;

}
fun Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_2145197214()
{


;

}
fun Switch__Init_entry56(Switch__Init_entry56_payload: machine)
{


Switch_Driver = Switch__Init_entry56_payload;
raise eUnit;
}
fun Switch__Init_exit0_rand_934482144()
{


;

}
fun Switch_Switch_Init_entry61()
{


raise eUnit;
}
fun Switch_Switch_Init_exit0_rand_1223099775()
{


;

}
fun Switch_ChangeSwitchStatus_entry69()
{


send Switch_Driver, eSwitchStatusChange;
raise eUnit;
}
fun Switch_ChangeSwitchStatus_exit0_rand_271150647()
{


;

}start  state Switch__Init
{entry (payload: machine) {
Switch__Init_entry56(payload);
}
exit  {
Switch__Init_exit0_rand_934482144();
}
on eUnit goto Switch_Switch_Init with   {
Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_1218404450();
}
}
 state Switch_Switch_Init
{entry  {
Switch_Switch_Init_entry61();
}
exit  {
Switch_Switch_Init_exit0_rand_1223099775();
}
on eUnit goto Switch_ChangeSwitchStatus with   {
Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1602743752();
}
}
 state Switch_ChangeSwitchStatus
{entry  {
Switch_ChangeSwitchStatus_entry69();
}
exit  {
Switch_ChangeSwitchStatus_exit0_rand_271150647();
}
on eUnit goto Switch_ChangeSwitchStatus with   {
Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_2145197214();
}
}
}

model LED
{
var LED_Driver: machine;

fun LED__Init_on_eUnit_goto_LED_LED_Init0_rand_2117480593()
{


;

}
fun LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_2138610693()
{


;

}
fun LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_1999272041()
{


;

}
fun LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_1628899978()
{


;

}
fun LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_1396259795()
{


;

}
fun LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_439270486()
{


;

}
fun LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_2054200054()
{


;

}
fun LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1009288255()
{


;

}
fun LED__Init_entry80(LED__Init_entry80_payload: machine)
{


LED_Driver = LED__Init_entry80_payload;
raise eUnit;
}
fun LED__Init_exit0_rand_323443046()
{


;

}
fun LED_LED_Init_entry0_rand_449316725()
{


;

}
fun LED_LED_Init_exit0_rand_51338740()
{


;

}
fun LED_ProcessUpdateLED_entry94()
{
var _tmp572: bool;


_tmp572 = $;
if(_tmp572)
{

send LED_Driver, eTransferSuccess;

}
else
{

send LED_Driver, eTransferFailure;

}

raise eUnit;
}
fun LED_ProcessUpdateLED_exit0_rand_1273545403()
{


;

}
fun LED_UnstableLED_entry108()
{


send LED_Driver, eTransferSuccess;
}
fun LED_UnstableLED_exit0_rand_1490313069()
{


;

}
fun LED_StableLED_entry118()
{


send LED_Driver, eTransferSuccess;
raise eUnit;
}
fun LED_StableLED_exit0_rand_5416480()
{


;

}start  state LED__Init
{entry (payload: machine) {
LED__Init_entry80(payload);
}
exit  {
LED__Init_exit0_rand_323443046();
}
on eUnit goto LED_LED_Init with   {
LED__Init_on_eUnit_goto_LED_LED_Init0_rand_2117480593();
}
}
 state LED_LED_Init
{entry  {
LED_LED_Init_entry0_rand_449316725();
}
exit  {
LED_LED_Init_exit0_rand_51338740();
}
on eUpdateBarGraphStateUsingControlTransfer goto LED_ProcessUpdateLED with   {
LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_2138610693();
}

on eSetLedStateToUnstableUsingControlTransfer goto LED_UnstableLED with   {
LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_1999272041();
}

on eSetLedStateToStableUsingControlTransfer goto LED_StableLED with   {
LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_1628899978();
}
}
 state LED_ProcessUpdateLED
{entry  {
LED_ProcessUpdateLED_entry94();
}
exit  {
LED_ProcessUpdateLED_exit0_rand_1273545403();
}
on eUnit goto LED_LED_Init with   {
LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_1396259795();
}
}
 state LED_UnstableLED
{entry  {
LED_UnstableLED_entry108();
}
exit  {
LED_UnstableLED_exit0_rand_1490313069();
}
on eSetLedStateToStableUsingControlTransfer goto LED_LED_Init with   {
LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_439270486();
}

on eUpdateBarGraphStateUsingControlTransfer goto LED_ProcessUpdateLED with   {
LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_2054200054();
}
}
 state LED_StableLED
{entry  {
LED_StableLED_entry118();
}
exit  {
LED_StableLED_exit0_rand_5416480();
}
on eUnit goto LED_LED_Init with   {
LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1009288255();
}
}
}

model Timer
{
var Timer_Driver: machine;

fun Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_932613397()
{


;

}
fun Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_1643178354()
{


;

}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_137908224()
{


;

}
fun Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_1807128772()
{


;

}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_580442718()
{


;

}
fun Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_2040527101()
{


;

}
fun Timer__Init_entry130(Timer__Init_entry130_payload: machine)
{


Timer_Driver = Timer__Init_entry130_payload;
raise eUnit;
}
fun Timer__Init_exit0_rand_1432993185()
{


;

}
fun Timer_Timer_Init_entry0_rand_2001302210()
{


;

}
fun Timer_Timer_Init_exit0_rand_216841135()
{


;

}
fun Timer_TimerStarted_entry144()
{
var _tmp573: bool;


_tmp573 = $;
if(_tmp573)
{

raise eUnit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_784116371()
{


;

}
fun Timer_SendTimerFired_entry155()
{


send Timer_Driver, eTimerFired;
raise eUnit;
}
fun Timer_SendTimerFired_exit0_rand_1453320404()
{


;

}
fun Timer_ConsmachineeringStoppingTimer_entry165()
{
var _tmp574: bool;


_tmp574 = $;
if(_tmp574)
{

send Timer_Driver, eStoppingFailure;
send Timer_Driver, eTimerFired;

}
else
{

send Timer_Driver, eStoppingSuccess;

}

raise eUnit;
}
fun Timer_ConsmachineeringStoppingTimer_exit0_rand_383520924()
{


;

}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry130(payload);
}
exit  {
Timer__Init_exit0_rand_1432993185();
}
on eUnit goto Timer_Timer_Init with   {
Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_932613397();
}
}
 state Timer_Timer_Init
{entry  {
Timer_Timer_Init_entry0_rand_2001302210();
}
exit  {
Timer_Timer_Init_exit0_rand_216841135();
}
ignore eStopTimer;on eStartDebounceTimer goto Timer_TimerStarted with   {
Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_1643178354();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry144();
}
exit  {
Timer_TimerStarted_exit0_rand_784116371();
}
defer eStartDebounceTimer;on eUnit goto Timer_SendTimerFired with   {
Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_137908224();
}

on eStopTimer goto Timer_ConsmachineeringStoppingTimer with   {
Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_1807128772();
}
}
 state Timer_SendTimerFired
{entry  {
Timer_SendTimerFired_entry155();
}
exit  {
Timer_SendTimerFired_exit0_rand_1453320404();
}
defer eStartDebounceTimer;on eUnit goto Timer_Timer_Init with   {
Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_580442718();
}
}
 state Timer_ConsmachineeringStoppingTimer
{entry  {
Timer_ConsmachineeringStoppingTimer_entry165();
}
exit  {
Timer_ConsmachineeringStoppingTimer_exit0_rand_383520924();
}
defer eStartDebounceTimer;on eUnit goto Timer_Timer_Init with   {
Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_2040527101();
}
}
}

machine OSRDriver
{
var OSRDriver_TimerV: machine;
var OSRDriver_LEDV: machine;
var OSRDriver_SwitchV: machine;
var OSRDriver_check: bool;

model fun OSRDriver_CompleteDStateTransition()
{


;

}
model fun OSRDriver_StoreSwitchAndEnableSwitchStatusChange()
{


;

}
model fun OSRDriver_CheckIfSwitchStatusChanged(): bool
{
var _tmp575: bool;


_tmp575 = $;
if(_tmp575)
{

return (true);

}
else
{

return (false);

}

}
model fun OSRDriver_UpdateBarGraphStateUsingControlTransfer()
{


send OSRDriver_LEDV, eUpdateBarGraphStateUsingControlTransfer;
}
model fun OSRDriver_SetLedStateToStableUsingControlTransfer()
{


send OSRDriver_LEDV, eSetLedStateToStableUsingControlTransfer;
}
model fun OSRDriver_SetLedStateToUnstableUsingControlTransfer()
{


send OSRDriver_LEDV, eSetLedStateToUnstableUsingControlTransfer;
}
model fun OSRDriver_StartDebounceTimer()
{


send OSRDriver_TimerV, eStartDebounceTimer;
}
fun OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_32243150()
{


;

}
fun OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_1378313299()
{


;

}
fun OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_542713527()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1329917045()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_834883526()
{


;

}
fun OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1859574350()
{


;

}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_2043339243()
{


;

}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_2096038130()
{


;

}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_925108370()
{


;

}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_351238332()
{


;

}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_376303435()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1452747020()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_336018713()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_533957082()
{


;

}
fun OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_579540700()
{


;

}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1911532302()
{


;

}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1933699111()
{


;

}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1270784763()
{


;

}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_2118692530()
{


;

}
fun OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1607502992()
{


;

}
fun OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_2088469074()
{


;

}
fun OSRDriver_Driver_Init_entry192()
{
var _tmp576: machine;
var _tmp577: machine;
var _tmp578: machine;


_tmp576 = new Timer(this);
OSRDriver_TimerV = _tmp576;
_tmp577 = new LED(this);
OSRDriver_LEDV = _tmp577;
_tmp578 = new Switch(this);
OSRDriver_SwitchV = _tmp578;
raise eUnit;
}
fun OSRDriver_Driver_Init_exit0_rand_1890653049()
{


;

}
fun OSRDriver_sDxDriver_entry0_rand_101857971()
{


;

}
fun OSRDriver_sDxDriver_exit0_rand_21442463()
{


;

}
fun OSRDriver_sCompleteD0EntryDriver_entry213()
{


OSRDriver_CompleteDStateTransition();
raise eOperationSuccess;
}
fun OSRDriver_sCompleteD0EntryDriver_exit0_rand_1213502323()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1648033709()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1252596543()
{


;

}
fun OSRDriver_sCompletingD0ExitDriver_entry233()
{


OSRDriver_CompleteDStateTransition();
raise eOperationSuccess;
}
fun OSRDriver_sCompletingD0ExitDriver_exit0_rand_2090996422()
{


;

}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268()
{


OSRDriver_StoreSwitchAndEnableSwitchStatusChange();
OSRDriver_check = OSRDriver_CheckIfSwitchStatusChanged();
if(OSRDriver_check)
{

raise eYes;

}
else
{

raise eNo;

}

}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_103251773()
{


;

}
fun OSRDriver_sUpdatingBarGraphStateDriver_entry284()
{


OSRDriver_UpdateBarGraphStateUsingControlTransfer();
}
fun OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1520242972()
{


;

}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_entry297()
{


OSRDriver_SetLedStateToUnstableUsingControlTransfer();
}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_429747555()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_entry306()
{


OSRDriver_StartDebounceTimer();
}
fun OSRDriver_sWaitingForTimerDriver_exit0_rand_1168564742()
{


;

}
fun OSRDriver_sUpdatingLedStateToStableDriver_entry320()
{


OSRDriver_SetLedStateToStableUsingControlTransfer();
}
fun OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_1856962890()
{


;

}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331()
{


raise eUnit;
}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_1014607108()
{


;

}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_entry342()
{


raise eUnit;
}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_1835919889()
{


;

}
fun OSRDriver_sStoppingTimerDriver_entry353()
{


send OSRDriver_TimerV, eStopTimer;
}
fun OSRDriver_sStoppingTimerDriver_exit0_rand_1120423373()
{


;

}
fun OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_2099541674()
{


;

}
fun OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_842408720()
{


;

}
fun OSRDriver_sReturningTimerStoppedDriver_entry375()
{


raise eTimerStopped;
}
fun OSRDriver_sReturningTimerStoppedDriver_exit0_rand_1651018397()
{


;

}start  state OSRDriver_Driver_Init
{entry  {
OSRDriver_Driver_Init_entry192();
}
exit  {
OSRDriver_Driver_Init_exit0_rand_1890653049();
}
defer eSwitchStatusChange;on eUnit goto OSRDriver_sDxDriver with   {
OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_32243150();
}
}
 state OSRDriver_sDxDriver
{entry  {
OSRDriver_sDxDriver_entry0_rand_101857971();
}
exit  {
OSRDriver_sDxDriver_exit0_rand_21442463();
}
defer eSwitchStatusChange;
ignore eD0Exit;on eD0Entry goto OSRDriver_sCompleteD0EntryDriver with   {
OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_1378313299();
}
}
 state OSRDriver_sCompleteD0EntryDriver
{entry  {
OSRDriver_sCompleteD0EntryDriver_entry213();
}
exit  {
OSRDriver_sCompleteD0EntryDriver_exit0_rand_1213502323();
}
defer eSwitchStatusChange;on eOperationSuccess goto OSRDriver_sWaitingForSwitchStatusChangeDriver with   {
OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_542713527();
}
}
 state OSRDriver_sWaitingForSwitchStatusChangeDriver
{entry  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1648033709();
}
exit  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1252596543();
}
ignore eD0Entry;on eD0Exit goto OSRDriver_sCompletingD0ExitDriver with   {
OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1329917045();
}

on eSwitchStatusChange goto OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver with   {
OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_834883526();
}
}
 state OSRDriver_sCompletingD0ExitDriver
{entry  {
OSRDriver_sCompletingD0ExitDriver_entry233();
}
exit  {
OSRDriver_sCompletingD0ExitDriver_exit0_rand_2090996422();
}
on eOperationSuccess goto OSRDriver_sDxDriver with   {
OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1859574350();
}
}
 state OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver
{entry  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268();
}
exit  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_103251773();
}
ignore eD0Entry;on eYes goto OSRDriver_sUpdatingBarGraphStateDriver with   {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_2043339243();
}

on eNo goto OSRDriver_sWaitingForTimerDriver with   {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_2096038130();
}
}
 state OSRDriver_sUpdatingBarGraphStateDriver
{entry  {
OSRDriver_sUpdatingBarGraphStateDriver_entry284();
}
exit  {
OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1520242972();
}
ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eTransferSuccess goto OSRDriver_sUpdatingLedStateToUnstableDriver with   {
OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_925108370();
}

on eTransferFailure goto OSRDriver_sUpdatingLedStateToUnstableDriver with   {
OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_351238332();
}
}
 state OSRDriver_sUpdatingLedStateToUnstableDriver
{entry  {
OSRDriver_sUpdatingLedStateToUnstableDriver_entry297();
}
exit  {
OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_429747555();
}
defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTransferSuccess goto OSRDriver_sWaitingForTimerDriver with   {
OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_376303435();
}
}
 state OSRDriver_sWaitingForTimerDriver
{entry  {
OSRDriver_sWaitingForTimerDriver_entry306();
}
exit  {
OSRDriver_sWaitingForTimerDriver_exit0_rand_1168564742();
}
ignore eD0Entry;on eTimerFired goto OSRDriver_sUpdatingLedStateToStableDriver with   {
OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1452747020();
}

on eSwitchStatusChange goto OSRDriver_sStoppingTimerOnStatusChangeDriver with   {
OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_336018713();
}

on eD0Exit goto OSRDriver_sStoppingTimerOnD0ExitDriver with   {
OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_533957082();
}
}
 state OSRDriver_sUpdatingLedStateToStableDriver
{entry  {
OSRDriver_sUpdatingLedStateToStableDriver_entry320();
}
exit  {
OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_1856962890();
}
ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eTransferSuccess goto OSRDriver_sWaitingForSwitchStatusChangeDriver with   {
OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_579540700();
}
}
 state OSRDriver_sStoppingTimerOnStatusChangeDriver
{entry  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331();
}
exit  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_1014607108();
}
ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eUnit push OSRDriver_sStoppingTimerDriver;
on eTimerStopped goto OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver with   {
OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1911532302();
}
}
 state OSRDriver_sStoppingTimerOnD0ExitDriver
{entry  {
OSRDriver_sStoppingTimerOnD0ExitDriver_entry342();
}
exit  {
OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_1835919889();
}
defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTimerStopped goto OSRDriver_sCompletingD0ExitDriver with   {
OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1933699111();
}

on eUnit push OSRDriver_sStoppingTimerDriver;}
 state OSRDriver_sStoppingTimerDriver
{entry  {
OSRDriver_sStoppingTimerDriver_entry353();
}
exit  {
OSRDriver_sStoppingTimerDriver_exit0_rand_1120423373();
}
ignore eD0Entry;on eStoppingSuccess goto OSRDriver_sReturningTimerStoppedDriver with   {
OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1270784763();
}

on eStoppingFailure goto OSRDriver_sWaitingForTimerToFlushDriver with   {
OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_2118692530();
}

on eTimerFired goto OSRDriver_sReturningTimerStoppedDriver with   {
OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1607502992();
}
}
 state OSRDriver_sWaitingForTimerToFlushDriver
{entry  {
OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_2099541674();
}
exit  {
OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_842408720();
}
defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTimerFired goto OSRDriver_sReturningTimerStoppedDriver with   {
OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_2088469074();
}
}
 state OSRDriver_sReturningTimerStoppedDriver
{entry  {
OSRDriver_sReturningTimerStoppedDriver_entry375();
}
exit  {
OSRDriver_sReturningTimerStoppedDriver_exit0_rand_1651018397();
}
ignore eD0Entry;}
}

