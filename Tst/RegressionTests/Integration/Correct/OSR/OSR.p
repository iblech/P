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

fun User_User_Init_on_eUnit_goto_User_S00_rand_944351182()
{


;

}
fun User_S0_on_eUnit_goto_User_S10_rand_164301836()
{


;

}
fun User_S1_on_eUnit_goto_User_S00_rand_1918282343()
{


;

}
fun User_User_Init_entry29()
{
var Tmp571: machine;


Tmp571 = new OSRDriver(null);
User_Driver = Tmp571;
raise eUnit;
}
fun User_User_Init_exit0_rand_727419419()
{


;

}
fun User_S0_entry37()
{


send User_Driver, eD0Entry;
raise eUnit;
}
fun User_S0_exit0_rand_1263161626()
{


;

}
fun User_S1_entry45()
{


send User_Driver, eD0Exit;
raise eUnit;
}
fun User_S1_exit0_rand_1207777964()
{


;

}start 
 state User_User_Init
{
entry  {
User_User_Init_entry29();
}
exit  {
User_User_Init_exit0_rand_727419419();
}
on eUnit goto User_S0 with   {
User_User_Init_on_eUnit_goto_User_S00_rand_944351182();
}
}

 state User_S0
{
entry  {
User_S0_entry37();
}
exit  {
User_S0_exit0_rand_1263161626();
}
on eUnit goto User_S1 with   {
User_S0_on_eUnit_goto_User_S10_rand_164301836();
}
}

 state User_S1
{
entry  {
User_S1_entry45();
}
exit  {
User_S1_exit0_rand_1207777964();
}
on eUnit goto User_S0 with   {
User_S1_on_eUnit_goto_User_S00_rand_1918282343();
}
}
}

model Switch
{
var Switch_Driver: machine;

fun Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_528618201()
{


;

}
fun Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1786831110()
{


;

}
fun Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_105983957()
{


;

}
fun Switch__Init_entry56(Switch__Init_entry56_payload: machine)
{


Switch_Driver = Switch__Init_entry56_payload;
raise eUnit;
}
fun Switch__Init_exit0_rand_929371848()
{


;

}
fun Switch_Switch_Init_entry61()
{


raise eUnit;
}
fun Switch_Switch_Init_exit0_rand_107411332()
{


;

}
fun Switch_ChangeSwitchStatus_entry69()
{


send Switch_Driver, eSwitchStatusChange;
raise eUnit;
}
fun Switch_ChangeSwitchStatus_exit0_rand_717446738()
{


;

}start 
 state Switch__Init
{
entry (payload: machine) {
Switch__Init_entry56(payload);
}
exit  {
Switch__Init_exit0_rand_929371848();
}
on eUnit goto Switch_Switch_Init with   {
Switch__Init_on_eUnit_goto_Switch_Switch_Init0_rand_528618201();
}
}

 state Switch_Switch_Init
{
entry  {
Switch_Switch_Init_entry61();
}
exit  {
Switch_Switch_Init_exit0_rand_107411332();
}
on eUnit goto Switch_ChangeSwitchStatus with   {
Switch_Switch_Init_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_1786831110();
}
}

 state Switch_ChangeSwitchStatus
{
entry  {
Switch_ChangeSwitchStatus_entry69();
}
exit  {
Switch_ChangeSwitchStatus_exit0_rand_717446738();
}
on eUnit goto Switch_ChangeSwitchStatus with   {
Switch_ChangeSwitchStatus_on_eUnit_goto_Switch_ChangeSwitchStatus0_rand_105983957();
}
}
}

