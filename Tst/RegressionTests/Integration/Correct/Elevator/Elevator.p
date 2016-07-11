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
var _tmp970: machine;
var _tmp971: machine;


_tmp970 = new Timer(this);

Elevator_TimerV = _tmp970;

_tmp971 = new Door(this);

Elevator_DoorV = _tmp971;

raise eUnit;


}
fun Elevator_Init_exit0_rand_532656273()
{


;


}
fun Elevator_DoorClosed_entry38(Elevator_DoorClosed_entry38__payload_1: any)
{


send Elevator_DoorV, eSendCommandToResetDoor;


}
fun Elevator_DoorClosed_exit0_rand_915666412()
{


;


}
fun Elevator_DoorOpening_entry49(Elevator_DoorOpening_entry49__payload_2: any)
{


send Elevator_DoorV, eSendCommandToOpenDoor;


}
fun Elevator_DoorOpening_exit0_rand_783680686()
{


;


}
fun Elevator_DoorOpened_entry59(Elevator_DoorOpened_entry59__payload_3: any)
{


send Elevator_DoorV, eSendCommandToResetDoor;

send Elevator_TimerV, eStartDoorCloseTimer;


}
fun Elevator_DoorOpened_exit0_rand_1496410437()
{


;


}
fun Elevator_DoorOpenedOkToClose_entry72(Elevator_DoorOpenedOkToClose_entry72__payload_4: any)
{


send Elevator_TimerV, eStartDoorCloseTimer;


}
fun Elevator_DoorOpenedOkToClose_exit0_rand_451823289()
{


;


}
fun Elevator_DoorClosing_entry83(Elevator_DoorClosing_entry83__payload_5: any)
{


send Elevator_DoorV, eSendCommandToCloseDoor;


}
fun Elevator_DoorClosing_exit0_rand_1161808300()
{


;


}
fun Elevator_StoppingDoor_entry96(Elevator_StoppingDoor_entry96__payload_6: any)
{


send Elevator_DoorV, eSendCommandToStopDoor;


}
fun Elevator_StoppingDoor_exit0_rand_987242430()
{


;


}
fun Elevator_StoppingTimer_entry108(Elevator_StoppingTimer_entry108__payload_7: any)
{


send Elevator_TimerV, eStopDoorCloseTimer;


}
fun Elevator_StoppingTimer_exit0_rand_2060114030()
{


;


}
fun Elevator_WaitingForTimer_entry0_rand_289126073(Elevator_WaitingForTimer_entry0_rand_289126073__payload_8: any)
{


;


}
fun Elevator_WaitingForTimer_exit0_rand_1494778538()
{


;


}
fun Elevator_ReturnState_entry124(Elevator_ReturnState_entry124__payload_9: any)
{


raise eStopTimerReturned;


}
fun Elevator_ReturnState_exit0_rand_2069761097()
{


;


}
fun Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_484631031(Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_484631031__payload_skip: any)
{


;


}
fun Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_598581119(Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_598581119__payload_skip: any)
{


;


}
fun Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1139690815(Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1139690815__payload_skip: any)
{


;


}
fun Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_1566981043(Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_1566981043__payload_skip: any)
{


;


}
fun Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1908528259(Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1908528259__payload_skip: any)
{


;


}
fun Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_1584575134(Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_1584575134__payload_skip: any)
{


;


}
fun Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_264452133(Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_264452133__payload_skip: any)
{


;


}
fun Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_1705383132(Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_1705383132__payload_skip: any)
{


;


}
fun Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1919854658(Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1919854658__payload_skip: any)
{


;


}
fun Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_88273413(Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_88273413__payload_skip: any)
{


;


}
fun Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_62640068(Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_62640068__payload_skip: any)
{


;


}
fun Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1673219453(Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1673219453__payload_skip: any)
{


;


}
fun Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1467909087(Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1467909087__payload_skip: any)
{


;


}
fun Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1070580758(Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1070580758__payload_skip: any)
{


;


}
fun Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_1810278134(Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_1810278134__payload_skip: any)
{


;


}
fun Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_1954379058(Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_1954379058__payload_skip: any)
{


;


}start  state Elevator_Init
{entry (payload: any) {
Elevator_Init_entry26(payload);
}
exit  {
Elevator_Init_exit0_rand_532656273();
}
}
 state Elevator_DoorClosed
{entry (payload: any) {
Elevator_DoorClosed_entry38(payload);
}
exit  {
Elevator_DoorClosed_exit0_rand_915666412();
}
}
 state Elevator_DoorOpening
{entry (payload: any) {
Elevator_DoorOpening_entry49(payload);
}
exit  {
Elevator_DoorOpening_exit0_rand_783680686();
}
}
 state Elevator_DoorOpened
{entry (payload: any) {
Elevator_DoorOpened_entry59(payload);
}
exit  {
Elevator_DoorOpened_exit0_rand_1496410437();
}
}
 state Elevator_DoorOpenedOkToClose
{entry (payload: any) {
Elevator_DoorOpenedOkToClose_entry72(payload);
}
exit  {
Elevator_DoorOpenedOkToClose_exit0_rand_451823289();
}
}
 state Elevator_DoorClosing
{entry (payload: any) {
Elevator_DoorClosing_entry83(payload);
}
exit  {
Elevator_DoorClosing_exit0_rand_1161808300();
}
}
 state Elevator_StoppingDoor
{entry (payload: any) {
Elevator_StoppingDoor_entry96(payload);
}
exit  {
Elevator_StoppingDoor_exit0_rand_987242430();
}
}
 state Elevator_StoppingTimer
{entry (payload: any) {
Elevator_StoppingTimer_entry108(payload);
}
exit  {
Elevator_StoppingTimer_exit0_rand_2060114030();
}
}
 state Elevator_WaitingForTimer
{entry (payload: any) {
Elevator_WaitingForTimer_entry0_rand_289126073(payload);
}
exit  {
Elevator_WaitingForTimer_exit0_rand_1494778538();
}
}
 state Elevator_ReturnState
{entry (payload: any) {
Elevator_ReturnState_entry124(payload);
}
exit  {
Elevator_ReturnState_exit0_rand_2069761097();
}
}
}

