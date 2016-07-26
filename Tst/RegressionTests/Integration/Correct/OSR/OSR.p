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

fun User_User_Init_on_eUnit_goto_User_S00_rand_1697047354(User_User_Init_on_eUnit_goto_User_S00_rand_1697047354__payload_skip: any)
{


;

;

return;
}
fun User_S0_on_eUnit_goto_User_S10_rand_1910913657(User_S0_on_eUnit_goto_User_S10_rand_1910913657__payload_skip: any)
{


;

;

return;
}
fun User_S1_on_eUnit_goto_User_S00_rand_1939012258(User_S1_on_eUnit_goto_User_S00_rand_1939012258__payload_skip: any)
{


;

;

return;
}
fun User_User_Init_entry29(User_User_Init_entry29__payload_0: null)
{
var Tmp638: machine;


;

Tmp638 = new OSRDriver(null);
User_Driver = Tmp638;
;

raise eUnit;
return;
}
fun User_User_Init_exit0_rand_896095747(User_User_Init_exit0_rand_896095747__payload_skip: any)
{


;

;

return;
}
fun User_S0_entry37(User_S0_entry37__payload_1: null)
{


;

send User_Driver, eD0Entry;
;

raise eUnit;
return;
}
fun User_S0_exit0_rand_426916694(User_S0_exit0_rand_426916694__payload_skip: any)
{


;

;

return;
}
fun User_S1_entry45(User_S1_entry45__payload_2: null)
{


;

send User_Driver, eD0Exit;
;

raise eUnit;
return;
}
fun User_S1_exit0_rand_1699240838(User_S1_exit0_rand_1699240838__payload_skip: any)
{


;

;

return;
}start 
 state User_User_Init
{
entry (payload: null) {
User_User_Init_entry29(payload);
}exit {
User_User_Init_exit0_rand_896095747(null);
}on eUnit goto User_S0 with (payload: null) {
User_User_Init_on_eUnit_goto_User_S00_rand_1697047354(payload);
}}

 state User_S0
{
entry (payload: null) {
User_S0_entry37(payload);
}exit {
User_S0_exit0_rand_426916694(null);
}on eUnit goto User_S1 with (payload: null) {
User_S0_on_eUnit_goto_User_S10_rand_1910913657(payload);
}}

 state User_S1
{
entry (payload: null) {
User_S1_entry45(payload);
}exit {
User_S1_exit0_rand_1699240838(null);
}on eUnit goto User_S0 with (payload: null) {
User_S1_on_eUnit_goto_User_S00_rand_1939012258(payload);
}}
}

machine Switch
{
var Switch_Driver: machine;

fun Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_1080908069(Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_1080908069__payload_skip: any)
{


;

;

return;
}
fun Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_836992160(Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_836992160__payload_skip: any)
{


;

;

return;
}
fun Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1417381375(Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1417381375__payload_skip: any)
{


;

;

return;
}
fun Switch__Init_entry56(Switch__Init_entry56_payload: machine)
{


;

Switch_Driver = Switch__Init_entry56_payload;
;

raise eUnit;
return;
}
fun Switch__Init_exit0_rand_1640850447(Switch__Init_exit0_rand_1640850447__payload_skip: any)
{


;

;

return;
}
fun Switch_Switch_Init_entry61(Switch_Switch_Init_entry61__payload_3: null)
{


;

raise eUnit;
return;
}
fun Switch_Switch_Init_exit0_rand_294229782(Switch_Switch_Init_exit0_rand_294229782__payload_skip: any)
{


;

;

return;
}
fun Switch_ChangeSwitchStatus_entry69(Switch_ChangeSwitchStatus_entry69__payload_4: null)
{


;

send Switch_Driver, eSwitchStatusChange;
;

raise eUnit;
return;
}
fun Switch_ChangeSwitchStatus_exit0_rand_615596576(Switch_ChangeSwitchStatus_exit0_rand_615596576__payload_skip: any)
{


;

;

return;
}start 
 state Switch__Init
{
entry (payload: machine) {
Switch__Init_entry56(payload);
}exit {
Switch__Init_exit0_rand_1640850447(null);
}on eUnit goto Switch_Switch_Init with (payload: null) {
Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_1080908069(payload);
}}

 state Switch_Switch_Init
{
entry (payload: null) {
Switch_Switch_Init_entry61(payload);
}exit {
Switch_Switch_Init_exit0_rand_294229782(null);
}on eUnit goto Switch_ChangeSwitchStatus with (payload: null) {
Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_836992160(payload);
}}

 state Switch_ChangeSwitchStatus
{
entry (payload: null) {
Switch_ChangeSwitchStatus_entry69(payload);
}exit {
Switch_ChangeSwitchStatus_exit0_rand_615596576(null);
}on eUnit goto Switch_ChangeSwitchStatus with (payload: null) {
Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1417381375(payload);
}}
}

