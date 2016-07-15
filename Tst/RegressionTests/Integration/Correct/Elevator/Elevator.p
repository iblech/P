event eOpenDoor  assume 1;
event eCloseDoor  assume 1;
event eResetDoor  assert 1;
event eDoorOpened  assert 1;
event eDoorClosed  assert 1;
event eDoorStopped  assert 1;
event eObjectDetected  assert 1;
event eTimerFired  assume 1;
event eOperationSuccess  assert 1;
event eOperationFailure  assert 1;
event eSendCommandToOpenDoor  assume 1;
event eSendCommandToCloseDoor  assume 1;
event eSendCommandToStopDoor  assume 1;
event eSendCommandToResetDoor  assume 1;
event eStartDoorCloseTimer  assume 1;
event eStopDoorCloseTimer  assume 1;
event eUnit  assert 1;
event eStopTimerReturned  assert 1;
event eObjectEncountered  assert 1;

machine Elevator
{
var Elevator_DoorV: machine;
var Elevator_TimerV: machine;

fun Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_318982382()
{


;

}
fun Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_1050256098()
{


;

}
fun Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_73580941()
{


;

}
fun Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_256925250()
{


;

}
fun Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1293386356()
{


;

}
fun Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_1038719149()
{


;

}
fun Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_1240532560()
{


;

}
fun Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_217044969()
{


;

}
fun Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1555357729()
{


;

}
fun Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_246402508()
{


;

}
fun Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1434313673()
{


;

}
fun Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1876051143()
{


;

}
fun Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1368303597()
{


;

}
fun Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1665044387()
{


;

}
fun Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_1808141834()
{


;

}
fun Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_376138447()
{


;

}
fun Elevator_Init_entry26()
{
var _tmp381: machine;
var _tmp382: machine;


_tmp381 = new Timer(this);
Elevator_TimerV = _tmp381;
_tmp382 = new Door(this);
Elevator_DoorV = _tmp382;
raise eUnit;
}
fun Elevator_Init_exit0_rand_1143908852()
{


;

}
fun Elevator_DoorClosed_entry38()
{


send Elevator_DoorV, eSendCommandToResetDoor;
}
fun Elevator_DoorClosed_exit0_rand_588228602()
{


;

}
fun Elevator_DoorOpening_entry49()
{


send Elevator_DoorV, eSendCommandToOpenDoor;
}
fun Elevator_DoorOpening_exit0_rand_1146056752()
{


;

}
fun Elevator_DoorOpened_entry59()
{


send Elevator_DoorV, eSendCommandToResetDoor;
send Elevator_TimerV, eStartDoorCloseTimer;
}
fun Elevator_DoorOpened_exit0_rand_187061927()
{


;

}
fun Elevator_DoorOpenedOkToClose_entry72()
{


send Elevator_TimerV, eStartDoorCloseTimer;
}
fun Elevator_DoorOpenedOkToClose_exit0_rand_337011023()
{


;

}
fun Elevator_DoorClosing_entry83()
{


send Elevator_DoorV, eSendCommandToCloseDoor;
}
fun Elevator_DoorClosing_exit0_rand_467835476()
{


;

}
fun Elevator_StoppingDoor_entry96()
{


send Elevator_DoorV, eSendCommandToStopDoor;
}
fun Elevator_StoppingDoor_exit0_rand_494670480()
{


;

}
fun Elevator_StoppingTimer_entry108()
{


send Elevator_TimerV, eStopDoorCloseTimer;
}
fun Elevator_StoppingTimer_exit0_rand_1308384270()
{


;

}
fun Elevator_WaitingForTimer_entry0_rand_1967596660()
{


;

}
fun Elevator_WaitingForTimer_exit0_rand_1852643819()
{


;

}
fun Elevator_ReturnState_entry124()
{


raise eStopTimerReturned;
}
fun Elevator_ReturnState_exit0_rand_1317035102()
{


;

}start  state Elevator_Init
{entry  {
Elevator_Init_entry26();
}
exit  {
Elevator_Init_exit0_rand_1143908852();
}
on eUnit goto Elevator_DoorClosed with   {
Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_318982382();
}
}
 state Elevator_DoorClosed
{entry  {
Elevator_DoorClosed_entry38();
}
exit  {
Elevator_DoorClosed_exit0_rand_588228602();
}
ignore eCloseDoor;on eOpenDoor goto Elevator_DoorOpening with   {
Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_1050256098();
}
}
 state Elevator_DoorOpening
{entry  {
Elevator_DoorOpening_entry49();
}
exit  {
Elevator_DoorOpening_exit0_rand_1146056752();
}
ignore eOpenDoor;
defer eCloseDoor;on eDoorOpened goto Elevator_DoorOpened with   {
Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_73580941();
}
}
 state Elevator_DoorOpened
{entry  {
Elevator_DoorOpened_entry59();
}
exit  {
Elevator_DoorOpened_exit0_rand_187061927();
}
defer eCloseDoor;on eTimerFired goto Elevator_DoorOpenedOkToClose with   {
Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_256925250();
}

on eStopTimerReturned goto Elevator_DoorOpened with   {
Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1293386356();
}

on eOpenDoor push Elevator_StoppingTimer;}
 state Elevator_DoorOpenedOkToClose
{entry  {
Elevator_DoorOpenedOkToClose_entry72();
}
exit  {
Elevator_DoorOpenedOkToClose_exit0_rand_337011023();
}
defer eOpenDoor;on eStopTimerReturned goto Elevator_DoorClosing with   {
Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_1038719149();
}

on eTimerFired goto Elevator_DoorClosing with   {
Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_1240532560();
}

on eCloseDoor push Elevator_StoppingTimer;}
 state Elevator_DoorClosing
{entry  {
Elevator_DoorClosing_entry83();
}
exit  {
Elevator_DoorClosing_exit0_rand_467835476();
}
defer eCloseDoor;on eOpenDoor goto Elevator_StoppingDoor with   {
Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_217044969();
}

on eDoorClosed goto Elevator_DoorClosed with   {
Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1555357729();
}

on eObjectDetected goto Elevator_DoorOpening with   {
Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_246402508();
}
}
 state Elevator_StoppingDoor
{entry  {
Elevator_StoppingDoor_entry96();
}
exit  {
Elevator_StoppingDoor_exit0_rand_494670480();
}
defer eCloseDoor;
ignore eOpenDoor;
ignore eObjectDetected;on eDoorOpened goto Elevator_DoorOpened with   {
Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1434313673();
}

on eDoorClosed goto Elevator_DoorClosed with   {
Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1876051143();
}

on eDoorStopped goto Elevator_DoorOpening with   {
Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1368303597();
}
}
 state Elevator_StoppingTimer
{entry  {
Elevator_StoppingTimer_entry108();
}
exit  {
Elevator_StoppingTimer_exit0_rand_1308384270();
}
defer eOpenDoor;
defer eCloseDoor;
defer eObjectDetected;on eOperationSuccess goto Elevator_ReturnState with   {
Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1665044387();
}

on eOperationFailure goto Elevator_WaitingForTimer with   {
Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_1808141834();
}
}
 state Elevator_WaitingForTimer
{entry  {
Elevator_WaitingForTimer_entry0_rand_1967596660();
}
exit  {
Elevator_WaitingForTimer_exit0_rand_1852643819();
}
defer eOpenDoor;
defer eCloseDoor;
defer eObjectDetected;on eTimerFired goto Elevator_ReturnState with   {
Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_376138447();
}
}
 state Elevator_ReturnState
{entry  {
Elevator_ReturnState_entry124();
}
exit  {
Elevator_ReturnState_exit0_rand_1317035102();
}
}
}

