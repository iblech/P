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

fun Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_1905407505()
{


;

}
fun Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_1929530479()
{


;

}
fun Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_350124725()
{


;

}
fun Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_490221743()
{


;

}
fun Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1381149611()
{


;

}
fun Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_490168788()
{


;

}
fun Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_1577042562()
{


;

}
fun Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_338618093()
{


;

}
fun Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_520881997()
{


;

}
fun Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_727914659()
{


;

}
fun Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_217462699()
{


;

}
fun Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_2084004258()
{


;

}
fun Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1613242294()
{


;

}
fun Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1141450455()
{


;

}
fun Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_449106707()
{


;

}
fun Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_1485566875()
{


;

}
fun Elevator_Init_entry26()
{
var Tmp381: machine;
var Tmp382: machine;


Tmp381 = new Timer(this);
Elevator_TimerV = Tmp381;
Tmp382 = new Door(this);
Elevator_DoorV = Tmp382;
raise eUnit;
}
fun Elevator_Init_exit0_rand_281516352()
{


;

}
fun Elevator_DoorClosed_entry38()
{


send Elevator_DoorV, eSendCommandToResetDoor;
}
fun Elevator_DoorClosed_exit0_rand_1969346734()
{


;

}
fun Elevator_DoorOpening_entry49()
{


send Elevator_DoorV, eSendCommandToOpenDoor;
}
fun Elevator_DoorOpening_exit0_rand_2093721442()
{


;

}
fun Elevator_DoorOpened_entry59()
{


send Elevator_DoorV, eSendCommandToResetDoor;
send Elevator_TimerV, eStartDoorCloseTimer;
}
fun Elevator_DoorOpened_exit0_rand_894234556()
{


;

}
fun Elevator_DoorOpenedOkToClose_entry72()
{


send Elevator_TimerV, eStartDoorCloseTimer;
}
fun Elevator_DoorOpenedOkToClose_exit0_rand_268094441()
{


;

}
fun Elevator_DoorClosing_entry83()
{


send Elevator_DoorV, eSendCommandToCloseDoor;
}
fun Elevator_DoorClosing_exit0_rand_951728473()
{


;

}
fun Elevator_StoppingDoor_entry96()
{


send Elevator_DoorV, eSendCommandToStopDoor;
}
fun Elevator_StoppingDoor_exit0_rand_1639064945()
{


;

}
fun Elevator_StoppingTimer_entry108()
{


send Elevator_TimerV, eStopDoorCloseTimer;
}
fun Elevator_StoppingTimer_exit0_rand_1096875177()
{


;

}
fun Elevator_WaitingForTimer_entry0_rand_859491758()
{


;

}
fun Elevator_WaitingForTimer_exit0_rand_362105277()
{


;

}
fun Elevator_ReturnState_entry124()
{


raise eStopTimerReturned;
}
fun Elevator_ReturnState_exit0_rand_1465188038()
{


;

}start 
 state Elevator_Init
{
entry  {
Elevator_Init_entry26();
}
exit  {
Elevator_Init_exit0_rand_281516352();
}
on eUnit goto Elevator_DoorClosed with   {
Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_1905407505();
}
}

 state Elevator_DoorClosed
{
entry  {
Elevator_DoorClosed_entry38();
}
exit  {
Elevator_DoorClosed_exit0_rand_1969346734();
}
ignore eCloseDoor;on eOpenDoor goto Elevator_DoorOpening with   {
Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_1929530479();
}
}

 state Elevator_DoorOpening
{
entry  {
Elevator_DoorOpening_entry49();
}
exit  {
Elevator_DoorOpening_exit0_rand_2093721442();
}
ignore eOpenDoor;
defer eCloseDoor;on eDoorOpened goto Elevator_DoorOpened with   {
Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_350124725();
}
}

 state Elevator_DoorOpened
{
entry  {
Elevator_DoorOpened_entry59();
}
exit  {
Elevator_DoorOpened_exit0_rand_894234556();
}
defer eCloseDoor;on eTimerFired goto Elevator_DoorOpenedOkToClose with   {
Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_490221743();
}

on eStopTimerReturned goto Elevator_DoorOpened with   {
Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_1381149611();
}

on eOpenDoor push Elevator_StoppingTimer;}

 state Elevator_DoorOpenedOkToClose
{
entry  {
Elevator_DoorOpenedOkToClose_entry72();
}
exit  {
Elevator_DoorOpenedOkToClose_exit0_rand_268094441();
}
defer eOpenDoor;on eStopTimerReturned goto Elevator_DoorClosing with   {
Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_490168788();
}

on eTimerFired goto Elevator_DoorClosing with   {
Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_1577042562();
}

on eCloseDoor push Elevator_StoppingTimer;}

 state Elevator_DoorClosing
{
entry  {
Elevator_DoorClosing_entry83();
}
exit  {
Elevator_DoorClosing_exit0_rand_951728473();
}
defer eCloseDoor;on eOpenDoor goto Elevator_StoppingDoor with   {
Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_338618093();
}

on eDoorClosed goto Elevator_DoorClosed with   {
Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_520881997();
}

on eObjectDetected goto Elevator_DoorOpening with   {
Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_727914659();
}
}

 state Elevator_StoppingDoor
{
entry  {
Elevator_StoppingDoor_entry96();
}
exit  {
Elevator_StoppingDoor_exit0_rand_1639064945();
}
defer eCloseDoor;
ignore eOpenDoor;
ignore eObjectDetected;on eDoorOpened goto Elevator_DoorOpened with   {
Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_217462699();
}

on eDoorClosed goto Elevator_DoorClosed with   {
Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_2084004258();
}

on eDoorStopped goto Elevator_DoorOpening with   {
Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_1613242294();
}
}

 state Elevator_StoppingTimer
{
entry  {
Elevator_StoppingTimer_entry108();
}
exit  {
Elevator_StoppingTimer_exit0_rand_1096875177();
}
defer eOpenDoor;
defer eCloseDoor;
defer eObjectDetected;on eOperationSuccess goto Elevator_ReturnState with   {
Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1141450455();
}

on eOperationFailure goto Elevator_WaitingForTimer with   {
Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_449106707();
}
}

 state Elevator_WaitingForTimer
{
entry  {
Elevator_WaitingForTimer_entry0_rand_859491758();
}
exit  {
Elevator_WaitingForTimer_exit0_rand_362105277();
}
defer eOpenDoor;
defer eCloseDoor;
defer eObjectDetected;on eTimerFired goto Elevator_ReturnState with   {
Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_1485566875();
}
}

 state Elevator_ReturnState
{
entry  {
Elevator_ReturnState_entry124();
}
exit  {
Elevator_ReturnState_exit0_rand_1465188038();
}
}
}