model LED
{
var LED_Driver: machine;

fun LED__Init_on_eUnit_goto_LED_LED_Init0_rand_1074604405()
{


;

}
fun LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_271958021()
{


;

}
fun LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_2029931921()
{


;

}
fun LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_420186652()
{


;

}
fun LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_1705053035()
{


;

}
fun LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_501601808()
{


;

}
fun LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_1007726832()
{


;

}
fun LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_362025035()
{


;

}
fun LED__Init_entry80(LED__Init_entry80_payload: machine)
{


LED_Driver = LED__Init_entry80_payload;
raise eUnit;
}
fun LED__Init_exit0_rand_1374519999()
{


;

}
fun LED_LED_Init_entry0_rand_1276031504()
{


;

}
fun LED_LED_Init_exit0_rand_1875836243()
{


;

}
fun LED_ProcessUpdateLED_entry94()
{
var Tmp572: bool;


Tmp572 = $;
if(Tmp572)
{

send LED_Driver, eTransferSuccess;

}
else
{

send LED_Driver, eTransferFailure;

}

raise eUnit;
}
fun LED_ProcessUpdateLED_exit0_rand_1174516601()
{


;

}
fun LED_UnstableLED_entry108()
{


send LED_Driver, eTransferSuccess;
}
fun LED_UnstableLED_exit0_rand_1155145301()
{


;

}
fun LED_StableLED_entry118()
{


send LED_Driver, eTransferSuccess;
raise eUnit;
}
fun LED_StableLED_exit0_rand_511035392()
{


;

}start 
 state LED__Init
{
entry (payload: machine) {
LED__Init_entry80(payload);
}
exit  {
LED__Init_exit0_rand_1374519999();
}
on eUnit goto LED_LED_Init with   {
LED__Init_on_eUnit_goto_LED_LED_Init0_rand_1074604405();
}
}

 state LED_LED_Init
{
entry  {
LED_LED_Init_entry0_rand_1276031504();
}
exit  {
LED_LED_Init_exit0_rand_1875836243();
}
on eUpdateBarGraphStateUsingControlTransfer goto LED_ProcessUpdateLED with   {
LED_LED_Init_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_271958021();
}

on eSetLedStateToUnstableUsingControlTransfer goto LED_UnstableLED with   {
LED_LED_Init_on_eSetLedStateToUnstableUsingControlTransfer_goto_LED_UnstableLED0_rand_2029931921();
}

on eSetLedStateToStableUsingControlTransfer goto LED_StableLED with   {
LED_LED_Init_on_eSetLedStateToStableUsingControlTransfer_goto_LED_StableLED0_rand_420186652();
}
}

 state LED_ProcessUpdateLED
{
entry  {
LED_ProcessUpdateLED_entry94();
}
exit  {
LED_ProcessUpdateLED_exit0_rand_1174516601();
}
on eUnit goto LED_LED_Init with   {
LED_ProcessUpdateLED_on_eUnit_goto_LED_LED_Init0_rand_1705053035();
}
}

 state LED_UnstableLED
{
entry  {
LED_UnstableLED_entry108();
}
exit  {
LED_UnstableLED_exit0_rand_1155145301();
}
on eSetLedStateToStableUsingControlTransfer goto LED_LED_Init with   {
LED_UnstableLED_on_eSetLedStateToStableUsingControlTransfer_goto_LED_LED_Init0_rand_501601808();
}

on eUpdateBarGraphStateUsingControlTransfer goto LED_ProcessUpdateLED with   {
LED_UnstableLED_on_eUpdateBarGraphStateUsingControlTransfer_goto_LED_ProcessUpdateLED0_rand_1007726832();
}
}

 state LED_StableLED
{
entry  {
LED_StableLED_entry118();
}
exit  {
LED_StableLED_exit0_rand_511035392();
}
on eUnit goto LED_LED_Init with   {
LED_StableLED_on_eUnit_goto_LED_LED_Init0_rand_362025035();
}
}
}

