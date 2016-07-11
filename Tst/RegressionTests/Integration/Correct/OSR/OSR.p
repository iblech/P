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
var _tmp1153: machine;


_tmp1153 = new OSRDriver(null);
;
User_Driver = _tmp1153;
;
raise eUnit;


}
fun User_User_Init_exit0_rand_1441827122()
{


;


}
fun User_S0_entry37(User_S0_entry37__payload_1: any)
{


send User_Driver, eD0Entry;
;
raise eUnit;


}
fun User_S0_exit0_rand_236575604()
{


;


}
fun User_S1_entry45(User_S1_entry45__payload_2: any)
{


send User_Driver, eD0Exit;
;
raise eUnit;


}
fun User_S1_exit0_rand_1554586208()
{


;


}
fun User_User_Init_on_eUnit_goto_User_S00_rand_1889384088(User_User_Init_on_eUnit_goto_User_S00_rand_1889384088__payload_skip: any)
{


;


}
fun User_S0_on_eUnit_goto_User_S10_rand_151025354(User_S0_on_eUnit_goto_User_S10_rand_151025354__payload_skip: any)
{


;


}
fun User_S1_on_eUnit_goto_User_S00_rand_876560241(User_S1_on_eUnit_goto_User_S00_rand_876560241__payload_skip: any)
{


;


}start  state User_User_Init
{entry (payload: any) {
User_User_Init_entry29(payload);
}
exit  {
User_User_Init_exit0_rand_1441827122();
}
}
 state User_S0
{entry (payload: any) {
User_S0_entry37(payload);
}
exit  {
User_S0_exit0_rand_236575604();
}
}
 state User_S1
{entry (payload: any) {
User_S1_entry45(payload);
}
exit  {
User_S1_exit0_rand_1554586208();
}
}
}

model Switch
{
var Switch_Driver: machine;

fun Switch__Init_entry56(Switch__Init_entry56_payload: machine)
{


Switch_Driver = Switch__Init_entry56_payload;
;
raise eUnit;


}
fun Switch__Init_exit0_rand_584716970()
{


;


}
fun Switch_Switch_Init_entry61(Switch_Switch_Init_entry61__payload_3: any)
{


raise eUnit;


}
fun Switch_Switch_Init_exit0_rand_562814045()
{


;


}
fun Switch_ChangeSwitchStatus_entry69(Switch_ChangeSwitchStatus_entry69__payload_4: any)
{


send Switch_Driver, eSwitchStatusChange;
;
raise eUnit;


}
fun Switch_ChangeSwitchStatus_exit0_rand_108523540()
{


;


}
fun Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_67017764(Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_67017764__payload_skip: any)
{


;


}
fun Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_46666715(Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_46666715__payload_skip: any)
{


;


}
fun Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1134848852(Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1134848852__payload_skip: any)
{


;


}start  state Switch__Init
{entry (payload: machine) {
Switch__Init_entry56(payload);
}
exit  {
Switch__Init_exit0_rand_584716970();
}
}
 state Switch_Switch_Init
{entry (payload: any) {
Switch_Switch_Init_entry61(payload);
}
exit  {
Switch_Switch_Init_exit0_rand_562814045();
}
}
 state Switch_ChangeSwitchStatus
{entry (payload: any) {
Switch_ChangeSwitchStatus_entry69(payload);
}
exit  {
Switch_ChangeSwitchStatus_exit0_rand_108523540();
}
}
}

