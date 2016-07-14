event halt;
event null;
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
fun Elevator_Init_exit0_rand_1684260961()
{


;


}
fun Elevator_DoorClosed_entry38()
{


send Elevator_DoorV, eSendCommandToResetDoor;


}
fun Elevator_DoorClosed_exit0_rand_15165319()
{


;


}
fun Elevator_DoorOpening_entry49()
{


send Elevator_DoorV, eSendCommandToOpenDoor;


}
fun Elevator_DoorOpening_exit0_rand_1598635739()
{


;


}
fun Elevator_DoorOpened_entry59()
{


send Elevator_DoorV, eSendCommandToResetDoor;

send Elevator_TimerV, eStartDoorCloseTimer;


}
fun Elevator_DoorOpened_exit0_rand_1678857423()
{


;


}
fun Elevator_DoorOpenedOkToClose_entry72()
{


send Elevator_TimerV, eStartDoorCloseTimer;


}
fun Elevator_DoorOpenedOkToClose_exit0_rand_328990523()
{


;


}
fun Elevator_DoorClosing_entry83()
{


send Elevator_DoorV, eSendCommandToCloseDoor;


}
fun Elevator_DoorClosing_exit0_rand_892286445()
{


;


}
fun Elevator_StoppingDoor_entry96()
{


send Elevator_DoorV, eSendCommandToStopDoor;


}
fun Elevator_StoppingDoor_exit0_rand_1753810820()
{


;


}
fun Elevator_StoppingTimer_entry108()
{


send Elevator_TimerV, eStopDoorCloseTimer;


}
fun Elevator_StoppingTimer_exit0_rand_1805726763()
{


;


}
fun Elevator_WaitingForTimer_entry0_rand_1084262102()
{


;


}
fun Elevator_WaitingForTimer_exit0_rand_137095303()
{


;


}
fun Elevator_ReturnState_entry124()
{


raise eStopTimerReturned;


}
fun Elevator_ReturnState_exit0_rand_442274439()
{


;


}
fun Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_1699631151()
{


;


}
fun Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_417044959()
{


;


}
fun Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_50512425()
{


;


}
fun Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_1020312940()
{


;


}
fun Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1712664340()
{


;


}
fun Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_1973958015()
{


;


}
fun Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_1050811112()
{


;


}
fun Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_212773951()
{


;


}
fun Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_504283857()
{


;


}
fun Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_1257909395()
{


;


}
fun Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_2041575271()
{


;


}
fun Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_849347776()
{


;


}
fun Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_667611789()
{


;


}
fun Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_93420304()
{


;


}
fun Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_2054812689()
{


;


}
fun Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_1755269030()
{


;


}start  state Elevator_Init
{entry  {
Elevator_Init_entry26();
}
exit  {
Elevator_Init_exit0_rand_1684260961();
}
}
 state Elevator_DoorClosed
{entry  {
Elevator_DoorClosed_entry38();
}
exit  {
Elevator_DoorClosed_exit0_rand_15165319();
}
}
 state Elevator_DoorOpening
{entry  {
Elevator_DoorOpening_entry49();
}
exit  {
Elevator_DoorOpening_exit0_rand_1598635739();
}
}
 state Elevator_DoorOpened
{entry  {
Elevator_DoorOpened_entry59();
}
exit  {
Elevator_DoorOpened_exit0_rand_1678857423();
}
}
 state Elevator_DoorOpenedOkToClose
{entry  {
Elevator_DoorOpenedOkToClose_entry72();
}
exit  {
Elevator_DoorOpenedOkToClose_exit0_rand_328990523();
}
}
 state Elevator_DoorClosing
{entry  {
Elevator_DoorClosing_entry83();
}
exit  {
Elevator_DoorClosing_exit0_rand_892286445();
}
}
 state Elevator_StoppingDoor
{entry  {
Elevator_StoppingDoor_entry96();
}
exit  {
Elevator_StoppingDoor_exit0_rand_1753810820();
}
}
 state Elevator_StoppingTimer
{entry  {
Elevator_StoppingTimer_entry108();
}
exit  {
Elevator_StoppingTimer_exit0_rand_1805726763();
}
}
 state Elevator_WaitingForTimer
{entry  {
Elevator_WaitingForTimer_entry0_rand_1084262102();
}
exit  {
Elevator_WaitingForTimer_exit0_rand_137095303();
}
}
 state Elevator_ReturnState
{entry  {
Elevator_ReturnState_entry124();
}
exit  {
Elevator_ReturnState_exit0_rand_442274439();
}
}
}

main machine User
{
var User_ElevatorV: machine;

fun User_Init_entry134()
{
var _tmp383: machine;


_tmp383 = new Elevator(null);

User_ElevatorV = _tmp383;

raise eUnit;


}
fun User_Init_exit0_rand_217765003()
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

send User_ElevatorV, eOpenDoor;



}
else
{

_tmp385 = $;

if(_tmp385)
{

send User_ElevatorV, eCloseDoor;

send User_ElevatorV, eCloseDoor;



}
else
{

;

;



}

if($)
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
fun User_Loop_exit0_rand_584146217()
{


;


}
fun User_Init_on_eUnit_goto_User_Loop0_rand_1515026139()
{


;


}
fun User_Loop_on_eUnit_goto_User_Loop0_rand_1525001208()
{


;


}start  state User_Init
{entry  {
User_Init_entry134();
}
exit  {
User_Init_exit0_rand_217765003();
}
}
 state User_Loop
{entry  {
User_Loop_entry143();
}
exit  {
User_Loop_exit0_rand_584146217();
}
}
}