model Timer
{
var Timer_Driver: machine;

fun Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_1887773049()
{


;

}
fun Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_907612618()
{


;

}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1666213859()
{


;

}
fun Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_1621636358()
{


;

}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_598198331()
{


;

}
fun Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_1888260149()
{


;

}
fun Timer__Init_entry130(Timer__Init_entry130_payload: machine)
{


Timer_Driver = Timer__Init_entry130_payload;
raise eUnit;
}
fun Timer__Init_exit0_rand_595692440()
{


;

}
fun Timer_Timer_Init_entry0_rand_1866298264()
{


;

}
fun Timer_Timer_Init_exit0_rand_1438292182()
{


;

}
fun Timer_TimerStarted_entry144()
{
var Tmp573: bool;


Tmp573 = $;
if(Tmp573)
{

raise eUnit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_1223478972()
{


;

}
fun Timer_SendTimerFired_entry155()
{


send Timer_Driver, eTimerFired;
raise eUnit;
}
fun Timer_SendTimerFired_exit0_rand_1962478269()
{


;

}
fun Timer_ConsmachineeringStoppingTimer_entry165()
{
var Tmp574: bool;


Tmp574 = $;
if(Tmp574)
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
fun Timer_ConsmachineeringStoppingTimer_exit0_rand_21621495()
{


;

}start 
 state Timer__Init
{
entry (payload: machine) {
Timer__Init_entry130(payload);
}
exit  {
Timer__Init_exit0_rand_595692440();
}
on eUnit goto Timer_Timer_Init with   {
Timer__Init_on_eUnit_goto_Timer_Timer_Init0_rand_1887773049();
}
}

 state Timer_Timer_Init
{
entry  {
Timer_Timer_Init_entry0_rand_1866298264();
}
exit  {
Timer_Timer_Init_exit0_rand_1438292182();
}
ignore eStopTimer;on eStartDebounceTimer goto Timer_TimerStarted with   {
Timer_Timer_Init_on_eStartDebounceTimer_goto_Timer_TimerStarted0_rand_907612618();
}
}

 state Timer_TimerStarted
{
entry  {
Timer_TimerStarted_entry144();
}
exit  {
Timer_TimerStarted_exit0_rand_1223478972();
}
defer eStartDebounceTimer;on eUnit goto Timer_SendTimerFired with   {
Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1666213859();
}

on eStopTimer goto Timer_ConsmachineeringStoppingTimer with   {
Timer_TimerStarted_on_eStopTimer_goto_Timer_ConsmachineeringStoppingTimer0_rand_1621636358();
}
}

 state Timer_SendTimerFired
{
entry  {
Timer_SendTimerFired_entry155();
}
exit  {
Timer_SendTimerFired_exit0_rand_1962478269();
}
defer eStartDebounceTimer;on eUnit goto Timer_Timer_Init with   {
Timer_SendTimerFired_on_eUnit_goto_Timer_Timer_Init0_rand_598198331();
}
}

 state Timer_ConsmachineeringStoppingTimer
{
entry  {
Timer_ConsmachineeringStoppingTimer_entry165();
}
exit  {
Timer_ConsmachineeringStoppingTimer_exit0_rand_21621495();
}
defer eStartDebounceTimer;on eUnit goto Timer_Timer_Init with   {
Timer_ConsmachineeringStoppingTimer_on_eUnit_goto_Timer_Timer_Init0_rand_1888260149();
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
var Tmp575: bool;


Tmp575 = $;
if(Tmp575)
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
fun OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_422399139()
{


;

}
fun OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_1653542647()
{


;

}
fun OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1088306511()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_2103287721()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_506996706()
{


;

}
fun OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1604891106()
{


;

}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_198597036()
{


;

}
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1235691257()
{


;

}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1982973115()
{


;

}
fun OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_764101639()
{


;

}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_1995217709()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1403057771()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_463806835()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_1220360594()
{


;

}
fun OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_2069498875()
{


;

}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_467632402()
{


;

}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_177902178()
{


;

}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_454657103()
{


;

}
fun OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_874162862()
{


;

}
fun OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_153838397()
{


;

}
fun OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_614125583()
{


;

}
fun OSRDriver_Driver_Init_entry192()
{
var Tmp576: machine;
var Tmp577: machine;
var Tmp578: machine;


Tmp576 = new Timer(this);
OSRDriver_TimerV = Tmp576;
Tmp577 = new LED(this);
OSRDriver_LEDV = Tmp577;
Tmp578 = new Switch(this);
OSRDriver_SwitchV = Tmp578;
raise eUnit;
}
fun OSRDriver_Driver_Init_exit0_rand_181940004()
{


;

}
fun OSRDriver_sDxDriver_entry0_rand_2054870568()
{


;

}
fun OSRDriver_sDxDriver_exit0_rand_1986396795()
{


;

}
fun OSRDriver_sCompleteD0EntryDriver_entry213()
{


OSRDriver_CompleteDStateTransition();
raise eOperationSuccess;
}
fun OSRDriver_sCompleteD0EntryDriver_exit0_rand_436468553()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1265830282()
{


;

}
fun OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_572452590()
{


;

}
fun OSRDriver_sCompletingD0ExitDriver_entry233()
{


OSRDriver_CompleteDStateTransition();
raise eOperationSuccess;
}
fun OSRDriver_sCompletingD0ExitDriver_exit0_rand_301995264()
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
fun OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_37794973()
{


;

}
fun OSRDriver_sUpdatingBarGraphStateDriver_entry284()
{


OSRDriver_UpdateBarGraphStateUsingControlTransfer();
}
fun OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1934849885()
{


;

}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_entry297()
{


OSRDriver_SetLedStateToUnstableUsingControlTransfer();
}
fun OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_440009807()
{


;

}
fun OSRDriver_sWaitingForTimerDriver_entry306()
{


OSRDriver_StartDebounceTimer();
}
fun OSRDriver_sWaitingForTimerDriver_exit0_rand_1420140647()
{


;

}
fun OSRDriver_sUpdatingLedStateToStableDriver_entry320()
{


OSRDriver_SetLedStateToStableUsingControlTransfer();
}
fun OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_729710440()
{


;

}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331()
{


raise eUnit;
}
fun OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_1211556756()
{


;

}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_entry342()
{


raise eUnit;
}
fun OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_747473496()
{


;

}
fun OSRDriver_sStoppingTimerDriver_entry353()
{


send OSRDriver_TimerV, eStopTimer;
}
fun OSRDriver_sStoppingTimerDriver_exit0_rand_444359934()
{


;

}
fun OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_1274134566()
{


;

}
fun OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1842463367()
{


;

}
fun OSRDriver_sReturningTimerStoppedDriver_entry375()
{


raise eTimerStopped;
}
fun OSRDriver_sReturningTimerStoppedDriver_exit0_rand_390381021()
{


;

}start 
 state OSRDriver_Driver_Init
{
entry  {
OSRDriver_Driver_Init_entry192();
}
exit  {
OSRDriver_Driver_Init_exit0_rand_181940004();
}
defer eSwitchStatusChange;on eUnit goto OSRDriver_sDxDriver with   {
OSRDriver_Driver_Init_on_eUnit_goto_OSRDriver_sDxDriver0_rand_422399139();
}
}

 state OSRDriver_sDxDriver
{
entry  {
OSRDriver_sDxDriver_entry0_rand_2054870568();
}
exit  {
OSRDriver_sDxDriver_exit0_rand_1986396795();
}
defer eSwitchStatusChange;
ignore eD0Exit;on eD0Entry goto OSRDriver_sCompleteD0EntryDriver with   {
OSRDriver_sDxDriver_on_eD0Entry_goto_OSRDriver_sCompleteD0EntryDriver0_rand_1653542647();
}
}

 state OSRDriver_sCompleteD0EntryDriver
{
entry  {
OSRDriver_sCompleteD0EntryDriver_entry213();
}
exit  {
OSRDriver_sCompleteD0EntryDriver_exit0_rand_436468553();
}
defer eSwitchStatusChange;on eOperationSuccess goto OSRDriver_sWaitingForSwitchStatusChangeDriver with   {
OSRDriver_sCompleteD0EntryDriver_on_eOperationSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_1088306511();
}
}

 state OSRDriver_sWaitingForSwitchStatusChangeDriver
{
entry  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_entry0_rand_1265830282();
}
exit  {
OSRDriver_sWaitingForSwitchStatusChangeDriver_exit0_rand_572452590();
}
ignore eD0Entry;on eD0Exit goto OSRDriver_sCompletingD0ExitDriver with   {
OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eD0Exit_goto_OSRDriver_sCompletingD0ExitDriver0_rand_2103287721();
}

on eSwitchStatusChange goto OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver with   {
OSRDriver_sWaitingForSwitchStatusChangeDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_506996706();
}
}

 state OSRDriver_sCompletingD0ExitDriver
{
entry  {
OSRDriver_sCompletingD0ExitDriver_entry233();
}
exit  {
OSRDriver_sCompletingD0ExitDriver_exit0_rand_301995264();
}
on eOperationSuccess goto OSRDriver_sDxDriver with   {
OSRDriver_sCompletingD0ExitDriver_on_eOperationSuccess_goto_OSRDriver_sDxDriver0_rand_1604891106();
}
}

 state OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver
{
entry  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_entry268();
}
exit  {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_exit0_rand_37794973();
}
ignore eD0Entry;on eYes goto OSRDriver_sUpdatingBarGraphStateDriver with   {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eYes_goto_OSRDriver_sUpdatingBarGraphStateDriver0_rand_198597036();
}

on eNo goto OSRDriver_sWaitingForTimerDriver with   {
OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver_on_eNo_goto_OSRDriver_sWaitingForTimerDriver0_rand_1235691257();
}
}

 state OSRDriver_sUpdatingBarGraphStateDriver
{
entry  {
OSRDriver_sUpdatingBarGraphStateDriver_entry284();
}
exit  {
OSRDriver_sUpdatingBarGraphStateDriver_exit0_rand_1934849885();
}
ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eTransferSuccess goto OSRDriver_sUpdatingLedStateToUnstableDriver with   {
OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferSuccess_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_1982973115();
}

on eTransferFailure goto OSRDriver_sUpdatingLedStateToUnstableDriver with   {
OSRDriver_sUpdatingBarGraphStateDriver_on_eTransferFailure_goto_OSRDriver_sUpdatingLedStateToUnstableDriver0_rand_764101639();
}
}

 state OSRDriver_sUpdatingLedStateToUnstableDriver
{
entry  {
OSRDriver_sUpdatingLedStateToUnstableDriver_entry297();
}
exit  {
OSRDriver_sUpdatingLedStateToUnstableDriver_exit0_rand_440009807();
}
defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTransferSuccess goto OSRDriver_sWaitingForTimerDriver with   {
OSRDriver_sUpdatingLedStateToUnstableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForTimerDriver0_rand_1995217709();
}
}

 state OSRDriver_sWaitingForTimerDriver
{
entry  {
OSRDriver_sWaitingForTimerDriver_entry306();
}
exit  {
OSRDriver_sWaitingForTimerDriver_exit0_rand_1420140647();
}
ignore eD0Entry;on eTimerFired goto OSRDriver_sUpdatingLedStateToStableDriver with   {
OSRDriver_sWaitingForTimerDriver_on_eTimerFired_goto_OSRDriver_sUpdatingLedStateToStableDriver0_rand_1403057771();
}

on eSwitchStatusChange goto OSRDriver_sStoppingTimerOnStatusChangeDriver with   {
OSRDriver_sWaitingForTimerDriver_on_eSwitchStatusChange_goto_OSRDriver_sStoppingTimerOnStatusChangeDriver0_rand_463806835();
}

on eD0Exit goto OSRDriver_sStoppingTimerOnD0ExitDriver with   {
OSRDriver_sWaitingForTimerDriver_on_eD0Exit_goto_OSRDriver_sStoppingTimerOnD0ExitDriver0_rand_1220360594();
}
}

 state OSRDriver_sUpdatingLedStateToStableDriver
{
entry  {
OSRDriver_sUpdatingLedStateToStableDriver_entry320();
}
exit  {
OSRDriver_sUpdatingLedStateToStableDriver_exit0_rand_729710440();
}
ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eTransferSuccess goto OSRDriver_sWaitingForSwitchStatusChangeDriver with   {
OSRDriver_sUpdatingLedStateToStableDriver_on_eTransferSuccess_goto_OSRDriver_sWaitingForSwitchStatusChangeDriver0_rand_2069498875();
}
}

 state OSRDriver_sStoppingTimerOnStatusChangeDriver
{
entry  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_entry331();
}
exit  {
OSRDriver_sStoppingTimerOnStatusChangeDriver_exit0_rand_1211556756();
}
ignore eD0Entry;
defer eD0Exit;
defer eSwitchStatusChange;on eUnit push OSRDriver_sStoppingTimerDriver;
on eTimerStopped goto OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver with   {
OSRDriver_sStoppingTimerOnStatusChangeDriver_on_eTimerStopped_goto_OSRDriver_sStoringSwitchAndCheckingIfStateChangedDriver0_rand_467632402();
}
}

 state OSRDriver_sStoppingTimerOnD0ExitDriver
{
entry  {
OSRDriver_sStoppingTimerOnD0ExitDriver_entry342();
}
exit  {
OSRDriver_sStoppingTimerOnD0ExitDriver_exit0_rand_747473496();
}
defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTimerStopped goto OSRDriver_sCompletingD0ExitDriver with   {
OSRDriver_sStoppingTimerOnD0ExitDriver_on_eTimerStopped_goto_OSRDriver_sCompletingD0ExitDriver0_rand_177902178();
}

on eUnit push OSRDriver_sStoppingTimerDriver;}

 state OSRDriver_sStoppingTimerDriver
{
entry  {
OSRDriver_sStoppingTimerDriver_entry353();
}
exit  {
OSRDriver_sStoppingTimerDriver_exit0_rand_444359934();
}
ignore eD0Entry;on eStoppingSuccess goto OSRDriver_sReturningTimerStoppedDriver with   {
OSRDriver_sStoppingTimerDriver_on_eStoppingSuccess_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_454657103();
}

on eStoppingFailure goto OSRDriver_sWaitingForTimerToFlushDriver with   {
OSRDriver_sStoppingTimerDriver_on_eStoppingFailure_goto_OSRDriver_sWaitingForTimerToFlushDriver0_rand_874162862();
}

on eTimerFired goto OSRDriver_sReturningTimerStoppedDriver with   {
OSRDriver_sStoppingTimerDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_153838397();
}
}

 state OSRDriver_sWaitingForTimerToFlushDriver
{
entry  {
OSRDriver_sWaitingForTimerToFlushDriver_entry0_rand_1274134566();
}
exit  {
OSRDriver_sWaitingForTimerToFlushDriver_exit0_rand_1842463367();
}
defer eD0Exit;
defer eSwitchStatusChange;
ignore eD0Entry;on eTimerFired goto OSRDriver_sReturningTimerStoppedDriver with   {
OSRDriver_sWaitingForTimerToFlushDriver_on_eTimerFired_goto_OSRDriver_sReturningTimerStoppedDriver0_rand_614125583();
}
}

 state OSRDriver_sReturningTimerStoppedDriver
{
entry  {
OSRDriver_sReturningTimerStoppedDriver_entry375();
}
exit  {
OSRDriver_sReturningTimerStoppedDriver_exit0_rand_390381021();
}
ignore eD0Entry;}
}