main machine User
{
var User_ElevatorV: machine;

fun User_Init_on_eUnit_goto_User_Loop0_rand_819464067()
{


;

}
fun User_Loop_on_eUnit_goto_User_Loop0_rand_1236318978()
{


;

}
fun User_Init_entry134()
{
var _tmp383: machine;


_tmp383 = new Elevator(null);
User_ElevatorV = _tmp383;
raise eUnit;
}
fun User_Init_exit0_rand_1408047480()
{


;

}
fun User_Loop_entry143()
{
var _tmp384: bool;
var _tmp385: bool;


_tmp384 = $;
if(_tmp384)
{

send User_ElevatorV, eOpenDoor;

}
else
{

_tmp385 = $;
if(_tmp385)
{

send User_ElevatorV, eCloseDoor;

}
else
{

;


}


}

raise eUnit;
}
fun User_Loop_exit0_rand_1376674412()
{


;

}start  state User_Init
{entry  {
User_Init_entry134();
}
exit  {
User_Init_exit0_rand_1408047480();
}
on eUnit goto User_Loop with   {
User_Init_on_eUnit_goto_User_Loop0_rand_819464067();
}
}
 state User_Loop
{entry  {
User_Loop_entry143();
}
exit  {
User_Loop_exit0_rand_1376674412();
}
on eUnit goto User_Loop with   {
User_Loop_on_eUnit_goto_User_Loop0_rand_1236318978();
}
}
}