machine LED
{
var LED_Driver: machine;

fun LED__Init_on_eUnit_goto_LED_LED_Init0_rand_714650234(LED__Init_on_eUnit_goto_LED_LED_Init0_rand_714650234__payload_skip: any)
{


;

;

return;
}
fun LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_792403303(LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_792403303__payload_skip: any)
{


;

;

return;
}
fun LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_1972559417(LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_1972559417__payload_skip: any)
{


;

;

return;
}
fun LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_936692279(LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_936692279__payload_skip: any)
{


;

;

return;
}
fun LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_75615131(LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_75615131__payload_skip: any)
{


;

;

return;
}
fun LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_145560471(LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_145560471__payload_skip: any)
{


;

;

return;
}
fun LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_404831120(LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_404831120__payload_skip: any)
{


;

;

return;
}
fun LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1731846478(LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1731846478__payload_skip: any)
{


;

;

return;
}
fun LED__Init_entry80(LED__Init_entry80_payload: machine)
{


;

LED_Driver = LED__Init_entry80_payload;
;

raise eUnit;
return;
}
fun LED__Init_exit0_rand_597407288(LED__Init_exit0_rand_597407288__payload_skip: any)
{


;

;

return;
}
fun LED_LED_Init_entry0_rand_1713757007(LED_LED_Init_entry0_rand_1713757007__payload_5: null)
{


;

;

return;
}
fun LED_LED_Init_exit0_rand_982247926(LED_LED_Init_exit0_rand_982247926__payload_skip: any)
{


;

;

return;
}
fun LED_ProcessUpdateLED_entry94(LED_ProcessUpdateLED_entry94__payload_6: null)
{
var Tmp639: bool;


;

Tmp639 = $;
if(Tmp639)
{

;

send LED_Driver, eTransferSuccess;

}
else
{

;

send LED_Driver, eTransferFailure;

}

;

raise eUnit;
return;
}
fun LED_ProcessUpdateLED_exit0_rand_325966023(LED_ProcessUpdateLED_exit0_rand_325966023__payload_skip: any)
{


;

;

return;
}
fun LED_UnstableLED_entry108(LED_UnstableLED_entry108__payload_7: null)
{


;

send LED_Driver, eTransferSuccess;
return;
}
fun LED_UnstableLED_exit0_rand_1967884293(LED_UnstableLED_exit0_rand_1967884293__payload_skip: any)
{


;

;

return;
}
fun LED_StableLED_entry118(LED_StableLED_entry118__payload_8: null)
{


;

send LED_Driver, eTransferSuccess;
;

raise eUnit;
return;
}
fun LED_StableLED_exit0_rand_77519974(LED_StableLED_exit0_rand_77519974__payload_skip: any)
{


;

;

return;
}start 
 state LED__Init
{
entry (payload: machine) {
LED__Init_entry80(payload);
}exit {
LED__Init_exit0_rand_597407288(null);
}on eUnit goto LED_LED_Init with (payload: null) {
LED__Init_on_eUnit_goto_LED_LED_Init0_rand_714650234(payload);
}}

 state LED_LED_Init
{
entry (payload: null) {
LED_LED_Init_entry0_rand_1713757007(payload);
}exit {
LED_LED_Init_exit0_rand_982247926(null);
}on eUpdateBarGraphStateUsingControlTransfer goto LED_ProcessUpdateLED with (payload: null) {
LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_792403303(payload);
}
on eSetLedStateToUnstableUsingControlTransfer goto LED_UnstableLED with (payload: null) {
LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_1972559417(payload);
}
on eSetLedStateToStableUsingControlTransfer goto LED_StableLED with (payload: null) {
LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_936692279(payload);
}}

 state LED_ProcessUpdateLED
{
entry (payload: null) {
LED_ProcessUpdateLED_entry94(payload);
}exit {
LED_ProcessUpdateLED_exit0_rand_325966023(null);
}on eUnit goto LED_LED_Init with (payload: null) {
LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_75615131(payload);
}}

 state LED_UnstableLED
{
entry (payload: null) {
LED_UnstableLED_entry108(payload);
}exit {
LED_UnstableLED_exit0_rand_1967884293(null);
}on eSetLedStateToStableUsingControlTransfer goto LED_LED_Init with (payload: null) {
LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_145560471(payload);
}
on eUpdateBarGraphStateUsingControlTransfer goto LED_ProcessUpdateLED with (payload: null) {
LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_404831120(payload);
}}

 state LED_StableLED
{
entry (payload: null) {
LED_StableLED_entry118(payload);
}exit {
LED_StableLED_exit0_rand_77519974(null);
}on eUnit goto LED_LED_Init with (payload: null) {
LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1731846478(payload);
}}
}

