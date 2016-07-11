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

fun User_User_Init_entry29(User_User_Init_entry29__payload_0: any)
{
var _tmp1160: machine;


_tmp1160 = new OSRDriver(null);

User_Driver = _tmp1160;

raise eUnit;


}
fun User_User_Init_exit0_rand_1520436979()
{


;


}
fun User_S0_entry37(User_S0_entry37__payload_1: any)
{


send User_Driver, eD0Entry;

raise eUnit;


}
fun User_S0_exit0_rand_112853592()
{


;


}
fun User_S1_entry45(User_S1_entry45__payload_2: any)
{


send User_Driver, eD0Exit;

raise eUnit;


}
fun User_S1_exit0_rand_561585938()
{


;


}
fun User_User_Init_on_eUnit_goto_User_S00_rand_624549142(User_User_Init_on_eUnit_goto_User_S00_rand_624549142__payload_skip: any)
{


;


}
fun User_S0_on_eUnit_goto_User_S10_rand_939731197(User_S0_on_eUnit_goto_User_S10_rand_939731197__payload_skip: any)
{


;


}
fun User_S1_on_eUnit_goto_User_S00_rand_983862430(User_S1_on_eUnit_goto_User_S00_rand_983862430__payload_skip: any)
{


;


}start  state User_User_Init
{entry (payload: any) {
User_User_Init_entry29(payload);
}
exit  {
User_User_Init_exit0_rand_1520436979();
}
}
 state User_S0
{entry (payload: any) {
User_S0_entry37(payload);
}
exit  {
User_S0_exit0_rand_112853592();
}
}
 state User_S1
{entry (payload: any) {
User_S1_entry45(payload);
}
exit  {
User_S1_exit0_rand_561585938();
}
}
}

model Switch
{
var Switch_Driver: machine;

fun Switch__Init_entry56(Switch__Init_entry56_payload: machine)
{


Switch_Driver = Switch__Init_entry56_payload;

raise eUnit;


}
fun Switch__Init_exit0_rand_96102171()
{


;


}
fun Switch_Switch_Init_entry61(Switch_Switch_Init_entry61__payload_3: any)
{


raise eUnit;


}
fun Switch_Switch_Init_exit0_rand_1482578826()
{


;


}
fun Switch_ChangeSwitchStatus_entry69(Switch_ChangeSwitchStatus_entry69__payload_4: any)
{


send Switch_Driver, eSwitchStatusChange;

raise eUnit;


}
fun Switch_ChangeSwitchStatus_exit0_rand_1874433004()
{


;


}
fun Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_2113982644(Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_2113982644__payload_skip: any)
{


;


}
fun Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1612379962(Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1612379962__payload_skip: any)
{


;


}
fun Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1506974945(Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1506974945__payload_skip: any)
{


;


}start  state Switch__Init
{entry (payload: machine) {
Switch__Init_entry56(payload);
}
exit  {
Switch__Init_exit0_rand_96102171();
}
}
 state Switch_Switch_Init
{entry (payload: any) {
Switch_Switch_Init_entry61(payload);
}
exit  {
Switch_Switch_Init_exit0_rand_1482578826();
}
}
 state Switch_ChangeSwitchStatus
{entry (payload: any) {
Switch_ChangeSwitchStatus_entry69(payload);
}
exit  {
Switch_ChangeSwitchStatus_exit0_rand_1874433004();
}
}
}

