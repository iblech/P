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

fun Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_733545213(Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_733545213__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_2098651197(Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_2098651197__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_35935457(Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_35935457__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_2146993886(Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_2146993886__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_2128369596(Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_2128369596__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_2020241834(Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_2020241834__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_700227056(Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_700227056__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_1482936651(Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_1482936651__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1728066009(Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1728066009__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_1772581962(Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_1772581962__payload_skip: any)
{


;

;

return;
}
fun Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1175833836(Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1175833836__payload_skip: any)
{


;

;

return;
}
fun Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1652905524(Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1652905524__payload_skip: any)
{


;

;

return;
}
fun Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_2057400167(Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_2057400167__payload_skip: any)
{


;

;

return;
}
fun Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1733840411(Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1733840411__payload_skip: any)
{


;

;

return;
}
fun Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_603591710(Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_603591710__payload_skip: any)
{


;

;

return;
}
fun Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_248601281(Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_248601281__payload_skip: any)
{


;

;

return;
}
fun Elevator_Init_entry26(Elevator_Init_entry26__payload_0: null)
{
var Tmp426: machine;
var Tmp427: machine;


;

Tmp426 = new Timer(this);
Elevator_TimerV = Tmp426;
;

Tmp427 = new Door(this);
Elevator_DoorV = Tmp427;
;

raise eUnit;
return;
}
fun Elevator_Init_exit0_rand_1431085493(Elevator_Init_exit0_rand_1431085493__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorClosed_entry38(Elevator_DoorClosed_entry38__payload_1: null)
{


;

send Elevator_DoorV, eSendCommandToResetDoor;
return;
}
fun Elevator_DoorClosed_exit0_rand_1446431095(Elevator_DoorClosed_exit0_rand_1446431095__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpening_entry49(Elevator_DoorOpening_entry49__payload_2: null)
{


;

send Elevator_DoorV, eSendCommandToOpenDoor;
return;
}
fun Elevator_DoorOpening_exit0_rand_2132586747(Elevator_DoorOpening_exit0_rand_2132586747__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpened_entry59(Elevator_DoorOpened_entry59__payload_3: null)
{


;

send Elevator_DoorV, eSendCommandToResetDoor;
;

send Elevator_TimerV, eStartDoorCloseTimer;
return;
}
fun Elevator_DoorOpened_exit0_rand_2110852319(Elevator_DoorOpened_exit0_rand_2110852319__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorOpenedOkToClose_entry72(Elevator_DoorOpenedOkToClose_entry72__payload_4: null)
{


;

send Elevator_TimerV, eStartDoorCloseTimer;
return;
}
fun Elevator_DoorOpenedOkToClose_exit0_rand_873325749(Elevator_DoorOpenedOkToClose_exit0_rand_873325749__payload_skip: any)
{


;

;

return;
}
fun Elevator_DoorClosing_entry83(Elevator_DoorClosing_entry83__payload_5: null)
{


;

send Elevator_DoorV, eSendCommandToCloseDoor;
return;
}
fun Elevator_DoorClosing_exit0_rand_531065126(Elevator_DoorClosing_exit0_rand_531065126__payload_skip: any)
{


;

;

return;
}
fun Elevator_StoppingDoor_entry96(Elevator_StoppingDoor_entry96__payload_6: null)
{


;

send Elevator_DoorV, eSendCommandToStopDoor;
return;
}
fun Elevator_StoppingDoor_exit0_rand_942573762(Elevator_StoppingDoor_exit0_rand_942573762__payload_skip: any)
{


;

;

return;
}
fun Elevator_StoppingTimer_entry108(Elevator_StoppingTimer_entry108__payload_7: null)
{


;

send Elevator_TimerV, eStopDoorCloseTimer;
return;
}
fun Elevator_StoppingTimer_exit0_rand_1707763277(Elevator_StoppingTimer_exit0_rand_1707763277__payload_skip: any)
{


;

;

return;
}
fun Elevator_WaitingForTimer_entry0_rand_166492838(Elevator_WaitingForTimer_entry0_rand_166492838__payload_8: null)
{


;

;

return;
}
fun Elevator_WaitingForTimer_exit0_rand_421952062(Elevator_WaitingForTimer_exit0_rand_421952062__payload_skip: any)
{


;

;

return;
}
fun Elevator_ReturnState_entry124(Elevator_ReturnState_entry124__payload_9: null)
{


;

raise eStopTimerReturned;
return;
}
fun Elevator_ReturnState_exit0_rand_790796630(Elevator_ReturnState_exit0_rand_790796630__payload_skip: any)
{


;

;

return;
}start 
 state Elevator_Init
{
entry (payload: null) {
Elevator_Init_entry26(payload);
}exit {
Elevator_Init_exit0_rand_1431085493(null);
}on eUnit goto Elevator_DoorClosed with (payload: null) {
Elevator_Init_on_eUnit_goto_Elevator_DoorClosed0_rand_733545213(payload);
}}

 state Elevator_DoorClosed
{
entry (payload: null) {
Elevator_DoorClosed_entry38(payload);
}exit {
Elevator_DoorClosed_exit0_rand_1446431095(null);
}ignore eCloseDoor;on eOpenDoor goto Elevator_DoorOpening with (payload: null) {
Elevator_DoorClosed_on_eOpenDoor_goto_Elevator_DoorOpening0_rand_2098651197(payload);
}}

 state Elevator_DoorOpening
{
entry (payload: null) {
Elevator_DoorOpening_entry49(payload);
}exit {
Elevator_DoorOpening_exit0_rand_2132586747(null);
}ignore eOpenDoor;
defer eCloseDoor;on eDoorOpened goto Elevator_DoorOpened with (payload: null) {
Elevator_DoorOpening_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_35935457(payload);
}}

 state Elevator_DoorOpened
{
entry (payload: null) {
Elevator_DoorOpened_entry59(payload);
}exit {
Elevator_DoorOpened_exit0_rand_2110852319(null);
}defer eCloseDoor;on eTimerFired goto Elevator_DoorOpenedOkToClose with (payload: null) {
Elevator_DoorOpened_on_eTimerFired_goto_Elevator_DoorOpenedOkToClose0_rand_2146993886(payload);
}
on eStopTimerReturned goto Elevator_DoorOpened with (payload: null) {
Elevator_DoorOpened_on_eStopTimerReturned_goto_Elevator_DoorOpened0_rand_2128369596(payload);
}
on eOpenDoor push Elevator_StoppingTimer;}

 state Elevator_DoorOpenedOkToClose
{
entry (payload: null) {
Elevator_DoorOpenedOkToClose_entry72(payload);
}exit {
Elevator_DoorOpenedOkToClose_exit0_rand_873325749(null);
}defer eOpenDoor;on eStopTimerReturned goto Elevator_DoorClosing with (payload: null) {
Elevator_DoorOpenedOkToClose_on_eStopTimerReturned_goto_Elevator_DoorClosing0_rand_2020241834(payload);
}
on eTimerFired goto Elevator_DoorClosing with (payload: null) {
Elevator_DoorOpenedOkToClose_on_eTimerFired_goto_Elevator_DoorClosing0_rand_700227056(payload);
}
on eCloseDoor push Elevator_StoppingTimer;}

 state Elevator_DoorClosing
{
entry (payload: null) {
Elevator_DoorClosing_entry83(payload);
}exit {
Elevator_DoorClosing_exit0_rand_531065126(null);
}defer eCloseDoor;on eOpenDoor goto Elevator_StoppingDoor with (payload: null) {
Elevator_DoorClosing_on_eOpenDoor_goto_Elevator_StoppingDoor0_rand_1482936651(payload);
}
on eDoorClosed goto Elevator_DoorClosed with (payload: null) {
Elevator_DoorClosing_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1728066009(payload);
}
on eObjectDetected goto Elevator_DoorOpening with (payload: null) {
Elevator_DoorClosing_on_eObjectDetected_goto_Elevator_DoorOpening0_rand_1772581962(payload);
}}

 state Elevator_StoppingDoor
{
entry (payload: null) {
Elevator_StoppingDoor_entry96(payload);
}exit {
Elevator_StoppingDoor_exit0_rand_942573762(null);
}defer eCloseDoor;
ignore eOpenDoor;
ignore eObjectDetected;on eDoorOpened goto Elevator_DoorOpened with (payload: null) {
Elevator_StoppingDoor_on_eDoorOpened_goto_Elevator_DoorOpened0_rand_1175833836(payload);
}
on eDoorClosed goto Elevator_DoorClosed with (payload: null) {
Elevator_StoppingDoor_on_eDoorClosed_goto_Elevator_DoorClosed0_rand_1652905524(payload);
}
on eDoorStopped goto Elevator_DoorOpening with (payload: null) {
Elevator_StoppingDoor_on_eDoorStopped_goto_Elevator_DoorOpening0_rand_2057400167(payload);
}}

 state Elevator_StoppingTimer
{
entry (payload: null) {
Elevator_StoppingTimer_entry108(payload);
}exit {
Elevator_StoppingTimer_exit0_rand_1707763277(null);
}defer eOpenDoor;
defer eCloseDoor;
defer eObjectDetected;on eOperationSuccess goto Elevator_ReturnState with (payload: null) {
Elevator_StoppingTimer_on_eOperationSuccess_goto_Elevator_ReturnState0_rand_1733840411(payload);
}
on eOperationFailure goto Elevator_WaitingForTimer with (payload: null) {
Elevator_StoppingTimer_on_eOperationFailure_goto_Elevator_WaitingForTimer0_rand_603591710(payload);
}}

 state Elevator_WaitingForTimer
{
entry (payload: null) {
Elevator_WaitingForTimer_entry0_rand_166492838(payload);
}exit {
Elevator_WaitingForTimer_exit0_rand_421952062(null);
}defer eOpenDoor;
defer eCloseDoor;
defer eObjectDetected;on eTimerFired goto Elevator_ReturnState with (payload: null) {
Elevator_WaitingForTimer_on_eTimerFired_goto_Elevator_ReturnState0_rand_248601281(payload);
}}

 state Elevator_ReturnState
{
entry (payload: null) {
Elevator_ReturnState_entry124(payload);
}exit {
Elevator_ReturnState_exit0_rand_790796630(null);
}}
}

main machine User
{
var User_ElevatorV: machine;

fun User_Init_on_eUnit_goto_User_Loop0_rand_717919114(User_Init_on_eUnit_goto_User_Loop0_rand_717919114__payload_skip: any)
{


;

;

return;
}
fun User_Loop_on_eUnit_goto_User_Loop0_rand_1295332562(User_Loop_on_eUnit_goto_User_Loop0_rand_1295332562__payload_skip: any)
{


;

;

return;
}
fun User_Init_entry134(User_Init_entry134__payload_10: null)
{
var Tmp428: machine;


;

Tmp428 = new Elevator(null);
User_ElevatorV = Tmp428;
;

raise eUnit;
return;
}
fun User_Init_exit0_rand_766951387(User_Init_exit0_rand_766951387__payload_skip: any)
{


;

;

return;
}
fun User_Loop_entry143(User_Loop_entry143__payload_11: null)
{
var Tmp429: bool;
var Tmp430: bool;


;

Tmp429 = $;
if(Tmp429)
{

;

send User_ElevatorV, eOpenDoor;

}
else
{

;

Tmp430 = $;
if(Tmp430)
{

;

send User_ElevatorV, eCloseDoor;

}
else
{

;

;


}


}

;

raise eUnit;
return;
}
fun User_Loop_exit0_rand_1855994131(User_Loop_exit0_rand_1855994131__payload_skip: any)
{


;

;

return;
}start 
 state User_Init
{
entry (payload: null) {
User_Init_entry134(payload);
}exit {
User_Init_exit0_rand_766951387(null);
}on eUnit goto User_Loop with (payload: null) {
User_Init_on_eUnit_goto_User_Loop0_rand_717919114(payload);
}}

 state User_Loop
{
entry (payload: null) {
User_Loop_entry143(payload);
}exit {
User_Loop_exit0_rand_1855994131(null);
}on eUnit goto User_Loop with (payload: null) {
User_Loop_on_eUnit_goto_User_Loop0_rand_1295332562(payload);
}}
}

machine Door
{
var Door_ElevatorV: machine;

fun Door__Init_on_eUnit_goto_Door_Init0_rand_1342993158(Door__Init_on_eUnit_goto_Door_Init0_rand_1342993158__payload_skip: any)
{


;

;

return;
}
fun Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_482296708(Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_482296708__payload_skip: any)
{


;

;

return;
}
fun Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_1205746388(Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_1205746388__payload_skip: any)
{


;

;

return;
}
fun Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_24875049(Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_24875049__payload_skip: any)
{


;

;

return;
}
fun Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_313413669(Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_313413669__payload_skip: any)
{


;

;

return;
}
fun Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_2139825678(Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_2139825678__payload_skip: any)
{


;

;

return;
}
fun Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_3354842(Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_3354842__payload_skip: any)
{


;

;

return;
}
fun Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_1388439981(Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_1388439981__payload_skip: any)
{


;

;

return;
}
fun Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_607052288(Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_607052288__payload_skip: any)
{


;

;

return;
}
fun Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_385808031(Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_385808031__payload_skip: any)
{


;

;

return;
}
fun Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_632627286(Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_632627286__payload_skip: any)
{


;

;

return;
}
fun Door__Init_entry159(Door__Init_entry159_payload: machine)
{


;

Door_ElevatorV = Door__Init_entry159_payload;
;

raise eUnit;
return;
}
fun Door__Init_exit0_rand_1096161103(Door__Init_exit0_rand_1096161103__payload_skip: any)
{


;

;

return;
}
fun Door_Init_entry0_rand_347051750(Door_Init_entry0_rand_347051750__payload_12: null)
{


;

;

return;
}
fun Door_Init_exit0_rand_1531774320(Door_Init_exit0_rand_1531774320__payload_skip: any)
{


;

;

return;
}
fun Door_OpenDoor_entry173(Door_OpenDoor_entry173__payload_13: null)
{


;

send Door_ElevatorV, eDoorOpened;
;

raise eUnit;
return;
}
fun Door_OpenDoor_exit0_rand_1867617755(Door_OpenDoor_exit0_rand_1867617755__payload_skip: any)
{


;

;

return;
}
fun Door_ConsiderClosingDoor_entry182(Door_ConsiderClosingDoor_entry182__payload_14: null)
{
var Tmp431: bool;
var Tmp432: bool;


;

Tmp431 = $;
if(Tmp431)
{

;

raise eUnit;

}
else
{

;

Tmp432 = $;
if(Tmp432)
{

;

raise eObjectEncountered;

}
else
{

;

;


}


}

return;
}
fun Door_ConsiderClosingDoor_exit0_rand_1658757274(Door_ConsiderClosingDoor_exit0_rand_1658757274__payload_skip: any)
{


;

;

return;
}
fun Door_ObjectEncountered_entry196(Door_ObjectEncountered_entry196__payload_15: null)
{


;

send Door_ElevatorV, eObjectDetected;
;

raise eUnit;
return;
}
fun Door_ObjectEncountered_exit0_rand_758413759(Door_ObjectEncountered_exit0_rand_758413759__payload_skip: any)
{


;

;

return;
}
fun Door_CloseDoor_entry205(Door_CloseDoor_entry205__payload_16: null)
{


;

send Door_ElevatorV, eDoorClosed;
;

raise eUnit;
return;
}
fun Door_CloseDoor_exit0_rand_618473919(Door_CloseDoor_exit0_rand_618473919__payload_skip: any)
{


;

;

return;
}
fun Door_StopDoor_entry213(Door_StopDoor_entry213__payload_17: null)
{


;

send Door_ElevatorV, eDoorStopped;
;

raise eUnit;
return;
}
fun Door_StopDoor_exit0_rand_708670164(Door_StopDoor_exit0_rand_708670164__payload_skip: any)
{


;

;

return;
}
fun Door_ResetDoor_entry0_rand_1785237528(Door_ResetDoor_entry0_rand_1785237528__payload_18: null)
{


;

;

return;
}
fun Door_ResetDoor_exit0_rand_43593426(Door_ResetDoor_exit0_rand_43593426__payload_skip: any)
{


;

;

return;
}start 
 state Door__Init
{
entry (payload: machine) {
Door__Init_entry159(payload);
}exit {
Door__Init_exit0_rand_1096161103(null);
}on eUnit goto Door_Init with (payload: null) {
Door__Init_on_eUnit_goto_Door_Init0_rand_1342993158(payload);
}}

 state Door_Init
{
entry (payload: null) {
Door_Init_entry0_rand_347051750(payload);
}exit {
Door_Init_exit0_rand_1531774320(null);
}ignore eSendCommandToStopDoor;
ignore eSendCommandToResetDoor;
ignore eResetDoor;on eSendCommandToOpenDoor goto Door_OpenDoor with (payload: null) {
Door_Init_on_eSendCommandToOpenDoor_goto_Door_OpenDoor0_rand_482296708(payload);
}
on eSendCommandToCloseDoor goto Door_ConsiderClosingDoor with (payload: null) {
Door_Init_on_eSendCommandToCloseDoor_goto_Door_ConsiderClosingDoor0_rand_1205746388(payload);
}}

 state Door_OpenDoor
{
entry (payload: null) {
Door_OpenDoor_entry173(payload);
}exit {
Door_OpenDoor_exit0_rand_1867617755(null);
}on eUnit goto Door_ResetDoor with (payload: null) {
Door_OpenDoor_on_eUnit_goto_Door_ResetDoor0_rand_24875049(payload);
}}

 state Door_ConsiderClosingDoor
{
entry (payload: null) {
Door_ConsiderClosingDoor_entry182(payload);
}exit {
Door_ConsiderClosingDoor_exit0_rand_1658757274(null);
}on eUnit goto Door_CloseDoor with (payload: null) {
Door_ConsiderClosingDoor_on_eUnit_goto_Door_CloseDoor0_rand_313413669(payload);
}
on eObjectEncountered goto Door_ObjectEncountered with (payload: null) {
Door_ConsiderClosingDoor_on_eObjectEncountered_goto_Door_ObjectEncountered0_rand_2139825678(payload);
}
on eSendCommandToStopDoor goto Door_StopDoor with (payload: null) {
Door_ConsiderClosingDoor_on_eSendCommandToStopDoor_goto_Door_StopDoor0_rand_3354842(payload);
}}

 state Door_ObjectEncountered
{
entry (payload: null) {
Door_ObjectEncountered_entry196(payload);
}exit {
Door_ObjectEncountered_exit0_rand_758413759(null);
}on eUnit goto Door_Init with (payload: null) {
Door_ObjectEncountered_on_eUnit_goto_Door_Init0_rand_1388439981(payload);
}}

 state Door_CloseDoor
{
entry (payload: null) {
Door_CloseDoor_entry205(payload);
}exit {
Door_CloseDoor_exit0_rand_618473919(null);
}on eUnit goto Door_ResetDoor with (payload: null) {
Door_CloseDoor_on_eUnit_goto_Door_ResetDoor0_rand_607052288(payload);
}}

 state Door_StopDoor
{
entry (payload: null) {
Door_StopDoor_entry213(payload);
}exit {
Door_StopDoor_exit0_rand_708670164(null);
}on eUnit goto Door_OpenDoor with (payload: null) {
Door_StopDoor_on_eUnit_goto_Door_OpenDoor0_rand_385808031(payload);
}}

 state Door_ResetDoor
{
entry (payload: null) {
Door_ResetDoor_entry0_rand_1785237528(payload);
}exit {
Door_ResetDoor_exit0_rand_43593426(null);
}ignore eSendCommandToOpenDoor;
ignore eSendCommandToCloseDoor;
ignore eSendCommandToStopDoor;on eSendCommandToResetDoor goto Door_Init with (payload: null) {
Door_ResetDoor_on_eSendCommandToResetDoor_goto_Door_Init0_rand_632627286(payload);
}}
}

machine Timer
{
var Timer_ElevatorV: machine;

fun Timer__Init_on_eUnit_goto_Timer_Init0_rand_422074687(Timer__Init_on_eUnit_goto_Timer_Init0_rand_422074687__payload_skip: any)
{


;

;

return;
}
fun Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_661494846(Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_661494846__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1955049157(Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1955049157__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_186294362(Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_186294362__payload_skip: any)
{


;

;

return;
}
fun Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_879443399(Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_879443399__payload_skip: any)
{


;

;

return;
}
fun Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_708051080(Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_708051080__payload_skip: any)
{


;

;

return;
}
fun Timer__Init_entry232(Timer__Init_entry232_payload: machine)
{


;

Timer_ElevatorV = Timer__Init_entry232_payload;
;

raise eUnit;
return;
}
fun Timer__Init_exit0_rand_2143639044(Timer__Init_exit0_rand_2143639044__payload_skip: any)
{


;

;

return;
}
fun Timer_Init_entry0_rand_739929615(Timer_Init_entry0_rand_739929615__payload_19: null)
{


;

;

return;
}
fun Timer_Init_exit0_rand_1413189546(Timer_Init_exit0_rand_1413189546__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_entry245(Timer_TimerStarted_entry245__payload_20: null)
{
var Tmp433: bool;


;

Tmp433 = $;
if(Tmp433)
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
fun Timer_TimerStarted_exit0_rand_314419025(Timer_TimerStarted_exit0_rand_314419025__payload_skip: any)
{


;

;

return;
}
fun Timer_SendTimerFired_entry254(Timer_SendTimerFired_entry254__payload_21: null)
{


;

send Timer_ElevatorV, eTimerFired;
;

raise eUnit;
return;
}
fun Timer_SendTimerFired_exit0_rand_850309365(Timer_SendTimerFired_exit0_rand_850309365__payload_skip: any)
{


;

;

return;
}
fun Timer_ConsiderStopping_entry262(Timer_ConsiderStopping_entry262__payload_22: null)
{
var Tmp434: bool;


;

Tmp434 = $;
if(Tmp434)
{

;

send Timer_ElevatorV, eOperationFailure;
;

send Timer_ElevatorV, eTimerFired;

}
else
{

;

send Timer_ElevatorV, eOperationSuccess;

}

;

raise eUnit;
return;
}
fun Timer_ConsiderStopping_exit0_rand_1305991322(Timer_ConsiderStopping_exit0_rand_1305991322__payload_skip: any)
{


;

;

return;
}start 
 state Timer__Init
{
entry (payload: machine) {
Timer__Init_entry232(payload);
}exit {
Timer__Init_exit0_rand_2143639044(null);
}on eUnit goto Timer_Init with (payload: null) {
Timer__Init_on_eUnit_goto_Timer_Init0_rand_422074687(payload);
}}

 state Timer_Init
{
entry (payload: null) {
Timer_Init_entry0_rand_739929615(payload);
}exit {
Timer_Init_exit0_rand_1413189546(null);
}ignore eStopDoorCloseTimer;on eStartDoorCloseTimer goto Timer_TimerStarted with (payload: null) {
Timer_Init_on_eStartDoorCloseTimer_goto_Timer_TimerStarted0_rand_661494846(payload);
}}

 state Timer_TimerStarted
{
entry (payload: null) {
Timer_TimerStarted_entry245(payload);
}exit {
Timer_TimerStarted_exit0_rand_314419025(null);
}defer eStartDoorCloseTimer;on eUnit goto Timer_SendTimerFired with (payload: null) {
Timer_TimerStarted_on_eUnit_goto_Timer_SendTimerFired0_rand_1955049157(payload);
}
on eStopDoorCloseTimer goto Timer_ConsiderStopping with (payload: null) {
Timer_TimerStarted_on_eStopDoorCloseTimer_goto_Timer_ConsiderStopping0_rand_186294362(payload);
}}

 state Timer_SendTimerFired
{
entry (payload: null) {
Timer_SendTimerFired_entry254(payload);
}exit {
Timer_SendTimerFired_exit0_rand_850309365(null);
}defer eStartDoorCloseTimer;on eUnit goto Timer_Init with (payload: null) {
Timer_SendTimerFired_on_eUnit_goto_Timer_Init0_rand_879443399(payload);
}}

 state Timer_ConsiderStopping
{
entry (payload: null) {
Timer_ConsiderStopping_entry262(payload);
}exit {
Timer_ConsiderStopping_exit0_rand_1305991322(null);
}defer eStartDoorCloseTimer;on eUnit goto Timer_Init with (payload: null) {
Timer_ConsiderStopping_on_eUnit_goto_Timer_Init0_rand_708051080(payload);
}}
}