model LED
{
var LED_Driver: machine;

fun LED__Init_entry80(LED__Init_entry80_payload: machine)
{


LED_Driver = LED__Init_entry80_payload;
;
raise eUnit;


}
fun LED__Init_exit0_rand_1063599342()
{


;


}
fun LED_LED_Init_entry0_rand_39544278(LED_LED_Init_entry0_rand_39544278__payload_5: any)
{


;


}
fun LED_LED_Init_exit0_rand_375658449()
{


;


}
fun LED_ProcessUpdateLED_entry94(LED_ProcessUpdateLED_entry94__payload_6: any)
{
var _tmp1154: bool;


_tmp1154 = $;
;
if(_tmp1154)
{

send LED_Driver, eTransferSuccess;
;
send LED_Driver, eTransferSuccess;



}
else
{

send LED_Driver, eTransferFailure;
;
send LED_Driver, eTransferFailure;



}
;
raise eUnit;


}
fun LED_ProcessUpdateLED_exit0_rand_2020678096()
{


;


}
fun LED_UnstableLED_entry108(LED_UnstableLED_entry108__payload_7: any)
{


send LED_Driver, eTransferSuccess;


}
fun LED_UnstableLED_exit0_rand_2141364925()
{


;


}
fun LED_StableLED_entry118(LED_StableLED_entry118__payload_8: any)
{


send LED_Driver, eTransferSuccess;
;
raise eUnit;


}
fun LED_StableLED_exit0_rand_101935507()
{


;


}
fun LED__Init_on_eUnit_goto_LED_LED_Init0_rand_1566142185(LED__Init_on_eUnit_goto_LED_LED_Init0_rand_1566142185__payload_skip: any)
{


;


}
fun LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_1011524116(LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_1011524116__payload_skip: any)
{


;


}
fun LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_735990386(LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_735990386__payload_skip: any)
{


;


}
fun LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_1775889905(LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_1775889905__payload_skip: any)
{


;


}
fun LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_1122134253(LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_1122134253__payload_skip: any)
{


;


}
fun LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_625953107(LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_625953107__payload_skip: any)
{


;


}
fun LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_1627370247(LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_1627370247__payload_skip: any)
{


;


}
fun LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1590666531(LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_1590666531__payload_skip: any)
{


;


}start  state LED__Init
{entry (payload: machine) {
LED__Init_entry80(payload);
}
exit  {
LED__Init_exit0_rand_1063599342();
}
}
 state LED_LED_Init
{entry (payload: any) {
LED_LED_Init_entry0_rand_39544278(payload);
}
exit  {
LED_LED_Init_exit0_rand_375658449();
}
}
 state LED_ProcessUpdateLED
{entry (payload: any) {
LED_ProcessUpdateLED_entry94(payload);
}
exit  {
LED_ProcessUpdateLED_exit0_rand_2020678096();
}
}
 state LED_UnstableLED
{entry (payload: any) {
LED_UnstableLED_entry108(payload);
}
exit  {
LED_UnstableLED_exit0_rand_2141364925();
}
}
 state LED_StableLED
{entry (payload: any) {
LED_StableLED_entry118(payload);
}
exit  {
LED_StableLED_exit0_rand_101935507();
}
}
}