model LED
{
var LED_Driver: machine;

fun LED__Init_entry80(LED__Init_entry80_payload: machine)
{


LED_Driver = LED__Init_entry80_payload;

raise eUnit;


}
fun LED__Init_exit0_rand_752482109()
{


;


}
fun LED_LED_Init_entry0_rand_841805645(LED_LED_Init_entry0_rand_841805645__payload_5: any)
{


;


}
fun LED_LED_Init_exit0_rand_1236575899()
{


;


}
fun LED_ProcessUpdateLED_entry94(LED_ProcessUpdateLED_entry94__payload_6: any)
{
var _tmp1161: bool;


_tmp1161 = $;

if(_tmp1161)
{

send LED_Driver, eTransferSuccess;

send LED_Driver, eTransferSuccess;



}
else
{

send LED_Driver, eTransferFailure;

send LED_Driver, eTransferFailure;



}

raise eUnit;


}
fun LED_ProcessUpdateLED_exit0_rand_831078537()
{


;


}
fun LED_UnstableLED_entry108(LED_UnstableLED_entry108__payload_7: any)
{


send LED_Driver, eTransferSuccess;


}
fun LED_UnstableLED_exit0_rand_2062668911()
{


;


}
fun LED_StableLED_entry118(LED_StableLED_entry118__payload_8: any)
{


send LED_Driver, eTransferSuccess;

raise eUnit;


}
fun LED_StableLED_exit0_rand_2039622135()
{


;


}
fun LED__Init_on_eUnit_goto_LED_LED_Init0_rand_679758456(LED__Init_on_eUnit_goto_LED_LED_Init0_rand_679758456__payload_skip: any)
{


;


}
fun LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_282137726(LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_282137726__payload_skip: any)
{


;


}
fun LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_1404378237(LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_1404378237__payload_skip: any)
{


;


}
fun LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_1346598940(LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_1346598940__payload_skip: any)
{


;


}
fun LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_764352969(LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_764352969__payload_skip: any)
{


;


}
fun LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_1814799824(LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_1814799824__payload_skip: any)
{


;


}
fun LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_14204909(LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_14204909__payload_skip: any)
{


;


}
fun LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1647876036(LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1647876036__payload_skip: any)
{


;


}start  state LED__Init
{entry (payload: machine) {
LED__Init_entry80(payload);
}
exit  {
LED__Init_exit0_rand_752482109();
}
}
 state LED_LED_Init
{entry (payload: any) {
LED_LED_Init_entry0_rand_841805645(payload);
}
exit  {
LED_LED_Init_exit0_rand_1236575899();
}
}
 state LED_ProcessUpdateLED
{entry (payload: any) {
LED_ProcessUpdateLED_entry94(payload);
}
exit  {
LED_ProcessUpdateLED_exit0_rand_831078537();
}
}
 state LED_UnstableLED
{entry (payload: any) {
LED_UnstableLED_entry108(payload);
}
exit  {
LED_UnstableLED_exit0_rand_2062668911();
}
}
 state LED_StableLED
{entry (payload: any) {
LED_StableLED_entry118(payload);
}
exit  {
LED_StableLED_exit0_rand_2039622135();
}
}
}