model Door
{
var Door_ElevatorV: machine;

fun Door__Init_on_eUnit_goto_Door_Init0_rand_359840057()
{


;

}
fun Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_872598255()
{


;

}
fun Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_309215957()
{


;

}
fun Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_1194088382()
{


;

}
fun Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_565295618()
{


;

}
fun Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_698536825()
{


;

}
fun Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_2063753356()
{


;

}
fun Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_1150662868()
{


;

}
fun Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_721060563()
{


;

}
fun Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_761797105()
{


;

}
fun Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_848071265()
{


;

}
fun Door__Init_entry159(Door__Init_entry159_payload: machine)
{


Door_ElevatorV = Door__Init_entry159_payload;
raise eUnit;
}
fun Door__Init_exit0_rand_905589899()
{


;

}
fun Door_Init_entry0_rand_1134153679()
{


;

}
fun Door_Init_exit0_rand_1818959532()
{


;

}
fun Door_OpenDoor_entry173()
{


send Door_ElevatorV, eDoorOpened;
raise eUnit;
}
fun Door_OpenDoor_exit0_rand_1153442002()
{


;

}
fun Door_ConsiderClosingDoor_entry182()
{
var _tmp386: bool;
var _tmp387: bool;


_tmp386 = $;
if(_tmp386)
{

raise eUnit;

}
else
{

_tmp387 = $;
if(_tmp387)
{

raise eObjectEncountered;

}
else
{

;


}


}

}
fun Door_ConsiderClosingDoor_exit0_rand_431373013()
{


;

}
fun Door_ObjectEncountered_entry196()
{


send Door_ElevatorV, eObjectDetected;
raise eUnit;
}
fun Door_ObjectEncountered_exit0_rand_1048862774()
{


;

}
fun Door_CloseDoor_entry205()
{


send Door_ElevatorV, eDoorClosed;
raise eUnit;
}
fun Door_CloseDoor_exit0_rand_652323317()
{


;

}
fun Door_StopDoor_entry213()
{


send Door_ElevatorV, eDoorStopped;
raise eUnit;
}
fun Door_StopDoor_exit0_rand_1272377647()
{


;

}
fun Door_ResetDoor_entry0_rand_484960480()
{


;

}
fun Door_ResetDoor_exit0_rand_1522527763()
{


;

}start  state Door__Init
{entry (payload: machine) {
Door__Init_entry159(payload);
}
exit  {
Door__Init_exit0_rand_905589899();
}
on eUnit goto Door_Init with   {
Door__Init_on_eUnit_goto_Door_Init0_rand_359840057();
}
}
 state Door_Init
{entry  {
Door_Init_entry0_rand_1134153679();
}
exit  {
Door_Init_exit0_rand_1818959532();
}
ignore eSendCommandToStopDoor;
ignore eSendCommandToResetDoor;
ignore eResetDoor;on eSendCommandToOpenDoor goto Door_OpenDoor with   {
Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_872598255();
}

on eSendCommandToCloseDoor goto Door_ConsiderClosingDoor with   {
Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_309215957();
}
}
 state Door_OpenDoor
{entry  {
Door_OpenDoor_entry173();
}
exit  {
Door_OpenDoor_exit0_rand_1153442002();
}
on eUnit goto Door_ResetDoor with   {
Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_1194088382();
}
}
 state Door_ConsiderClosingDoor
{entry  {
Door_ConsiderClosingDoor_entry182();
}
exit  {
Door_ConsiderClosingDoor_exit0_rand_431373013();
}
on eUnit goto Door_CloseDoor with   {
Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_565295618();
}

on eObjectEncountered goto Door_ObjectEncountered with   {
Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_698536825();
}

on eSendCommandToStopDoor goto Door_StopDoor with   {
Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_2063753356();
}
}
 state Door_ObjectEncountered
{entry  {
Door_ObjectEncountered_entry196();
}
exit  {
Door_ObjectEncountered_exit0_rand_1048862774();
}
on eUnit goto Door_Init with   {
Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_1150662868();
}
}
 state Door_CloseDoor
{entry  {
Door_CloseDoor_entry205();
}
exit  {
Door_CloseDoor_exit0_rand_652323317();
}
on eUnit goto Door_ResetDoor with   {
Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_721060563();
}
}
 state Door_StopDoor
{entry  {
Door_StopDoor_entry213();
}
exit  {
Door_StopDoor_exit0_rand_1272377647();
}
on eUnit goto Door_OpenDoor with   {
Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_761797105();
}
}
 state Door_ResetDoor
{entry  {
Door_ResetDoor_entry0_rand_484960480();
}
exit  {
Door_ResetDoor_exit0_rand_1522527763();
}
ignore eSendCommandToOpenDoor;
ignore eSendCommandToCloseDoor;
ignore eSendCommandToStopDoor;on eSendCommandToResetDoor goto Door_Init with   {
Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_848071265();
}
}
}

