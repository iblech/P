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

fun Elevator_Init_entry26(Elevator_Init_entry26__payload_0: any)
{
var _tmp224: machine;
var _tmp225: machine;


_tmp224 = new Timer(this);

Elevator_TimerV = _tmp224;

_tmp225 = new Door(this);

Elevator_DoorV = _tmp225;

raise eUnit;


}
fun Elevator_Init_exit0_rand_1686903840()
{


;


}
fun Elevator_DoorClosed_entry38(Elevator_DoorClosed_entry38__payload_1: any)
{


send Elevator_DoorV, eSendCommandToResetDoor;


}
fun Elevator_DoorClosed_exit0_rand_903695874()
{


;


}
fun Elevator_DoorOpening_entry49(Elevator_DoorOpening_entry49__payload_2: any)
{


send Elevator_DoorV, eSendCommandToOpenDoor;


}
fun Elevator_DoorOpening_exit0_rand_1027426207()
{


;


}
fun Elevator_DoorOpened_entry59(Elevator_DoorOpened_entry59__payload_3: any)
{


send Elevator_DoorV, eSendCommandToResetDoor;

send Elevator_TimerV, eStartDoorCloseTimer;


}
fun Elevator_DoorOpened_exit0_rand_1353606100()
{


;


}
fun Elevator_DoorOpenedOkToClose_entry72(Elevator_DoorOpenedOkToClose_entry72__payload_4: any)
{


send Elevator_TimerV, eStartDoorCloseTimer;


}
fun Elevator_DoorOpenedOkToClose_exit0_rand_713048619()
{


;


}
fun Elevator_DoorClosing_entry83(Elevator_DoorClosing_entry83__payload_5: any)
{


send Elevator_DoorV, eSendCommandToCloseDoor;


}
fun Elevator_DoorClosing_exit0_rand_18444390()
{


;


}
fun Elevator_StoppingDoor_entry96(Elevator_StoppingDoor_entry96__payload_6: any)
{


send Elevator_DoorV, eSendCommandToStopDoor;


}
fun Elevator_StoppingDoor_exit0_rand_1429001944()
{


;


}
fun Elevator_StoppingTimer_entry108(Elevator_StoppingTimer_entry108__payload_7: any)
{


send Elevator_TimerV, eStopDoorCloseTimer;


}
fun Elevator_StoppingTimer_exit0_rand_461651540()
{


;


}
fun Elevator_WaitingForTimer_entry0_rand_1865239900(Elevator_WaitingForTimer_entry0_rand_1865239900__payload_8: any)
{


;


}
fun Elevator_WaitingForTimer_exit0_rand_953037264()
{


;


}
fun Elevator_ReturnState_entry124(Elevator_ReturnState_entry124__payload_9: any)
{


raise eStopTimerReturned;


}
fun Elevator_ReturnState_exit0_rand_1127705923()
{


;


}
fun Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_841303792(Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_841303792__payload_skip: any)
{


;


}
fun Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_1549061129(Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_1549061129__payload_skip: any)
{


;


}
fun Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1076467887(Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1076467887__payload_skip: any)
{


;


}
fun Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_752504411(Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_752504411__payload_skip: any)
{


;


}
fun Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1574549470(Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1574549470__payload_skip: any)
{


;


}
fun Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_1469872336(Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_1469872336__payload_skip: any)
{


;


}
fun Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_1889616750(Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_1889616750__payload_skip: any)
{


;


}
fun Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_1272448886(Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_1272448886__payload_skip: any)
{


;


}
fun Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1006167384(Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1006167384__payload_skip: any)
{


;


}
fun Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_994690399(Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_994690399__payload_skip: any)
{


;


}
fun Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_786503023(Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_786503023__payload_skip: any)
{


;


}
fun Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_80658180(Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_80658180__payload_skip: any)
{


;


}
fun Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1923280678(Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1923280678__payload_skip: any)
{


;


}
fun Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1524153496(Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1524153496__payload_skip: any)
{


;


}
fun Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_1326804825(Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_1326804825__payload_skip: any)
{


;


}
fun Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_2061985800(Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_2061985800__payload_skip: any)
{


;


}start  state Elevator_Init
{entry (payload: any) {
Elevator_Init_entry26(payload);
}
exit  {
Elevator_Init_exit0_rand_1686903840();
}
}
 state Elevator_DoorClosed
{entry (payload: any) {
Elevator_DoorClosed_entry38(payload);
}
exit  {
Elevator_DoorClosed_exit0_rand_903695874();
}
}
 state Elevator_DoorOpening
{entry (payload: any) {
Elevator_DoorOpening_entry49(payload);
}
exit  {
Elevator_DoorOpening_exit0_rand_1027426207();
}
}
 state Elevator_DoorOpened
{entry (payload: any) {
Elevator_DoorOpened_entry59(payload);
}
exit  {
Elevator_DoorOpened_exit0_rand_1353606100();
}
}
 state Elevator_DoorOpenedOkToClose
{entry (payload: any) {
Elevator_DoorOpenedOkToClose_entry72(payload);
}
exit  {
Elevator_DoorOpenedOkToClose_exit0_rand_713048619();
}
}
 state Elevator_DoorClosing
{entry (payload: any) {
Elevator_DoorClosing_entry83(payload);
}
exit  {
Elevator_DoorClosing_exit0_rand_18444390();
}
}
 state Elevator_StoppingDoor
{entry (payload: any) {
Elevator_StoppingDoor_entry96(payload);
}
exit  {
Elevator_StoppingDoor_exit0_rand_1429001944();
}
}
 state Elevator_StoppingTimer
{entry (payload: any) {
Elevator_StoppingTimer_entry108(payload);
}
exit  {
Elevator_StoppingTimer_exit0_rand_461651540();
}
}
 state Elevator_WaitingForTimer
{entry (payload: any) {
Elevator_WaitingForTimer_entry0_rand_1865239900(payload);
}
exit  {
Elevator_WaitingForTimer_exit0_rand_953037264();
}
}
 state Elevator_ReturnState
{entry (payload: any) {
Elevator_ReturnState_entry124(payload);
}
exit  {
Elevator_ReturnState_exit0_rand_1127705923();
}
}
}