main machine User
{
var User_ElevatorV: machine;

fun User_Init_on_eUnit_goto_User_Loop0_rand_1193741498()
{


;

}
fun User_Loop_on_eUnit_goto_User_Loop0_rand_2066286571()
{


;

}
fun User_Init_entry134()
{
var Tmp383: machine;


Tmp383 = new Elevator(null);
User_ElevatorV = Tmp383;
raise eUnit;
}
fun User_Init_exit0_rand_462280823()
{


;

}
fun User_Loop_entry143()
{
var Tmp384: bool;
var Tmp385: bool;


Tmp384 = $;
if(Tmp384)
{

send User_ElevatorV, eOpenDoor;

}
else
{

Tmp385 = $;
if(Tmp385)
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
fun User_Loop_exit0_rand_1869600150()
{


;

}start 
 state User_Init
{
entry  {
User_Init_entry134();
}
exit  {
User_Init_exit0_rand_462280823();
}
on eUnit goto User_Loop with   {
User_Init_on_eUnit_goto_User_Loop0_rand_1193741498();
}
}

 state User_Loop
{
entry  {
User_Loop_entry143();
}
exit  {
User_Loop_exit0_rand_1869600150();
}
on eUnit goto User_Loop with   {
User_Loop_on_eUnit_goto_User_Loop0_rand_2066286571();
}
}
}

model Door
{
var Door_ElevatorV: machine;

fun Door__Init_on_eUnit_goto_Door_Init0_rand_1293039512()
{


;

}
fun Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_2119643544()
{


;

}
fun Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_859919393()
{


;

}
fun Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_1312860679()
{


;

}
fun Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_492502629()
{


;

}
fun Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_1180480007()
{


;

}
fun Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_1789085546()
{


;

}
fun Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_641883995()
{


;

}
fun Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_257427539()
{


;

}
fun Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_846741985()
{


;

}
fun Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_1363311109()
{


;

}
fun Door__Init_entry159(Door__Init_entry159_payload: machine)
{


Door_ElevatorV = Door__Init_entry159_payload;
raise eUnit;
}
fun Door__Init_exit0_rand_2107653256()
{


;

}
fun Door_Init_entry0_rand_347476321()
{


;

}
fun Door_Init_exit0_rand_868397593()
{


;

}
fun Door_OpenDoor_entry173()
{


send Door_ElevatorV, eDoorOpened;
raise eUnit;
}
fun Door_OpenDoor_exit0_rand_1604641778()
{


;

}
fun Door_ConsiderClosingDoor_entry182()
{
var Tmp386: bool;
var Tmp387: bool;


Tmp386 = $;
if(Tmp386)
{

raise eUnit;

}
else
{

Tmp387 = $;
if(Tmp387)
{

raise eObjectEncountered;

}
else
{

;


}


}

}
fun Door_ConsiderClosingDoor_exit0_rand_1463073385()
{


;

}
fun Door_ObjectEncountered_entry196()
{


send Door_ElevatorV, eObjectDetected;
raise eUnit;
}
fun Door_ObjectEncountered_exit0_rand_700007915()
{


;

}
fun Door_CloseDoor_entry205()
{


send Door_ElevatorV, eDoorClosed;
raise eUnit;
}
fun Door_CloseDoor_exit0_rand_286462235()
{


;

}
fun Door_StopDoor_entry213()
{


send Door_ElevatorV, eDoorStopped;
raise eUnit;
}
fun Door_StopDoor_exit0_rand_592546826()
{


;

}
fun Door_ResetDoor_entry0_rand_1437027850()
{


;

}
fun Door_ResetDoor_exit0_rand_1317128365()
{


;

}start 
 state Door__Init
{
entry (payload: machine) {
Door__Init_entry159(payload);
}
exit  {
Door__Init_exit0_rand_2107653256();
}
on eUnit goto Door_Init with   {
Door__Init_on_eUnit_goto_Door_Init0_rand_1293039512();
}
}

 state Door_Init
{
entry  {
Door_Init_entry0_rand_347476321();
}
exit  {
Door_Init_exit0_rand_868397593();
}
ignore eSendCommandToStopDoor;
ignore eSendCommandToResetDoor;
ignore eResetDoor;on eSendCommandToOpenDoor goto Door_OpenDoor with   {
Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_2119643544();
}

on eSendCommandToCloseDoor goto Door_ConsiderClosingDoor with   {
Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_859919393();
}
}

 state Door_OpenDoor
{
entry  {
Door_OpenDoor_entry173();
}
exit  {
Door_OpenDoor_exit0_rand_1604641778();
}
on eUnit goto Door_ResetDoor with   {
Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_1312860679();
}
}

 state Door_ConsiderClosingDoor
{
entry  {
Door_ConsiderClosingDoor_entry182();
}
exit  {
Door_ConsiderClosingDoor_exit0_rand_1463073385();
}
on eUnit goto Door_CloseDoor with   {
Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_492502629();
}

on eObjectEncountered goto Door_ObjectEncountered with   {
Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_1180480007();
}

on eSendCommandToStopDoor goto Door_StopDoor with   {
Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_1789085546();
}
}

 state Door_ObjectEncountered
{
entry  {
Door_ObjectEncountered_entry196();
}
exit  {
Door_ObjectEncountered_exit0_rand_700007915();
}
on eUnit goto Door_Init with   {
Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_641883995();
}
}

 state Door_CloseDoor
{
entry  {
Door_CloseDoor_entry205();
}
exit  {
Door_CloseDoor_exit0_rand_286462235();
}
on eUnit goto Door_ResetDoor with   {
Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_257427539();
}
}

 state Door_StopDoor
{
entry  {
Door_StopDoor_entry213();
}
exit  {
Door_StopDoor_exit0_rand_592546826();
}
on eUnit goto Door_OpenDoor with   {
Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_846741985();
}
}

 state Door_ResetDoor
{
entry  {
Door_ResetDoor_entry0_rand_1437027850();
}
exit  {
Door_ResetDoor_exit0_rand_1317128365();
}
ignore eSendCommandToOpenDoor;
ignore eSendCommandToCloseDoor;
ignore eSendCommandToStopDoor;on eSendCommandToResetDoor goto Door_Init with   {
Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_1363311109();
}
}
}

model Timer
{
var Timer_ElevatorV: machine;

fun Timer__Init_on_eUnit_goto_Timer_Init0_rand_908059045()
{


;

}
fun Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_666828932()
{


;

}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_68620897()
{


;

}
fun Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_1597124313()
{


;

}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1514314902()
{


;

}
fun Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_1449527854()
{


;

}
fun Timer__Init_entry232(Timer__Init_entry232_payload: machine)
{


Timer_ElevatorV = Timer__Init_entry232_payload;
raise eUnit;
}
fun Timer__Init_exit0_rand_848619844()
{


;

}
fun Timer_Init_entry0_rand_739265616()
{


;

}
fun Timer_Init_exit0_rand_232741249()
{


;

}
fun Timer_TimerStarted_entry245()
{
var Tmp388: bool;


Tmp388 = $;
if(Tmp388)
{

raise eUnit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_730300577()
{


;

}
fun Timer_SendTimerFired_entry254()
{


send Timer_ElevatorV, eTimerFired;
raise eUnit;
}
fun Timer_SendTimerFired_exit0_rand_1122790631()
{


;

}
fun Timer_ConsiderStopping_entry262()
{
var Tmp389: bool;


Tmp389 = $;
if(Tmp389)
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
fun Timer_ConsiderStopping_exit0_rand_1760306599()
{


;

}start 
 state Timer__Init
{
entry (payload: machine) {
Timer__Init_entry232(payload);
}
exit  {
Timer__Init_exit0_rand_848619844();
}
on eUnit goto Timer_Init with   {
Timer__Init_on_eUnit_goto_Timer_Init0_rand_908059045();
}
}

 state Timer_Init
{
entry  {
Timer_Init_entry0_rand_739265616();
}
exit  {
Timer_Init_exit0_rand_232741249();
}
ignore eStopDoorCloseTimer;on eStartDoorCloseTimer goto Timer_TimerStarted with   {
Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_666828932();
}
}

 state Timer_TimerStarted
{
entry  {
Timer_TimerStarted_entry245();
}
exit  {
Timer_TimerStarted_exit0_rand_730300577();
}
defer eStartDoorCloseTimer;on eUnit goto Timer_SendTimerFired with   {
Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_68620897();
}

on eStopDoorCloseTimer goto Timer_ConsiderStopping with   {
Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_1597124313();
}
}

 state Timer_SendTimerFired
{
entry  {
Timer_SendTimerFired_entry254();
}
exit  {
Timer_SendTimerFired_exit0_rand_1122790631();
}
defer eStartDoorCloseTimer;on eUnit goto Timer_Init with   {
Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_1514314902();
}
}

 state Timer_ConsiderStopping
{
entry  {
Timer_ConsiderStopping_entry262();
}
exit  {
Timer_ConsiderStopping_exit0_rand_1760306599();
}
defer eStartDoorCloseTimer;on eUnit goto Timer_Init with   {
Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_1449527854();
}
}
}