model Timer
{
var Timer_Driver: machine;

fun Timer__Init_entry130(Timer__Init_entry130_payload: machine)
{


Timer_Driver = Timer__Init_entry130_payload;
;
raise eUnit;


}
fun Timer__Init_exit0_rand_2096497877()
{


;


}
fun Timer_Timer_Init_entry0_rand_742255504(Timer_Timer_Init_entry0_rand_742255504__payload_9: any)
{


;


}
fun Timer_Timer_Init_exit0_rand_1866042666()
{


;


}
fun Timer_TimerStarted_entry144(Timer_TimerStarted_entry144__payload_10: any)
{
var _tmp1155: bool;


_tmp1155 = $;
;
if(_tmp1155)
{

raise eUnit;
;
raise eUnit;



}
else
{

;
;
;



}


}
fun Timer_TimerStarted_exit0_rand_501903321()
{


;


}
fun Timer_SendTimerFired_entry155(Timer_SendTimerFired_entry155__payload_11: any)
{


send Timer_Driver, eTimerFired;
;
raise eUnit;


}
fun Timer_SendTimerFired_exit0_rand_901021175()
{


;


}
fun Timer_ConsmachineeringStoppingTimer_entry165(Timer_ConsmachineeringStoppingTimer_entry165__payload_12: any)
{
var _tmp1156: bool;


_tmp1156 = $;
;
if(_tmp1156)
{

send Timer_Driver, eStoppingFailure;
;
send Timer_Driver, eTimerFired;
;
send Timer_Driver, eStoppingFailure;
;
send Timer_Driver, eTimerFired;



}
else
{

send Timer_Driver, eStoppingSuccess;
;
send Timer_Driver, eStoppingSuccess;



}
;
raise eUnit;


}
fun Timer_ConsmachineeringStoppingTimer_exit0_rand_1374063244()
{


;


}
fun Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_2009718798(Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_2009718798__payload_skip: any)
{


;


}
fun Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_907416419(Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_907416419__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_336405498(Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_336405498__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_52234620(Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_52234620__payload_skip: any)
{


;


}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_1252634318(Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_1252634318__payload_skip: any)
{


;


}
fun Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_2069535458(Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_2069535458__payload_skip: any)
{


;


}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry130(payload);
}
exit  {
Timer__Init_exit0_rand_2096497877();
}
}
 state Timer_Timer_Init
{entry (payload: any) {
Timer_Timer_Init_entry0_rand_742255504(payload);
}
exit  {
Timer_Timer_Init_exit0_rand_1866042666();
}
}
 state Timer_TimerStarted
{entry (payload: any) {
Timer_TimerStarted_entry144(payload);
}
exit  {
Timer_TimerStarted_exit0_rand_501903321();
}
}
 state Timer_SendTimerFired
{entry (payload: any) {
Timer_SendTimerFired_entry155(payload);
}
exit  {
Timer_SendTimerFired_exit0_rand_901021175();
}
}
 state Timer_ConsmachineeringStoppingTimer
{entry (payload: any) {
Timer_ConsmachineeringStoppingTimer_entry165(payload);
}
exit  {
Timer_ConsmachineeringStoppingTimer_exit0_rand_1374063244();
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
var _tmp1157: bool;


_tmp1157 = $;
;
if(_tmp1157)
{

return (true);
;
return (true);



}
else
{

return (false);
;
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
var _tmp1158: machine;
var _tmp1159: machine;
var _tmp1160: machine;


_tmp1158 = new Timer(this);
;
OSRDriver_TimerV = _tmp1158;
;
_tmp1159 = new LED(this);
;
OSRDriver_LEDV = _tmp1159;
;
_tmp1160 = new Switch(this);
;
OSRDriver_SwitchV = _tmp1160;
;
raise eUnit;


}
fun OSRDriver_Driver_Init_exit0_rand_179347235()
{


;


}
fun OSRDriver_sDxDriver_entry0_rand_2083881990(OSRDriver_sDxDriver_entry0_rand_2083881990__payload_14: any)
{


;


}
fun OSRDriver_sDxDriver_exit0_rand_404515807()
{


;


}
fun OSRDriver_sCompleteD0EntryDriver_entry213(OSRDriver_sCompleteD0EntryDriver_entry213__payload_15: any)
{


OSRDriver_CompleteDStateTransition();
;
raise eOperationSuccess;


}
fun OSRDriver_sCompleteD0EntryDriver_exit0_rand_1519775311()
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1327472101(OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1327472101__payload_16: any)
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1426721227()
{


;


}
fun OSRDriver_sCompletingD0ExitDriver_entry233(OSRDriver_sCompletingD0ExitDriver_entry233__payload_17: any)
{


OSRDriver_CompleteDStateTransition();
;
raise eOperationSuccess;


}
fun OSRDriver_sCompletingD0ExitDriver_exit0_rand_1909882651()
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268__payload_18: any)
{


OSRDriver_StoreSwitchAndEnableSwitchStatusChange();
;
OSRDriver_check = OSRDriver_CheckIfSwitchStatusChanged();
;
if(OSRDriver_check)
{

raise eYes;
;
raise eYes;



}
else
{

raise eNo;
;
raise eNo;



}


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_481954613()
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_entry284(OSRDriver_sUpdatingBarGraphStateDriver_entry284__payload_19: any)
{


OSRDriver_UpdateBarGraphStateUsingControlTransfer();


}
fun OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_731782818()
{


;


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_entry297(OSRDriver_sUpdatingLedStateToUnstableDriver_entry297__payload_20: any)
{


OSRDriver_SetLedStateToUnstableUsingControlTransfer();


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_802535526()
{


;


}
fun OSRDriver_sWaitingForTimerDriver_entry306(OSRDriver_sWaitingForTimerDriver_entry306__payload_21: any)
{


OSRDriver_StartDebounceTimer();


}
fun OSRDriver_sWaitingForTimerDriver_exit0_rand_209235882()
{


;


}
fun OSRDriver_sUpdatingLedStateToStableDriver_entry320(OSRDriver_sUpdatingLedStateToStableDriver_entry320__payload_22: any)
{


OSRDriver_SetLedStateToStableUsingControlTransfer();


}
fun OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_749628986()
{


;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331(OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331__payload_23: any)
{


raise eUnit;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_853219323()
{


;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_entry342(OSRDriver_sStoppingTimerOnD0ExitDriver_entry342__payload_24: any)
{


raise eUnit;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_772438533()
{


;


}
fun OSRDriver_sStoppingTimerDriver_entry353(OSRDriver_sStoppingTimerDriver_entry353__payload_25: any)
{


send OSRDriver_TimerV, eStopTimer;


}
fun OSRDriver_sStoppingTimerDriver_exit0_rand_852968213()
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_2122514938(OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_2122514938__payload_26: any)
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1794939416()
{


;


}
fun OSRDriver_sReturningTimerStoppedDriver_entry375(OSRDriver_sReturningTimerStoppedDriver_entry375__payload_27: any)
{


raise eTimerStopped;


}
fun OSRDriver_sReturningTimerStoppedDriver_exit0_rand_2118932881()
{


;


}
fun OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_1056587150(OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_1056587150__payload_skip: any)
{


;


}
fun OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_127864981(OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_127864981__payload_skip: any)
{


;


}
fun OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_822317966(OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_822317966__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_80859432(OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_80859432__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1524224369(OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_1524224369__payload_skip: any)
{


;


}
fun OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_261063816(OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_261063816__payload_skip: any)
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_1977792043(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_1977792043__payload_skip: any)
{


;


}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1773513110(OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1773513110__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1167458773(OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1167458773__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1368926392(OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1368926392__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_1396450941(OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_1396450941__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_2121466586(OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_2121466586__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_1094799735(OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_1094799735__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_1894593432(OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_1894593432__payload_skip: any)
{


;


}
fun OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_760002880(OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_760002880__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_749995821(OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_749995821__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_497503003(OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_497503003__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_112329471(OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_112329471__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_2037215275(OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_2037215275__payload_skip: any)
{


;


}
fun OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1417150602(OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_1417150602__payload_skip: any)
{


;


}
fun OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_2101116773(OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_2101116773__payload_skip: any)
{


;


}start  state OSRDriver_Driver_Init
{entry (payload: any) {
OSRDriver_Driver_Init_entry192(payload);
}
exit  {
OSRDriver_Driver_Init_exit0_rand_179347235();
}
}
 state OSRDriver_sDxDriver
{entry (payload: any) {
OSRDriver_sDxDriver_entry0_rand_2083881990(payload);
}
exit  {
OSRDriver_sDxDriver_exit0_rand_404515807();
}
}
 state OSRDriver_sCompleteD0EntryDriver
{entry (payload: any) {
OSRDriver_sCompleteD0EntryDriver_entry213(payload);
}
exit  {
OSRDriver_sCompleteD0EntryDriver_exit0_rand_1519775311();
}
}
 state OSRDriver_sWaitingForSwitchStatusChangeDriver
{entry (payload: any) {
OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1327472101(payload);
}
exit  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_1426721227();
}
}
 state OSRDriver_sCompletingD0ExitDriver
{entry (payload: any) {
OSRDriver_sCompletingD0ExitDriver_entry233(payload);
}
exit  {
OSRDriver_sCompletingD0ExitDriver_exit0_rand_1909882651();
}
}
 state OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver
{entry (payload: any) {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268(payload);
}
exit  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_481954613();
}
}
 state OSRDriver_sUpdatingBarGraphStateDriver
{entry (payload: any) {
OSRDriver_sUpdatingBarGraphStateDriver_entry284(payload);
}
exit  {
OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_731782818();
}
}
 state OSRDriver_sUpdatingLedStateToUnstableDriver
{entry (payload: any) {
OSRDriver_sUpdatingLedStateToUnstableDriver_entry297(payload);
}
exit  {
OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_802535526();
}
}
 state OSRDriver_sWaitingForTimerDriver
{entry (payload: any) {
OSRDriver_sWaitingForTimerDriver_entry306(payload);
}
exit  {
OSRDriver_sWaitingForTimerDriver_exit0_rand_209235882();
}
}
 state OSRDriver_sUpdatingLedStateToStableDriver
{entry (payload: any) {
OSRDriver_sUpdatingLedStateToStableDriver_entry320(payload);
}
exit  {
OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_749628986();
}
}
 state OSRDriver_sStoppingTimerOnStatusChangeDriver
{entry (payload: any) {
OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331(payload);
}
exit  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_853219323();
}
}
 state OSRDriver_sStoppingTimerOnD0ExitDriver
{entry (payload: any) {
OSRDriver_sStoppingTimerOnD0ExitDriver_entry342(payload);
}
exit  {
OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_772438533();
}
}
 state OSRDriver_sStoppingTimerDriver
{entry (payload: any) {
OSRDriver_sStoppingTimerDriver_entry353(payload);
}
exit  {
OSRDriver_sStoppingTimerDriver_exit0_rand_852968213();
}
}
 state OSRDriver_sWaitingForTimerToFlushDriver
{entry (payload: any) {
OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_2122514938(payload);
}
exit  {
OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1794939416();
}
}
 state OSRDriver_sReturningTimerStoppedDriver
{entry (payload: any) {
OSRDriver_sReturningTimerStoppedDriver_entry375(payload);
}
exit  {
OSRDriver_sReturningTimerStoppedDriver_exit0_rand_2118932881();
}
}
}