model Door
{
var Door_ElevatorV: machine;

fun Door__Init_entry159(Door__Init_entry159_payload: machine)
{


Door_ElevatorV = Door__Init_entry159_payload;

raise eUnit;


}
fun Door__Init_exit0_rand_684954791()
{


;


}
fun Door_Init_entry0_rand_114917715()
{


;


}
fun Door_Init_exit0_rand_467161449()
{


;


}
fun Door_OpenDoor_entry173()
{


send Door_ElevatorV, eDoorOpened;

raise eUnit;


}
fun Door_OpenDoor_exit0_rand_1062228071()
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

raise eUnit;



}
else
{

_tmp387 = $;

if(_tmp387)
{

raise eObjectEncountered;

raise eObjectEncountered;



}
else
{

;

;



}

if($)
{
raise eObjectEncountered;

}
else
{
;

}



}


}
fun Door_ConsiderClosingDoor_exit0_rand_899330250()
{


;


}
fun Door_ObjectEncountered_entry196()
{


send Door_ElevatorV, eObjectDetected;

raise eUnit;


}
fun Door_ObjectEncountered_exit0_rand_464680635()
{


;


}
fun Door_CloseDoor_entry205()
{


send Door_ElevatorV, eDoorClosed;

raise eUnit;


}
fun Door_CloseDoor_exit0_rand_876414016()
{


;


}
fun Door_StopDoor_entry213()
{


send Door_ElevatorV, eDoorStopped;

raise eUnit;


}
fun Door_StopDoor_exit0_rand_1329869067()
{


;


}
fun Door_ResetDoor_entry0_rand_1373678929()
{


;


}
fun Door_ResetDoor_exit0_rand_1389422092()
{


;


}
fun Door__Init_on_eUnit_goto_Door_Init0_rand_2011941891()
{


;


}
fun Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_304784659()
{


;


}
fun Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_1734006768()
{


;


}
fun Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_1700048094()
{


;


}
fun Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_75258849()
{


;


}
fun Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_760622740()
{


;


}
fun Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_120700773()
{


;


}
fun Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_749557213()
{


;


}
fun Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_310582032()
{


;


}
fun Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_773226874()
{


;


}
fun Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_56401310()
{


;


}start  state Door__Init
{entry (payload: machine) {
Door__Init_entry159(payload);
}
exit  {
Door__Init_exit0_rand_684954791();
}
}
 state Door_Init
{entry  {
Door_Init_entry0_rand_114917715();
}
exit  {
Door_Init_exit0_rand_467161449();
}
}
 state Door_OpenDoor
{entry  {
Door_OpenDoor_entry173();
}
exit  {
Door_OpenDoor_exit0_rand_1062228071();
}
}
 state Door_ConsiderClosingDoor
{entry  {
Door_ConsiderClosingDoor_entry182();
}
exit  {
Door_ConsiderClosingDoor_exit0_rand_899330250();
}
}
 state Door_ObjectEncountered
{entry  {
Door_ObjectEncountered_entry196();
}
exit  {
Door_ObjectEncountered_exit0_rand_464680635();
}
}
 state Door_CloseDoor
{entry  {
Door_CloseDoor_entry205();
}
exit  {
Door_CloseDoor_exit0_rand_876414016();
}
}
 state Door_StopDoor
{entry  {
Door_StopDoor_entry213();
}
exit  {
Door_StopDoor_exit0_rand_1329869067();
}
}
 state Door_ResetDoor
{entry  {
Door_ResetDoor_entry0_rand_1373678929();
}
exit  {
Door_ResetDoor_exit0_rand_1389422092();
}
}
}

model Timer
{
var Timer_ElevatorV: machine;

fun Timer__Init_entry232(Timer__Init_entry232_payload: machine)
{


Timer_ElevatorV = Timer__Init_entry232_payload;

raise eUnit;


}
fun Timer__Init_exit0_rand_1542234429()
{


;


}
fun Timer_Init_entry0_rand_1733694935()
{


;


}
fun Timer_Init_exit0_rand_434782272()
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

raise eUnit;



}
else
{

;

;



}


}
fun Timer_TimerStarted_exit0_rand_151579705()
{


;


}
fun Timer_SendTimerFired_entry254()
{


send Timer_ElevatorV, eTimerFired;

raise eUnit;


}
fun Timer_SendTimerFired_exit0_rand_2147210193()
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

send Timer_ElevatorV, eOperationFailure;

send Timer_ElevatorV, eTimerFired;



}
else
{

send Timer_ElevatorV, eOperationSuccess;

send Timer_ElevatorV, eOperationSuccess;



}

raise eUnit;


}
fun Timer_ConsiderStopping_exit0_rand_2068624400()
{


;


}
fun Timer__Init_on_eUnit_goto_Timer_Init0_rand_2092646135()
{


;


}
fun Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_2041691898()
{


;


}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_740706740()
{


;


}
fun Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_1754084274()
{


;


}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1884586010()
{


;


}
fun Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_1532114598()
{


;


}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry232(payload);
}
exit  {
Timer__Init_exit0_rand_1542234429();
}
}
 state Timer_Init
{entry  {
Timer_Init_entry0_rand_1733694935();
}
exit  {
Timer_Init_exit0_rand_434782272();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry245();
}
exit  {
Timer_TimerStarted_exit0_rand_151579705();
}
}
 state Timer_SendTimerFired
{entry  {
Timer_SendTimerFired_entry254();
}
exit  {
Timer_SendTimerFired_exit0_rand_2147210193();
}
}
 state Timer_ConsiderStopping
{entry  {
Timer_ConsiderStopping_entry262();
}
exit  {
Timer_ConsiderStopping_exit0_rand_2068624400();
}
}
}