main machine User
{
var User_ElevatorV: machine;

fun User_Init_entry134(User_Init_entry134__payload_10: any)
{
var _tmp972: machine;


_tmp972 = new Elevator(null);

User_ElevatorV = _tmp972;

raise eUnit;


}
fun User_Init_exit0_rand_503503967()
{


;


}
fun User_Loop_entry143(User_Loop_entry143__payload_11: any)
{
var _tmp973: bool;
var _tmp974: bool;


_tmp973 = $;

if(_tmp973)
{

send User_ElevatorV, eOpenDoor;

send User_ElevatorV, eOpenDoor;



}
else
{

_tmp974 = $;

if(_tmp974)
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
fun User_Loop_exit0_rand_746769718()
{


;


}
fun User_Init_on_eUnit_goto_User_Loop0_rand_1886902835(User_Init_on_eUnit_goto_User_Loop0_rand_1886902835__payload_skip: any)
{


;


}
fun User_Loop_on_eUnit_goto_User_Loop0_rand_219491439(User_Loop_on_eUnit_goto_User_Loop0_rand_219491439__payload_skip: any)
{


;


}start  state User_Init
{entry (payload: any) {
User_Init_entry134(payload);
}
exit  {
User_Init_exit0_rand_503503967();
}
}
 state User_Loop
{entry (payload: any) {
User_Loop_entry143(payload);
}
exit  {
User_Loop_exit0_rand_746769718();
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
fun Door__Init_exit0_rand_1708741429()
{


;


}
fun Door_Init_entry0_rand_291815934(Door_Init_entry0_rand_291815934__payload_12: any)
{


;


}
fun Door_Init_exit0_rand_84733312()
{


;


}
fun Door_OpenDoor_entry173(Door_OpenDoor_entry173__payload_13: any)
{


send Door_ElevatorV, eDoorOpened;

raise eUnit;


}
fun Door_OpenDoor_exit0_rand_635678789()
{


;


}
fun Door_ConsiderClosingDoor_entry182(Door_ConsiderClosingDoor_entry182__payload_14: any)
{
var _tmp975: bool;
var _tmp976: bool;


_tmp975 = $;

if(_tmp975)
{

raise eUnit;

raise eUnit;



}
else
{

_tmp976 = $;

if(_tmp976)
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
fun Door_ConsiderClosingDoor_exit0_rand_1628020932()
{


;


}
fun Door_ObjectEncountered_entry196(Door_ObjectEncountered_entry196__payload_15: any)
{


send Door_ElevatorV, eObjectDetected;

raise eUnit;


}
fun Door_ObjectEncountered_exit0_rand_1641956910()
{


;


}
fun Door_CloseDoor_entry205(Door_CloseDoor_entry205__payload_16: any)
{


send Door_ElevatorV, eDoorClosed;

raise eUnit;


}
fun Door_CloseDoor_exit0_rand_545136919()
{


;


}
fun Door_StopDoor_entry213(Door_StopDoor_entry213__payload_17: any)
{


send Door_ElevatorV, eDoorStopped;

raise eUnit;


}
fun Door_StopDoor_exit0_rand_686045225()
{


;


}
fun Door_ResetDoor_entry0_rand_1994917664(Door_ResetDoor_entry0_rand_1994917664__payload_18: any)
{


;


}
fun Door_ResetDoor_exit0_rand_1882317246()
{


;


}
fun Door__Init_on_eUnit_goto_Door_Init0_rand_729866184(Door__Init_on_eUnit_goto_Door_Init0_rand_729866184__payload_skip: any)
{


;


}
fun Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_91528563(Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_91528563__payload_skip: any)
{


;


}
fun Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_237167738(Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_237167738__payload_skip: any)
{


;


}
fun Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_147018857(Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_147018857__payload_skip: any)
{


;


}
fun Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_1926762496(Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_1926762496__payload_skip: any)
{


;


}
fun Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_1805573799(Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_1805573799__payload_skip: any)
{


;


}
fun Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_981909886(Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_981909886__payload_skip: any)
{


;


}
fun Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_848749611(Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_848749611__payload_skip: any)
{


;


}
fun Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_685222256(Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_685222256__payload_skip: any)
{


;


}
fun Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_1180832813(Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_1180832813__payload_skip: any)
{


;


}
fun Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_295083030(Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_295083030__payload_skip: any)
{


;


}start  state Door__Init
{entry (payload: machine) {
Door__Init_entry159(payload);
}
exit  {
Door__Init_exit0_rand_1708741429();
}
}
 state Door_Init
{entry (payload: any) {
Door_Init_entry0_rand_291815934(payload);
}
exit  {
Door_Init_exit0_rand_84733312();
}
}
 state Door_OpenDoor
{entry (payload: any) {
Door_OpenDoor_entry173(payload);
}
exit  {
Door_OpenDoor_exit0_rand_635678789();
}
}
 state Door_ConsiderClosingDoor
{entry (payload: any) {
Door_ConsiderClosingDoor_entry182(payload);
}
exit  {
Door_ConsiderClosingDoor_exit0_rand_1628020932();
}
}
 state Door_ObjectEncountered
{entry (payload: any) {
Door_ObjectEncountered_entry196(payload);
}
exit  {
Door_ObjectEncountered_exit0_rand_1641956910();
}
}
 state Door_CloseDoor
{entry (payload: any) {
Door_CloseDoor_entry205(payload);
}
exit  {
Door_CloseDoor_exit0_rand_545136919();
}
}
 state Door_StopDoor
{entry (payload: any) {
Door_StopDoor_entry213(payload);
}
exit  {
Door_StopDoor_exit0_rand_686045225();
}
}
 state Door_ResetDoor
{entry (payload: any) {
Door_ResetDoor_entry0_rand_1994917664(payload);
}
exit  {
Door_ResetDoor_exit0_rand_1882317246();
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
fun Timer__Init_exit0_rand_488597656()
{


;


}
fun Timer_Init_entry0_rand_1541726641(Timer_Init_entry0_rand_1541726641__payload_19: any)
{


;


}
fun Timer_Init_exit0_rand_584702949()
{


;


}
fun Timer_TimerStarted_entry245(Timer_TimerStarted_entry245__payload_20: any)
{
var _tmp977: bool;


_tmp977 = $;

if(_tmp977)
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
fun Timer_TimerStarted_exit0_rand_639908389()
{


;


}
fun Timer_SendTimerFired_entry254(Timer_SendTimerFired_entry254__payload_21: any)
{


send Timer_ElevatorV, eTimerFired;

raise eUnit;


}
fun Timer_SendTimerFired_exit0_rand_1530487582()
{


;


}
fun Timer_ConsiderStopping_entry262(Timer_ConsiderStopping_entry262__payload_22: any)
{
var _tmp978: bool;


_tmp978 = $;

if(_tmp978)
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
fun Timer_ConsiderStopping_exit0_rand_717724997()
{


;


}
fun Timer__Init_on_eUnit_goto_Timer_Init0_rand_2102167443(Timer__Init_on_eUnit_goto_Timer_Init0_rand_2102167443__payload_skip: any)
{


;


}
fun Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_2014603987(Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_2014603987__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_521899911(Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_521899911__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_1604238495(Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_1604238495__payload_skip: any)
{


;


}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1342389033(Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1342389033__payload_skip: any)
{


;


}
fun Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_1951978689(Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_1951978689__payload_skip: any)
{


;


}start  state Timer__Init
{entry (payload: machine) {
Timer__Init_entry232(payload);
}
exit  {
Timer__Init_exit0_rand_488597656();
}
}
 state Timer_Init
{entry (payload: any) {
Timer_Init_entry0_rand_1541726641(payload);
}
exit  {
Timer_Init_exit0_rand_584702949();
}
}
 state Timer_TimerStarted
{entry (payload: any) {
Timer_TimerStarted_entry245(payload);
}
exit  {
Timer_TimerStarted_exit0_rand_639908389();
}
}
 state Timer_SendTimerFired
{entry (payload: any) {
Timer_SendTimerFired_entry254(payload);
}
exit  {
Timer_SendTimerFired_exit0_rand_1530487582();
}
}
 state Timer_ConsiderStopping
{entry (payload: any) {
Timer_ConsiderStopping_entry262(payload);
}
exit  {
Timer_ConsiderStopping_exit0_rand_717724997();
}
}
}