model Timer
{
var Timer_Driver: machine;

fun Timer__Init_entry130(Timer__Init_entry130_payload: machine)
{


Timer_Driver = Timer__Init_entry130_payload;

raise eUnit;


}
fun Timer__Init_exit0_rand_428224741()
{


;


}
fun Timer_Timer_Init_entry0_rand_1567913420(Timer_Timer_Init_entry0_rand_1567913420__payload_9: any)
{


;


}
fun Timer_Timer_Init_exit0_rand_413382911()
{


;


}
fun Timer_TimerStarted_entry144(Timer_TimerStarted_entry144__payload_10: any)
{
var _tmp1162: bool;


_tmp1162 = $;

if(_tmp1162)
{

raise eUnit;

raise eUnit;



}
else
{

;

;



}


}
fun Timer_TimerStarted_exit0_rand_1458129850()
{


;


}
fun Timer_SendTimerFired_entry155(Timer_SendTimerFired_entry155__payload_11: any)
{


send Timer_Driver, eTimerFired;

raise eUnit;


}
fun Timer_SendTimerFired_exit0_rand_1345479815()
{


;


}
fun Timer_ConsmachineeringStoppingTimer_entry165(Timer_ConsmachineeringStoppingTimer_entry165__payload_12: any)
{
var _tmp1163: bool;


_tmp1163 = $;

if(_tmp1163)
{

send Timer_Driver, eStoppingFailure;

send Timer_Driver, eTimerFired;

send Timer_Driver, eStoppingFailure;

send Timer_Driver, eTimerFired;



}
else
{

send Timer_Driver, eStoppingSuccess;

send Timer_Driver, eStoppingSuccess;



}

raise eUnit;


}
fun Timer_ConsmachineeringStoppingTimer_exit0_rand_502477606()
{


;


}
fun Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_1949060768(Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_1949060768__payload_skip: any)
{


;


}
fun Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_2091474754(Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_2091474754__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1353052430(Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1353052430__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_1842333205(Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_1842333205__payload_skip: any)
{


;


}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_218500715(Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_218500715__payload_skip: any)
{


;


}
fun Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_327077100(Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_327077100__payload_skip: any)
{


;


}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry130(payload);
}
exit  {
Timer__Init_exit0_rand_428224741();
}
}
 state Timer_Timer_Init
{entry (payload: any) {
Timer_Timer_Init_entry0_rand_1567913420(payload);
}
exit  {
Timer_Timer_Init_exit0_rand_413382911();
}
}
 state Timer_TimerStarted
{entry (payload: any) {
Timer_TimerStarted_entry144(payload);
}
exit  {
Timer_TimerStarted_exit0_rand_1458129850();
}
}
 state Timer_SendTimerFired
{entry (payload: any) {
Timer_SendTimerFired_entry155(payload);
}
exit  {
Timer_SendTimerFired_exit0_rand_1345479815();
}
}
 state Timer_ConsmachineeringStoppingTimer
{entry (payload: any) {
Timer_ConsmachineeringStoppingTimer_entry165(payload);
}
exit  {
Timer_ConsmachineeringStoppingTimer_exit0_rand_502477606();
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
var _tmp1164: bool;


_tmp1164 = $;

if(_tmp1164)
{

return (true);

return (true);



}
else
{

return (false);

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
fun OSRDriver_Driver_Init_entry192(OSRDriver_Driver_Init_entry192__payload_13: any)
{
var _tmp1165: machine;
var _tmp1166: machine;
var _tmp1167: machine;


_tmp1165 = new Timer(this);

OSRDriver_TimerV = _tmp1165;

_tmp1166 = new LED(this);

OSRDriver_LEDV = _tmp1166;

_tmp1167 = new Switch(this);

OSRDriver_SwitchV = _tmp1167;

raise eUnit;


}
fun OSRDriver_Driver_Init_exit0_rand_1921133348()
{


;


}
fun OSRDriver_sDxDriver_entry0_rand_1310414914(OSRDriver_sDxDriver_entry0_rand_1310414914__payload_14: any)
{


;


}
fun OSRDriver_sDxDriver_exit0_rand_398053260()
{


;


}
fun OSRDriver_sCompleteD0EntryDriver_entry213(OSRDriver_sCompleteD0EntryDriver_entry213__payload_15: any)
{


OSRDriver_CompleteDStateTransition();

raise eOperationSuccess;


}
fun OSRDriver_sCompleteD0EntryDriver_exit0_rand_1193359879()
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_2080986057(OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_2080986057__payload_16: any)
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_656847950()
{


;


}
fun OSRDriver_sCompletingD0ExitDriver_entry233(OSRDriver_sCompletingD0ExitDriver_entry233__payload_17: any)
{


OSRDriver_CompleteDStateTransition();

raise eOperationSuccess;


}
fun OSRDriver_sCompletingD0ExitDriver_exit0_rand_915278208()
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268__payload_18: any)
{


OSRDriver_StoreSwitchAndEnableSwitchStatusChange();

OSRDriver_check = OSRDriver_CheckIfSwitchStatusChanged();

if(OSRDriver_check)
{

raise eYes;

raise eYes;



}
else
{

raise eNo;

raise eNo;



}


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_1423162415()
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_entry284(OSRDriver_sUpdatingBarGraphStateDriver_entry284__payload_19: any)
{


OSRDriver_UpdateBarGraphStateUsingControlTransfer();


}
fun OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1141292009()
{


;


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_entry297(OSRDriver_sUpdatingLedStateToUnstableDriver_entry297__payload_20: any)
{


OSRDriver_SetLedStateToUnstableUsingControlTransfer();


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_267862519()
{


;


}
fun OSRDriver_sWaitingForTimerDriver_entry306(OSRDriver_sWaitingForTimerDriver_entry306__payload_21: any)
{


OSRDriver_StartDebounceTimer();


}
fun OSRDriver_sWaitingForTimerDriver_exit0_rand_865103063()
{


;


}
fun OSRDriver_sUpdatingLedStateToStableDriver_entry320(OSRDriver_sUpdatingLedStateToStableDriver_entry320__payload_22: any)
{


OSRDriver_SetLedStateToStableUsingControlTransfer();


}
fun OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_1071366202()
{


;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331(OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331__payload_23: any)
{


raise eUnit;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_1807905263()
{


;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_entry342(OSRDriver_sStoppingTimerOnD0ExitDriver_entry342__payload_24: any)
{


raise eUnit;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_1197204678()
{


;


}
fun OSRDriver_sStoppingTimerDriver_entry353(OSRDriver_sStoppingTimerDriver_entry353__payload_25: any)
{


send OSRDriver_TimerV, eStopTimer;


}
fun OSRDriver_sStoppingTimerDriver_exit0_rand_1810546107()
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_747312787(OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_747312787__payload_26: any)
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1547226455()
{


;


}
fun OSRDriver_sReturningTimerStoppedDriver_entry375(OSRDriver_sReturningTimerStoppedDriver_entry375__payload_27: any)
{


raise eTimerStopped;


}
fun OSRDriver_sReturningTimerStoppedDriver_exit0_rand_1497620174()
{


;


}
fun OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_179351182(OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_179351182__payload_skip: any)
{


;


}
fun OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_2052221635(OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_2052221635__payload_skip: any)
{


;


}
fun OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1328307610(OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1328307610__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_59416411(OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_59416411__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_733140995(OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_733140995__payload_skip: any)
{


;


}
fun OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_484619590(OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_484619590__payload_skip: any)
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_2124186229(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_2124186229__payload_skip: any)
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_165209697(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_165209697__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1170656921(OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1170656921__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_865464233(OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_865464233__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_229076028(OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_229076028__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1828395601(OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1828395601__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_20686965(OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_20686965__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_1063246384(OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_1063246384__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_833580708(OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_833580708__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_405748618(OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_405748618__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1666098823(OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1666098823__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1954634351(OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1954634351__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_1845518599(OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_1845518599__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1038561962(OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1038561962__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_513601423(OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_513601423__payload_skip: any)
{


;


}start  state OSRDriver_Driver_Init
{entry (payload: any) {
OSRDriver_Driver_Init_entry192(payload);
}
exit  {
OSRDriver_Driver_Init_exit0_rand_1921133348();
}
}
 state OSRDriver_sDxDriver
{entry (payload: any) {
OSRDriver_sDxDriver_entry0_rand_1310414914(payload);
}
exit  {
OSRDriver_sDxDriver_exit0_rand_398053260();
}
}
 state OSRDriver_sCompleteD0EntryDriver
{entry (payload: any) {
OSRDriver_sCompleteD0EntryDriver_entry213(payload);
}
exit  {
OSRDriver_sCompleteD0EntryDriver_exit0_rand_1193359879();
}
}
 state OSRDriver_sWaitingForSwitchStatusChangeDriver
{entry (payload: any) {
OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_2080986057(payload);
}
exit  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_656847950();
}
}
 state OSRDriver_sCompletingD0ExitDriver
{entry (payload: any) {
OSRDriver_sCompletingD0ExitDriver_entry233(payload);
}
exit  {
OSRDriver_sCompletingD0ExitDriver_exit0_rand_915278208();
}
}
 state OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver
{entry (payload: any) {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268(payload);
}
exit  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_1423162415();
}
}
 state OSRDriver_sUpdatingBarGraphStateDriver
{entry (payload: any) {
OSRDriver_sUpdatingBarGraphStateDriver_entry284(payload);
}
exit  {
OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1141292009();
}
}
 state OSRDriver_sUpdatingLedStateToUnstableDriver
{entry (payload: any) {
OSRDriver_sUpdatingLedStateToUnstableDriver_entry297(payload);
}
exit  {
OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_267862519();
}
}
 state OSRDriver_sWaitingForTimerDriver
{entry (payload: any) {
OSRDriver_sWaitingForTimerDriver_entry306(payload);
}
exit  {
OSRDriver_sWaitingForTimerDriver_exit0_rand_865103063();
}
}
 state OSRDriver_sUpdatingLedStateToStableDriver
{entry (payload: any) {
OSRDriver_sUpdatingLedStateToStableDriver_entry320(payload);
}
exit  {
OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_1071366202();
}
}
 state OSRDriver_sStoppingTimerOnStatusChangeDriver
{entry (payload: any) {
OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331(payload);
}
exit  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_1807905263();
}
}
 state OSRDriver_sStoppingTimerOnD0ExitDriver
{entry (payload: any) {
OSRDriver_sStoppingTimerOnD0ExitDriver_entry342(payload);
}
exit  {
OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_1197204678();
}
}
 state OSRDriver_sStoppingTimerDriver
{entry (payload: any) {
OSRDriver_sStoppingTimerDriver_entry353(payload);
}
exit  {
OSRDriver_sStoppingTimerDriver_exit0_rand_1810546107();
}
}
 state OSRDriver_sWaitingForTimerToFlushDriver
{entry (payload: any) {
OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_747312787(payload);
}
exit  {
OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1547226455();
}
}
 state OSRDriver_sReturningTimerStoppedDriver
{entry (payload: any) {
OSRDriver_sReturningTimerStoppedDriver_entry375(payload);
}
exit  {
OSRDriver_sReturningTimerStoppedDriver_exit0_rand_1497620174();
}
}
}

