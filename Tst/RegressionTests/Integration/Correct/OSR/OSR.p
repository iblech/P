event halt;
event null;
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

fun User_User_Init_entry29()
{
var _tmp571: machine;


_tmp571 = new OSRDriver(null);

User_Driver = _tmp571;

raise eUnit;


}
fun User_User_Init_exit0_rand_350392374()
{


;


}
fun User_S0_entry37()
{


send User_Driver, eD0Entry;

raise eUnit;


}
fun User_S0_exit0_rand_1708601113()
{


;


}
fun User_S1_entry45()
{


send User_Driver, eD0Exit;

raise eUnit;


}
fun User_S1_exit0_rand_4345279()
{


;


}
fun User_User_Init_on_eUnit_goto_User_S00_rand_515909830()
{


;


}
fun User_S0_on_eUnit_goto_User_S10_rand_668104825()
{


;


}
fun User_S1_on_eUnit_goto_User_S00_rand_1184644064()
{


;


}start  state User_User_Init
{entry  {
User_User_Init_entry29();
}
exit  {
User_User_Init_exit0_rand_350392374();
}
}
 state User_S0
{entry  {
User_S0_entry37();
}
exit  {
User_S0_exit0_rand_1708601113();
}
}
 state User_S1
{entry  {
User_S1_entry45();
}
exit  {
User_S1_exit0_rand_4345279();
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
fun Switch__Init_exit0_rand_1358609969()
{


;


}
fun Switch_Switch_Init_entry61()
{


raise eUnit;


}
fun Switch_Switch_Init_exit0_rand_1805486878()
{


;


}
fun Switch_ChangeSwitchStatus_entry69()
{


send Switch_Driver, eSwitchStatusChange;

raise eUnit;


}
fun Switch_ChangeSwitchStatus_exit0_rand_1536670185()
{


;


}
fun Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_799256311()
{


;


}
fun Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1800608508()
{


;


}
fun Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1761413024()
{


;


}start  state Switch__Init
{entry (payload: machine) {
Switch__Init_entry56(payload);
}
exit  {
Switch__Init_exit0_rand_1358609969();
}
}
 state Switch_Switch_Init
{entry  {
Switch_Switch_Init_entry61();
}
exit  {
Switch_Switch_Init_exit0_rand_1805486878();
}
}
 state Switch_ChangeSwitchStatus
{entry  {
Switch_ChangeSwitchStatus_entry69();
}
exit  {
Switch_ChangeSwitchStatus_exit0_rand_1536670185();
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
fun LED__Init_exit0_rand_1501587491()
{


;


}
fun LED_LED_Init_entry0_rand_332146420()
{


;


}
fun LED_LED_Init_exit0_rand_1997138674()
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

send LED_Driver, eTransferSuccess;



}
else
{

send LED_Driver, eTransferFailure;

send LED_Driver, eTransferFailure;



}

raise eUnit;


}
fun LED_ProcessUpdateLED_exit0_rand_1162319475()
{


;


}
fun LED_UnstableLED_entry108()
{


send LED_Driver, eTransferSuccess;


}
fun LED_UnstableLED_exit0_rand_926608773()
{


;


}
fun LED_StableLED_entry118()
{


send LED_Driver, eTransferSuccess;

raise eUnit;


}
fun LED_StableLED_exit0_rand_665886928()
{


;


}
fun LED__Init_on_eUnit_goto_LED_LED_Init0_rand_1825186586()
{


;


}
fun LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_858857672()
{


;


}
fun LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_53929553()
{


;


}
fun LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_130285814()
{


;


}
fun LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_1767695708()
{


;


}
fun LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_879595589()
{


;


}
fun LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_2090220907()
{


;


}
fun LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_462846339()
{


;


}start  state LED__Init
{entry (payload: machine) {
LED__Init_entry80(payload);
}
exit  {
LED__Init_exit0_rand_1501587491();
}
}
 state LED_LED_Init
{entry  {
LED_LED_Init_entry0_rand_332146420();
}
exit  {
LED_LED_Init_exit0_rand_1997138674();
}
}
 state LED_ProcessUpdateLED
{entry  {
LED_ProcessUpdateLED_entry94();
}
exit  {
LED_ProcessUpdateLED_exit0_rand_1162319475();
}
}
 state LED_UnstableLED
{entry  {
LED_UnstableLED_entry108();
}
exit  {
LED_UnstableLED_exit0_rand_926608773();
}
}
 state LED_StableLED
{entry  {
LED_StableLED_entry118();
}
exit  {
LED_StableLED_exit0_rand_665886928();
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
fun Timer__Init_exit0_rand_1718486285()
{


;


}
fun Timer_Timer_Init_entry0_rand_1674990019()
{


;


}
fun Timer_Timer_Init_exit0_rand_142683717()
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

raise eUnit;



}
else
{

;

;



}


}
fun Timer_TimerStarted_exit0_rand_807279743()
{


;


}
fun Timer_SendTimerFired_entry155()
{


send Timer_Driver, eTimerFired;

raise eUnit;


}
fun Timer_SendTimerFired_exit0_rand_977788011()
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
fun Timer_ConsmachineeringStoppingTimer_exit0_rand_1252391950()
{


;


}
fun Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_123549859()
{


;


}
fun Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_1254208143()
{


;


}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1147891008()
{


;


}
fun Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_1818119404()
{


;


}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_2010335278()
{


;


}
fun Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_1455313112()
{


;


}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry130(payload);
}
exit  {
Timer__Init_exit0_rand_1718486285();
}
}
 state Timer_Timer_Init
{entry  {
Timer_Timer_Init_entry0_rand_1674990019();
}
exit  {
Timer_Timer_Init_exit0_rand_142683717();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry144();
}
exit  {
Timer_TimerStarted_exit0_rand_807279743();
}
}
 state Timer_SendTimerFired
{entry  {
Timer_SendTimerFired_entry155();
}
exit  {
Timer_SendTimerFired_exit0_rand_977788011();
}
}
 state Timer_ConsmachineeringStoppingTimer
{entry  {
Timer_ConsmachineeringStoppingTimer_entry165();
}
exit  {
Timer_ConsmachineeringStoppingTimer_exit0_rand_1252391950();
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
fun OSRDriver_Driver_Init_exit0_rand_22635278()
{


;


}
fun OSRDriver_sDxDriver_entry0_rand_158966463()
{


;


}
fun OSRDriver_sDxDriver_exit0_rand_99853604()
{


;


}
fun OSRDriver_sCompleteD0EntryDriver_entry213()
{


OSRDriver_CompleteDStateTransition();

raise eOperationSuccess;


}
fun OSRDriver_sCompleteD0EntryDriver_exit0_rand_1042562909()
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1874504476()
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1518152125()
{


;


}
fun OSRDriver_sCompletingD0ExitDriver_entry233()
{


OSRDriver_CompleteDStateTransition();

raise eOperationSuccess;


}
fun OSRDriver_sCompletingD0ExitDriver_exit0_rand_599038718()
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

raise eYes;



}
else
{

raise eNo;

raise eNo;



}


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_1294585189()
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_entry284()
{


OSRDriver_UpdateBarGraphStateUsingControlTransfer();


}
fun OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_2049689029()
{


;


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_entry297()
{


OSRDriver_SetLedStateToUnstableUsingControlTransfer();


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_238390504()
{


;


}
fun OSRDriver_sWaitingForTimerDriver_entry306()
{


OSRDriver_StartDebounceTimer();


}
fun OSRDriver_sWaitingForTimerDriver_exit0_rand_978409305()
{


;


}
fun OSRDriver_sUpdatingLedStateToStableDriver_entry320()
{


OSRDriver_SetLedStateToStableUsingControlTransfer();


}
fun OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_368932389()
{


;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331()
{


raise eUnit;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_2083442635()
{


;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_entry342()
{


raise eUnit;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_597834957()
{


;


}
fun OSRDriver_sStoppingTimerDriver_entry353()
{


send OSRDriver_TimerV, eStopTimer;


}
fun OSRDriver_sStoppingTimerDriver_exit0_rand_32079569()
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_2084091892()
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_2124117627()
{


;


}
fun OSRDriver_sReturningTimerStoppedDriver_entry375()
{


raise eTimerStopped;


}
fun OSRDriver_sReturningTimerStoppedDriver_exit0_rand_2083028373()
{


;


}
fun OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_1981580284()
{


;


}
fun OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_633676801()
{


;


}
fun OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_759571251()
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_510901689()
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1634464803()
{


;


}
fun OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1263196987()
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_1501220762()
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1628206285()
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1226360487()
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_328773816()
{


;


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_633807359()
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1781878040()
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_1698356039()
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_207138991()
{


;


}
fun OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_291369913()
{


;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_309683186()
{


;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_67747886()
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1370862614()
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_505841602()
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_485924227()
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1364859970()
{


;


}start  state OSRDriver_Driver_Init
{entry  {
OSRDriver_Driver_Init_entry192();
}
exit  {
OSRDriver_Driver_Init_exit0_rand_22635278();
}
}
 state OSRDriver_sDxDriver
{entry  {
OSRDriver_sDxDriver_entry0_rand_158966463();
}
exit  {
OSRDriver_sDxDriver_exit0_rand_99853604();
}
}
 state OSRDriver_sCompleteD0EntryDriver
{entry  {
OSRDriver_sCompleteD0EntryDriver_entry213();
}
exit  {
OSRDriver_sCompleteD0EntryDriver_exit0_rand_1042562909();
}
}
 state OSRDriver_sWaitingForSwitchStatusChangeDriver
{entry  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1874504476();
}
exit  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1518152125();
}
}
 state OSRDriver_sCompletingD0ExitDriver
{entry  {
OSRDriver_sCompletingD0ExitDriver_entry233();
}
exit  {
OSRDriver_sCompletingD0ExitDriver_exit0_rand_599038718();
}
}
 state OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver
{entry  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268();
}
exit  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_1294585189();
}
}
 state OSRDriver_sUpdatingBarGraphStateDriver
{entry  {
OSRDriver_sUpdatingBarGraphStateDriver_entry284();
}
exit  {
OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_2049689029();
}
}
 state OSRDriver_sUpdatingLedStateToUnstableDriver
{entry  {
OSRDriver_sUpdatingLedStateToUnstableDriver_entry297();
}
exit  {
OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_238390504();
}
}
 state OSRDriver_sWaitingForTimerDriver
{entry  {
OSRDriver_sWaitingForTimerDriver_entry306();
}
exit  {
OSRDriver_sWaitingForTimerDriver_exit0_rand_978409305();
}
}
 state OSRDriver_sUpdatingLedStateToStableDriver
{entry  {
OSRDriver_sUpdatingLedStateToStableDriver_entry320();
}
exit  {
OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_368932389();
}
}
 state OSRDriver_sStoppingTimerOnStatusChangeDriver
{entry  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331();
}
exit  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_2083442635();
}
}
 state OSRDriver_sStoppingTimerOnD0ExitDriver
{entry  {
OSRDriver_sStoppingTimerOnD0ExitDriver_entry342();
}
exit  {
OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_597834957();
}
}
 state OSRDriver_sStoppingTimerDriver
{entry  {
OSRDriver_sStoppingTimerDriver_entry353();
}
exit  {
OSRDriver_sStoppingTimerDriver_exit0_rand_32079569();
}
}
 state OSRDriver_sWaitingForTimerToFlushDriver
{entry  {
OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_2084091892();
}
exit  {
OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_2124117627();
}
}
 state OSRDriver_sReturningTimerStoppedDriver
{entry  {
OSRDriver_sReturningTimerStoppedDriver_entry375();
}
exit  {
OSRDriver_sReturningTimerStoppedDriver_exit0_rand_2083028373();
}
}
}