main machine User
{
var User_ElevatorV: machine;

fun User_Init_entry134(User_Init_entry134__payload_10: any)
{
var _tmp226: machine;


_tmp226 = new Elevator(null);

User_ElevatorV = _tmp226;

raise eUnit;


}
fun User_Init_exit0_rand_1824229143()
{


;


}
fun User_Loop_entry143(User_Loop_entry143__payload_11: any)
{
var _tmp227: bool;
var _tmp228: bool;


_tmp227 = $;

if(_tmp227)
{

send User_ElevatorV, eOpenDoor;

send User_ElevatorV, eOpenDoor;



}
else
{

_tmp228 = $;

if(_tmp228)
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
fun User_Loop_exit0_rand_1356854204()
{


;


}
fun User_Init_on_eUnit_goto_User_Loop0_rand_1383540289(User_Init_on_eUnit_goto_User_Loop0_rand_1383540289__payload_skip: any)
{


;


}
fun User_Loop_on_eUnit_goto_User_Loop0_rand_45174483(User_Loop_on_eUnit_goto_User_Loop0_rand_45174483__payload_skip: any)
{


;


}start  state User_Init
{entry (payload: any) {
User_Init_entry134(payload);
}
exit  {
User_Init_exit0_rand_1824229143();
}
}
 state User_Loop
{entry (payload: any) {
User_Loop_entry143(payload);
}
exit  {
User_Loop_exit0_rand_1356854204();
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
fun Door__Init_exit0_rand_1217707182()
{


;


}
fun Door_Init_entry0_rand_597942424(Door_Init_entry0_rand_597942424__payload_12: any)
{


;


}
fun Door_Init_exit0_rand_1309323676()
{


;


}
fun Door_OpenDoor_entry173(Door_OpenDoor_entry173__payload_13: any)
{


send Door_ElevatorV, eDoorOpened;

raise eUnit;


}
fun Door_OpenDoor_exit0_rand_1686522554()
{


;


}
fun Door_ConsiderClosingDoor_entry182(Door_ConsiderClosingDoor_entry182__payload_14: any)
{
var _tmp229: bool;
var _tmp230: bool;


_tmp229 = $;

if(_tmp229)
{

raise eUnit;

raise eUnit;



}
else
{

_tmp230 = $;

if(_tmp230)
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
fun Door_ConsiderClosingDoor_exit0_rand_1744905947()
{


;


}
fun Door_ObjectEncountered_entry196(Door_ObjectEncountered_entry196__payload_15: any)
{


send Door_ElevatorV, eObjectDetected;

raise eUnit;


}
fun Door_ObjectEncountered_exit0_rand_1393898013()
{


;


}
fun Door_CloseDoor_entry205(Door_CloseDoor_entry205__payload_16: any)
{


send Door_ElevatorV, eDoorClosed;

raise eUnit;


}
fun Door_CloseDoor_exit0_rand_1388230203()
{


;


}
fun Door_StopDoor_entry213(Door_StopDoor_entry213__payload_17: any)
{


send Door_ElevatorV, eDoorStopped;

raise eUnit;


}
fun Door_StopDoor_exit0_rand_1907284719()
{


;


}
fun Door_ResetDoor_entry0_rand_704047366(Door_ResetDoor_entry0_rand_704047366__payload_18: any)
{


;


}
fun Door_ResetDoor_exit0_rand_402440591()
{


;


}
fun Door__Init_on_eUnit_goto_Door_Init0_rand_967569110(Door__Init_on_eUnit_goto_Door_Init0_rand_967569110__payload_skip: any)
{


;


}
fun Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_764219923(Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_764219923__payload_skip: any)
{


;


}
fun Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_1815095810(Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_1815095810__payload_skip: any)
{


;


}
fun Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_1446045937(Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_1446045937__payload_skip: any)
{


;


}
fun Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_434921697(Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_434921697__payload_skip: any)
{


;


}
fun Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_1306958154(Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_1306958154__payload_skip: any)
{


;


}
fun Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_1565015983(Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_1565015983__payload_skip: any)
{


;


}
fun Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_26249467(Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_26249467__payload_skip: any)
{


;


}
fun Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_982856474(Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_982856474__payload_skip: any)
{


;


}
fun Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_501255283(Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_501255283__payload_skip: any)
{


;


}
fun Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_711084423(Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_711084423__payload_skip: any)
{


;


}start  state Door__Init
{entry (payload: machine) {
Door__Init_entry159(payload);
}
exit  {
Door__Init_exit0_rand_1217707182();
}
}
 state Door_Init
{entry (payload: any) {
Door_Init_entry0_rand_597942424(payload);
}
exit  {
Door_Init_exit0_rand_1309323676();
}
}
 state Door_OpenDoor
{entry (payload: any) {
Door_OpenDoor_entry173(payload);
}
exit  {
Door_OpenDoor_exit0_rand_1686522554();
}
}
 state Door_ConsiderClosingDoor
{entry (payload: any) {
Door_ConsiderClosingDoor_entry182(payload);
}
exit  {
Door_ConsiderClosingDoor_exit0_rand_1744905947();
}
}
 state Door_ObjectEncountered
{entry (payload: any) {
Door_ObjectEncountered_entry196(payload);
}
exit  {
Door_ObjectEncountered_exit0_rand_1393898013();
}
}
 state Door_CloseDoor
{entry (payload: any) {
Door_CloseDoor_entry205(payload);
}
exit  {
Door_CloseDoor_exit0_rand_1388230203();
}
}
 state Door_StopDoor
{entry (payload: any) {
Door_StopDoor_entry213(payload);
}
exit  {
Door_StopDoor_exit0_rand_1907284719();
}
}
 state Door_ResetDoor
{entry (payload: any) {
Door_ResetDoor_entry0_rand_704047366(payload);
}
exit  {
Door_ResetDoor_exit0_rand_402440591();
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
fun Timer__Init_exit0_rand_316341784()
{


;


}
fun Timer_Init_entry0_rand_1510721380(Timer_Init_entry0_rand_1510721380__payload_19: any)
{


;


}
fun Timer_Init_exit0_rand_1895422704()
{


;


}
fun Timer_TimerStarted_entry245(Timer_TimerStarted_entry245__payload_20: any)
{
var _tmp231: bool;


_tmp231 = $;

if(_tmp231)
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
fun Timer_TimerStarted_exit0_rand_242436471()
{


;


}
fun Timer_SendTimerFired_entry254(Timer_SendTimerFired_entry254__payload_21: any)
{


send Timer_ElevatorV, eTimerFired;

raise eUnit;


}
fun Timer_SendTimerFired_exit0_rand_717182425()
{


;


}
fun Timer_ConsiderStopping_entry262(Timer_ConsiderStopping_entry262__payload_22: any)
{
var _tmp232: bool;


_tmp232 = $;

if(_tmp232)
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
fun Timer_ConsiderStopping_exit0_rand_911790269()
{


;


}
fun Timer__Init_on_eUnit_goto_Timer_Init0_rand_1990368367(Timer__Init_on_eUnit_goto_Timer_Init0_rand_1990368367__payload_skip: any)
{


;


}
fun Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_965109562(Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_965109562__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1923491566(Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1923491566__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_711819519(Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_711819519__payload_skip: any)
{


;


}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1697344918(Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1697344918__payload_skip: any)
{


;


}
fun Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_1023936108(Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_1023936108__payload_skip: any)
{


;


}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry232(payload);
}
exit  {
Timer__Init_exit0_rand_316341784();
}
}
 state Timer_Init
{entry (payload: any) {
Timer_Init_entry0_rand_1510721380(payload);
}
exit  {
Timer_Init_exit0_rand_1895422704();
}
}
 state Timer_TimerStarted
{entry (payload: any) {
Timer_TimerStarted_entry245(payload);
}
exit  {
Timer_TimerStarted_exit0_rand_242436471();
}
}
 state Timer_SendTimerFired
{entry (payload: any) {
Timer_SendTimerFired_entry254(payload);
}
exit  {
Timer_SendTimerFired_exit0_rand_717182425();
}
}
 state Timer_ConsiderStopping
{entry (payload: any) {
Timer_ConsiderStopping_entry262(payload);
}
exit  {
Timer_ConsiderStopping_exit0_rand_911790269();
}
}
}