model Timer
{
var Timer_ElevatorV: machine;

fun Timer__Init_on_eUnit_goto_Timer_Init0_rand_314178626()
{


;

}
fun Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_776912087()
{


;

}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1272195861()
{


;

}
fun Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_864794912()
{


;

}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1913515915()
{


;

}
fun Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_273964044()
{


;

}
fun Timer__Init_entry232(Timer__Init_entry232_payload: machine)
{


Timer_ElevatorV = Timer__Init_entry232_payload;
raise eUnit;
}
fun Timer__Init_exit0_rand_340655541()
{


;

}
fun Timer_Init_entry0_rand_142723488()
{


;

}
fun Timer_Init_exit0_rand_317658586()
{


;

}
fun Timer_TimerStarted_entry245()
{
var _tmp388: bool;


_tmp388 = $;
if(_tmp388)
{

raise eUnit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_478735455()
{


;

}
fun Timer_SendTimerFired_entry254()
{


send Timer_ElevatorV, eTimerFired;
raise eUnit;
}
fun Timer_SendTimerFired_exit0_rand_1516457351()
{


;

}
fun Timer_ConsiderStopping_entry262()
{
var _tmp389: bool;


_tmp389 = $;
if(_tmp389)
{

send Timer_ElevatorV, eOperationFailure;
send Timer_ElevatorV, eTimerFired;

}
else
{

send Timer_ElevatorV, eOperationSuccess;

}

raise eUnit;
}
fun Timer_ConsiderStopping_exit0_rand_1241179103()
{


;

}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry232(payload);
}
exit  {
Timer__Init_exit0_rand_340655541();
}
on eUnit goto Timer_Init with   {
Timer__Init_on_eUnit_goto_Timer_Init0_rand_314178626();
}
}
 state Timer_Init
{entry  {
Timer_Init_entry0_rand_142723488();
}
exit  {
Timer_Init_exit0_rand_317658586();
}
ignore eStopDoorCloseTimer;on eStartDoorCloseTimer goto Timer_TimerStarted with   {
Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_776912087();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry245();
}
exit  {
Timer_TimerStarted_exit0_rand_478735455();
}
defer eStartDoorCloseTimer;on eUnit goto Timer_SendTimerFired with   {
Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1272195861();
}

on eStopDoorCloseTimer goto Timer_ConsiderStopping with   {
Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_864794912();
}
}
 state Timer_SendTimerFired
{entry  {
Timer_SendTimerFired_entry254();
}
exit  {
Timer_SendTimerFired_exit0_rand_1516457351();
}
defer eStartDoorCloseTimer;on eUnit goto Timer_Init with   {
Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1913515915();
}
}
 state Timer_ConsiderStopping
{entry  {
Timer_ConsiderStopping_entry262();
}
exit  {
Timer_ConsiderStopping_exit0_rand_1241179103();
}
defer eStartDoorCloseTimer;on eUnit goto Timer_Init with   {
Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_273964044();
}
}
}