machine Timer
{
var Timer_Driver: machine;

fun Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_533576699(Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_533576699__payload_skip: any)
{


;

;

return;
}
fun Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_1951679712(Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_1951679712__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1667163511(Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1667163511__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_112524665(Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_112524665__payload_skip: any)
{


;

;

return;
}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_812127445(Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_812127445__payload_skip: any)
{


;

;

return;
}
fun Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_1313183805(Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_1313183805__payload_skip: any)
{


;

;

return;
}
fun Timer__Init_entry130(Timer__Init_entry130_payload: machine)
{


;

Timer_Driver = Timer__Init_entry130_payload;
;

raise eUnit;
return;
}
fun Timer__Init_exit0_rand_261779304(Timer__Init_exit0_rand_261779304__payload_skip: any)
{


;

;

return;
}
fun Timer_Timer_Init_entry0_rand_1109784258(Timer_Timer_Init_entry0_rand_1109784258__payload_9: null)
{


;

;

return;
}
fun Timer_Timer_Init_exit0_rand_227501281(Timer_Timer_Init_exit0_rand_227501281__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_entry144(Timer_TimerStarted_entry144__payload_10: null)
{
var Tmp640: bool;


;

Tmp640 = $;
if(Tmp640)
{

;

raise eUnit;

}
else
{

;

;


}

return;
}
fun Timer_TimerStarted_exit0_rand_643666153(Timer_TimerStarted_exit0_rand_643666153__payload_skip: any)
{


;

;

return;
}
fun Timer_SendTimerFired_entry155(Timer_SendTimerFired_entry155__payload_11: null)
{


;

send Timer_Driver, eTimerFired;
;

raise eUnit;
return;
}
fun Timer_SendTimerFired_exit0_rand_534857201(Timer_SendTimerFired_exit0_rand_534857201__payload_skip: any)
{


;

;

return;
}
fun Timer_ConsmachineeringStoppingTimer_entry165(Timer_ConsmachineeringStoppingTimer_entry165__payload_12: null)
{
var Tmp641: bool;


;

Tmp641 = $;
if(Tmp641)
{

;

send Timer_Driver, eStoppingFailure;
;

send Timer_Driver, eTimerFired;

}
else
{

;

send Timer_Driver, eStoppingSuccess;

}

;

raise eUnit;
return;
}
fun Timer_ConsmachineeringStoppingTimer_exit0_rand_1063088598(Timer_ConsmachineeringStoppingTimer_exit0_rand_1063088598__payload_skip: any)
{


;

;

return;
}start 
 state Timer__Init
{
entry (payload: machine) {
Timer__Init_entry130(payload);
}exit {
Timer__Init_exit0_rand_261779304(null);
}on eUnit goto Timer_Timer_Init with (payload: null) {
Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_533576699(payload);
}}

 state Timer_Timer_Init
{
entry (payload: null) {
Timer_Timer_Init_entry0_rand_1109784258(payload);
}exit {
Timer_Timer_Init_exit0_rand_227501281(null);
}ignore eStopTimer;on eStartDebounceTimer goto Timer_TimerStarted with (payload: null) {
Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_1951679712(payload);
}}

 state Timer_TimerStarted
{
entry (payload: null) {
Timer_TimerStarted_entry144(payload);
}exit {
Timer_TimerStarted_exit0_rand_643666153(null);
}defer eStartDebounceTimer;on eUnit goto Timer_SendTimerFired with (payload: null) {
Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1667163511(payload);
}
on eStopTimer goto Timer_ConsmachineeringStoppingTimer with (payload: null) {
Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_112524665(payload);
}}

 state Timer_SendTimerFired
{
entry (payload: null) {
Timer_SendTimerFired_entry155(payload);
}exit {
Timer_SendTimerFired_exit0_rand_534857201(null);
}defer eStartDebounceTimer;on eUnit goto Timer_Timer_Init with (payload: null) {
Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_812127445(payload);
}}

 state Timer_ConsmachineeringStoppingTimer
{
entry (payload: null) {
Timer_ConsmachineeringStoppingTimer_entry165(payload);
}exit {
Timer_ConsmachineeringStoppingTimer_exit0_rand_1063088598(null);
}defer eStartDebounceTimer;on eUnit goto Timer_Timer_Init with (payload: null) {
Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_1313183805(payload);
}}
}

machine OSRDriver
{
var OSRDriver_TimerV: machine;
var OSRDriver_LEDV: machine;
var OSRDriver_SwitchV: machine;
var OSRDriver_check: bool;

fun OSRDriver_CompleteDStateTransition()
{


;

;

}
fun OSRDriver_StoreSwitchAndEnableSwitchStatusChange()
{


;

;

}
fun OSRDriver_CheckIfSwitchStatusChanged(): bool
{
var Tmp642: bool;


;

Tmp642 = $;
if(Tmp642)
{

;

return (true);

}
else
{

;

return (false);

}

}
fun OSRDriver_UpdateBarGraphStateUsingControlTransfer()
{


;

send OSRDriver_LEDV, eUpdateBarGraphStateUsingControlTransfer;
}
fun OSRDriver_SetLedStateToStableUsingControlTransfer()
{


;

send OSRDriver_LEDV, eSetLedStateToStableUsingControlTransfer;
}
fun OSRDriver_SetLedStateToUnstableUsingControlTransfer()
{


;

send OSRDriver_LEDV, eSetLedStateToUnstableUsingControlTransfer;
}
fun OSRDriver_StartDebounceTimer()
{


;

send OSRDriver_TimerV, eStartDebounceTimer;
}
fun OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_180259720(OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_180259720__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_1469546073(OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_1469546073__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1267247504(OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1267247504__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1404155057(OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1404155057__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_17819471(OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_17819471__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1146106941(OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1146106941__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_464891251(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_464891251__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1875694831(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1875694831__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1212014014(OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1212014014__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_258537160(OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_258537160__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_1336218175(OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_1336218175__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1569736390(OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1569736390__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_882394255(OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_882394255__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_665611546(OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_665611546__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1130614081(OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1130614081__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1114439640(OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1114439640__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1441871190(OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1441871190__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1730631427(OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1730631427__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_1029061016(OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_1029061016__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_993101833(OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_993101833__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1962718632(OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1962718632__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_Driver_Init_entry192(OSRDriver_Driver_Init_entry192__payload_13: null)
{
var Tmp643: machine;
var Tmp644: machine;
var Tmp645: machine;


;

Tmp643 = new Timer(this);
OSRDriver_TimerV = Tmp643;
;

Tmp644 = new LED(this);
OSRDriver_LEDV = Tmp644;
;

Tmp645 = new Switch(this);
OSRDriver_SwitchV = Tmp645;
;

raise eUnit;
return;
}
fun OSRDriver_Driver_Init_exit0_rand_1838368866(OSRDriver_Driver_Init_exit0_rand_1838368866__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sDxDriver_entry0_rand_952490124(OSRDriver_sDxDriver_entry0_rand_952490124__payload_14: null)
{


;

;

return;
}
fun OSRDriver_sDxDriver_exit0_rand_986439050(OSRDriver_sDxDriver_exit0_rand_986439050__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sCompleteD0EntryDriver_entry213(OSRDriver_sCompleteD0EntryDriver_entry213__payload_15: null)
{


;

OSRDriver_CompleteDStateTransition();
;

raise eOperationSuccess;
return;
}
fun OSRDriver_sCompleteD0EntryDriver_exit0_rand_1727872936(OSRDriver_sCompleteD0EntryDriver_exit0_rand_1727872936__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1714022257(OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1714022257__payload_16: null)
{


;

;

return;
}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1747957751(OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1747957751__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sCompletingD0ExitDriver_entry233(OSRDriver_sCompletingD0ExitDriver_entry233__payload_17: null)
{


;

OSRDriver_CompleteDStateTransition();
;

raise eOperationSuccess;
return;
}
fun OSRDriver_sCompletingD0ExitDriver_exit0_rand_653362388(OSRDriver_sCompletingD0ExitDriver_exit0_rand_653362388__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268__payload_18: null)
{


;

OSRDriver_StoreSwitchAndEnableSwitchStatusChange();
;

OSRDriver_check = OSRDriver_CheckIfSwitchStatusChanged();
;

if(OSRDriver_check)
{

;

raise eYes;

}
else
{

;

raise eNo;

}

return;
}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_1410649863(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_1410649863__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sUpdatingBarGraphStateDriver_entry284(OSRDriver_sUpdatingBarGraphStateDriver_entry284__payload_19: null)
{


;

OSRDriver_UpdateBarGraphStateUsingControlTransfer();
return;
}
fun OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1886703221(OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1886703221__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_entry297(OSRDriver_sUpdatingLedStateToUnstableDriver_entry297__payload_20: null)
{


;

OSRDriver_SetLedStateToUnstableUsingControlTransfer();
return;
}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_601232397(OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_601232397__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForTimerDriver_entry306(OSRDriver_sWaitingForTimerDriver_entry306__payload_21: null)
{


;

OSRDriver_StartDebounceTimer();
return;
}
fun OSRDriver_sWaitingForTimerDriver_exit0_rand_1566620706(OSRDriver_sWaitingForTimerDriver_exit0_rand_1566620706__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sUpdatingLedStateToStableDriver_entry320(OSRDriver_sUpdatingLedStateToStableDriver_entry320__payload_22: null)
{


;

OSRDriver_SetLedStateToStableUsingControlTransfer();
return;
}
fun OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_509808522(OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_509808522__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331(OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331__payload_23: null)
{


;

raise eUnit;
return;
}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_2084015731(OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_2084015731__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_entry342(OSRDriver_sStoppingTimerOnD0ExitDriver_entry342__payload_24: null)
{


;

raise eUnit;
return;
}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_1230947296(OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_1230947296__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sStoppingTimerDriver_entry353(OSRDriver_sStoppingTimerDriver_entry353__payload_25: null)
{


;

send OSRDriver_TimerV, eStopTimer;
return;
}
fun OSRDriver_sStoppingTimerDriver_exit0_rand_1966509259(OSRDriver_sStoppingTimerDriver_exit0_rand_1966509259__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_1497948820(OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_1497948820__payload_26: null)
{


;

;

return;
}
fun OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1431647620(OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1431647620__payload_skip: any)
{


;

;

return;
}
fun OSRDriver_sReturningTimerStoppedDriver_entry375(OSRDriver_sReturningTimerStoppedDriver_entry375__payload_27: null)
{


;

raise eTimerStopped;
return;
}
fun OSRDriver_sReturningTimerStoppedDriver_exit0_rand_1042629379(OSRDriver_sReturningTimerStoppedDriver_exit0_rand_1042629379__payload_skip: any)
{


;

;

return;
}start 
 state OSRDriver_Driver_Init
{
entry (payload: null) {
OSRDriver_Driver_Init_entry192(payload);
}exit {
OSRDriver_Driver_Init_exit0_rand_1838368866(null);
}defer eSwitchStatusChange;on eUnit goto OSRDriver_sDxDriver with (payload: null) {
OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_180259720(payload);
}}

 state OSRDriver_sDxDriver
{
entry (payload: null) {
OSRDriver_sDxDriver_entry0_rand_952490124(payload);
}exit {
OSRDriver_sDxDriver_exit0_rand_986439050(null);
}defer eSwitchStatusChange;
ignore eD0Exit;on eD0Entry goto OSRDriver_sCompleteD0EntryDriver with (payload: null) {
OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_1469546073(payload);
}}

 state OSRDriver_sCompleteD0EntryDriver
{
entry (payload: null) {
OSRDriver_sCompleteD0EntryDriver_entry213(payload);
}exit {
OSRDriver_sCompleteD0EntryDriver_exit0_rand_1727872936(null);
}defer eSwitchStatusChange;on eOperationSuccess goto OSRDriver_sWaitingForSwitchStatusChangeDriver with (payload: null) {
OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1267247504(payload);
}}

 state OSRDriver_sWaitingForSwitchStatusChangeDriver
{
entry (payload: null) {
OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1714022257(payload);
}exit {
OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1747957751(null);
}ignore eD0Entry;on eD0Exit goto OSRDriver_sCompletingD0ExitDriver with (payload: null) {
OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1404155057(payload);
}
on eSwitchStatusChange goto OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver with (payload: null) {
OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_17819471(payload);
}}

 state OSRDriver_sCompletingD0ExitDriver
{
entry (payload: null) {
OSRDriver_sCompletingD0ExitDriver_entry233(payload);
}exit {
OSRDriver_sCompletingD0ExitDriver_exit0_rand_653362388(null);
}on eOperationSuccess goto OSRDriver_sDxDriver with (payload: null) {
OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1146106941(payload);
}}

 state OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver
{
entry (payload: null) {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268(payload);
}exit {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_1410649863(null);
}ignore eD0Entry;on eYes goto OSRDriver_sUpdatingBarGraphStateDriver with (payload: null) {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_464891251(payload);
}
on eNo goto OSRDriver_sWaitingForTimerDriver with (payload: null) {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1875694831(payload);
}}

 state OSRDriver_sUpdatingBarGraphStateDriver
{
entry (payload: null) {
OSRDriver_sUpdatingBarGraphStateDriver_entry284(payload);
}exit {
OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1886703221(null);
}ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eTransferSuccess goto OSRDriver_sUpdatingLedStateToUnstableDriver with (payload: null) {
OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1212014014(payload);
}
on eTransferFailure goto OSRDriver_sUpdatingLedStateToUnstableDriver with (payload: null) {
OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_258537160(payload);
}}

 state OSRDriver_sUpdatingLedStateToUnstableDriver
{
entry (payload: null) {
OSRDriver_sUpdatingLedStateToUnstableDriver_entry297(payload);
}exit {
OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_601232397(null);
}defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTransferSuccess goto OSRDriver_sWaitingForTimerDriver with (payload: null) {
OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_1336218175(payload);
}}

 state OSRDriver_sWaitingForTimerDriver
{
entry (payload: null) {
OSRDriver_sWaitingForTimerDriver_entry306(payload);
}exit {
OSRDriver_sWaitingForTimerDriver_exit0_rand_1566620706(null);
}ignore eD0Entry;on eTimerFired goto OSRDriver_sUpdatingLedStateToStableDriver with (payload: null) {
OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1569736390(payload);
}
on eSwitchStatusChange goto OSRDriver_sStoppingTimerOnStatusChangeDriver with (payload: null) {
OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_882394255(payload);
}
on eD0Exit goto OSRDriver_sStoppingTimerOnD0ExitDriver with (payload: null) {
OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_665611546(payload);
}}

 state OSRDriver_sUpdatingLedStateToStableDriver
{
entry (payload: null) {
OSRDriver_sUpdatingLedStateToStableDriver_entry320(payload);
}exit {
OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_509808522(null);
}ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eTransferSuccess goto OSRDriver_sWaitingForSwitchStatusChangeDriver with (payload: null) {
OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1130614081(payload);
}}

 state OSRDriver_sStoppingTimerOnStatusChangeDriver
{
entry (payload: null) {
OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331(payload);
}exit {
OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_2084015731(null);
}ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eUnit push OSRDriver_sStoppingTimerDriver;
on eTimerStopped goto OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver with (payload: null) {
OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1114439640(payload);
}}

 state OSRDriver_sStoppingTimerOnD0ExitDriver
{
entry (payload: null) {
OSRDriver_sStoppingTimerOnD0ExitDriver_entry342(payload);
}exit {
OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_1230947296(null);
}defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTimerStopped goto OSRDriver_sCompletingD0ExitDriver with (payload: null) {
OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_1441871190(payload);
}
on eUnit push OSRDriver_sStoppingTimerDriver;}

 state OSRDriver_sStoppingTimerDriver
{
entry (payload: null) {
OSRDriver_sStoppingTimerDriver_entry353(payload);
}exit {
OSRDriver_sStoppingTimerDriver_exit0_rand_1966509259(null);
}ignore eD0Entry;on eStoppingSuccess goto OSRDriver_sReturningTimerStoppedDriver with (payload: null) {
OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1730631427(payload);
}
on eStoppingFailure goto OSRDriver_sWaitingForTimerToFlushDriver with (payload: null) {
OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_1029061016(payload);
}
on eTimerFired goto OSRDriver_sReturningTimerStoppedDriver with (payload: null) {
OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_993101833(payload);
}}

 state OSRDriver_sWaitingForTimerToFlushDriver
{
entry (payload: null) {
OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_1497948820(payload);
}exit {
OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1431647620(null);
}defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTimerFired goto OSRDriver_sReturningTimerStoppedDriver with (payload: null) {
OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1962718632(payload);
}}

 state OSRDriver_sReturningTimerStoppedDriver
{
entry (payload: null) {
OSRDriver_sReturningTimerStoppedDriver_entry375(payload);
}exit {
OSRDriver_sReturningTimerStoppedDriver_exit0_rand_1042629379(null);
}ignore eD0Entry;}
}

