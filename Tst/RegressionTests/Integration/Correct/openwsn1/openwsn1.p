event newSlot  assert 1: (bool, (machine, machine));
event endSlot;
event Local;
event TxDone;
event Tx;
event Rx;
event Sleep;
event Data  assert 4: (machine, int);
event Ack  assert 1: (machine, int);
event Initialize  assert 1: (machine, seq[machine]);

main machine GodMachine
{
var GodMachine_N1: machine;
var GodMachine_N2: machine;
var GodMachine_N3: machine;
var GodMachine_N4: machine;
var GodMachine_templ: seq[machine];
var GodMachine_slotT: machine;

fun GodMachine_init_entry49()
{
var _tmp536: machine;
var _tmp537: machine;
var _tmp538: machine;
var _tmp539: machine;
var _tmp540: machine;
var _tmp541: bool;
var _tmp542: (machine, seq[machine]);
var _tmp543: bool;
var _tmp544: (machine, seq[machine]);
var _tmp545: bool;
var _tmp546: (machine, seq[machine]);
var _tmp547: bool;
var _tmp548: (machine, seq[machine]);
var _tmp549: bool;


_tmp536 = new OpenWSN_Mote(0);
GodMachine_N1 = _tmp536;
_tmp537 = new OpenWSN_Mote(1);
GodMachine_N2 = _tmp537;
_tmp538 = new OpenWSN_Mote(2);
GodMachine_N3 = _tmp538;
_tmp539 = new OpenWSN_Mote(1);
GodMachine_N4 = _tmp539;
GodMachine_templ += (0, GodMachine_N1);
GodMachine_templ += (0, GodMachine_N2);
GodMachine_templ += (0, GodMachine_N3);
GodMachine_templ += (0, GodMachine_N4);
_tmp540 = new SlotTimerMachine(GodMachine_templ);
GodMachine_slotT = _tmp540;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
_tmp541 = (sizeof(GodMachine_templ) == 0);
assert _tmp541;
GodMachine_templ += (0, GodMachine_N2);
_tmp542 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N1, Initialize, _tmp542;
GodMachine_templ -= 0;
_tmp543 = (sizeof(GodMachine_templ) == 0);
assert _tmp543;
GodMachine_templ += (0, GodMachine_N1);
GodMachine_templ += (0, GodMachine_N3);
GodMachine_templ += (0, GodMachine_N4);
_tmp544 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N2, Initialize, _tmp544;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
_tmp545 = (sizeof(GodMachine_templ) == 0);
assert _tmp545;
GodMachine_templ += (0, GodMachine_N2);
GodMachine_templ += (0, GodMachine_N4);
_tmp546 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N3, Initialize, _tmp546;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
_tmp547 = (sizeof(GodMachine_templ) == 0);
assert _tmp547;
GodMachine_templ += (0, GodMachine_N2);
GodMachine_templ += (0, GodMachine_N3);
_tmp548 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N4, Initialize, _tmp548;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
_tmp549 = (sizeof(GodMachine_templ) == 0);
assert _tmp549;
}
fun GodMachine_init_exit0_rand_183258292()
{


;

}start  state GodMachine_init
{entry  {
GodMachine_init_entry49();
}
exit  {
GodMachine_init_exit0_rand_183258292();
}
}
}

machine OpenWSN_Mote
{
var OpenWSN_Mote_myRank: int;
var OpenWSN_Mote_temp: int;
var OpenWSN_Mote_check: bool;
var OpenWSN_Mote_myNeighbours: seq[machine];
var OpenWSN_Mote_myTimeParent: (machine, int);
var OpenWSN_Mote_lastSynched: int;
var OpenWSN_Mote_currentSlot: (bool, (machine, machine));
var OpenWSN_Mote_slotTimer: machine;
var OpenWSN_Mote_i: int;

fun OpenWSN_Mote_CheckOperationTobePerfomed(OpenWSN_Mote_CheckOperationTobePerfomed_currentSlot: (bool, (machine, machine)))
{
var _tmp550: bool;
var _tmp551: bool;
var _tmp552: bool;
var _tmp553: bool;


_tmp550 = (OpenWSN_Mote_myRank == 0);
if(!(_tmp550))
{

OpenWSN_Mote_lastSynched = (OpenWSN_Mote_lastSynched + 1);

}
else
{

;


}

OpenWSN_Mote_temp = OpenWSN_Mote_OperationTxorRxorSleep();
_tmp551 = (OpenWSN_Mote_temp == 0);
if(_tmp551)
{

raise Tx;

}
else
{

;


}

_tmp552 = (OpenWSN_Mote_temp == 1);
if(_tmp552)
{

raise Rx;

}
else
{

;


}

_tmp553 = (OpenWSN_Mote_temp == 2);
if(_tmp553)
{

raise Sleep;

}
else
{

;


}

}
model fun OpenWSN_Mote_OperationTxorRxorSleep(): int
{
var _tmp554: bool;
var _tmp555: bool;


_tmp554 = $;
if(_tmp554)
{

return (0);

}
else
{

_tmp555 = $;
if(_tmp555)
{

return (1);

}
else
{

return (2);

}


}

}
model fun OpenWSN_Mote_TransmitData(OpenWSN_Mote_TransmitData_target: machine)
{
var _tmp556: bool;
var _tmp557: bool;
var _tmp558: machine;
var _tmp559: (machine, int);
var _tmp560: (machine, int);


_tmp556 = (OpenWSN_Mote_TransmitData_target == null);
if(_tmp556)
{

OpenWSN_Mote_i = (sizeof(OpenWSN_Mote_myNeighbours) - 1);
while((OpenWSN_Mote_i >= 0))
{

_tmp557 = $;
if(_tmp557)
{

_tmp558 = OpenWSN_Mote_myNeighbours[OpenWSN_Mote_i];
_tmp559 = (this, OpenWSN_Mote_myRank);
send _tmp558, Data, _tmp559;
return;

}
else
{

OpenWSN_Mote_i = (OpenWSN_Mote_i - 1);

}


}


}
else
{

_tmp560 = (this, OpenWSN_Mote_myRank);
send OpenWSN_Mote_TransmitData_target, Data, _tmp560;

}

}
model fun OpenWSN_Mote_CSMA_CA(): bool
{
var _tmp561: bool;


_tmp561 = $;
if(_tmp561)
{

return (true);

}
else
{

return (false);

}

}
fun OpenWSN_Mote_WaitForNewSlot_do_newSlot136(OpenWSN_Mote_WaitForNewSlot_do_newSlot136_payload: (bool, (machine, machine)))
{


OpenWSN_Mote_CheckOperationTobePerfomed(OpenWSN_Mote_WaitForNewSlot_do_newSlot136_payload);
}
fun OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105(OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload: (machine, seq[machine]))
{


OpenWSN_Mote_slotTimer = OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload.0;
OpenWSN_Mote_myNeighbours = OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload.1;
}
fun OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_1605216559()
{


;

}
fun OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_2058466020()
{


;

}
fun OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot141()
{


send OpenWSN_Mote_slotTimer, endSlot;
}
fun OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot208()
{


send OpenWSN_Mote_slotTimer, endSlot;
}
fun OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_1328445123()
{


;

}
fun OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221(OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload: (machine, int))
{
var _tmp562: bool;


if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload.1))
{

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload;

}
else
{

;


}

_tmp562 = (OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload.0 == OpenWSN_Mote_myTimeParent.0);
if(_tmp562)
{

OpenWSN_Mote_lastSynched = 0;

}
else
{

;


}

send OpenWSN_Mote_slotTimer, endSlot;
}
fun OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot231()
{


send OpenWSN_Mote_slotTimer, endSlot;
}
fun OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242(OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload: (machine, int))
{
var _tmp563: bool;
var _tmp564: (machine, int);


if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.1))
{

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload;

}
else
{

;


}

_tmp563 = (OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.0 == OpenWSN_Mote_myTimeParent.0);
if(_tmp563)
{

OpenWSN_Mote_lastSynched = 0;

}
else
{

;


}

_tmp564 = (this, OpenWSN_Mote_myRank);
send OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.0, Ack, _tmp564;
send OpenWSN_Mote_slotTimer, endSlot;
}
fun OpenWSN_Mote_init_mote_entry98(OpenWSN_Mote_init_mote_entry98_payload: int)
{
var _tmp565: (null, int);


OpenWSN_Mote_myRank = OpenWSN_Mote_init_mote_entry98_payload;
_tmp565 = (null, 10000);
OpenWSN_Mote_myTimeParent = _tmp565;
OpenWSN_Mote_lastSynched = 0;
}
fun OpenWSN_Mote_init_mote_exit0_rand_1662370261()
{


;

}
fun OpenWSN_Mote_WaitForNewSlot_entry0_rand_177867054()
{


;

}
fun OpenWSN_Mote_WaitForNewSlot_exit0_rand_1332731301()
{


;

}
fun OpenWSN_Mote_DataTransmissionMode_entry178()
{
var _tmp566: bool;


if(!(OpenWSN_Mote_currentSlot.0))
{

_tmp566 = (OpenWSN_Mote_currentSlot.1.0 == this);
if(_tmp566)
{

OpenWSN_Mote_TransmitData(OpenWSN_Mote_currentSlot.1.1);
raise TxDone;

}
else
{

raise Local;

}


}
else
{

OpenWSN_Mote_check = OpenWSN_Mote_CSMA_CA();
if(OpenWSN_Mote_check)
{

OpenWSN_Mote_TransmitData(null);
raise TxDone;

}
else
{

raise Local;

}


}

}
fun OpenWSN_Mote_DataTransmissionMode_exit0_rand_1381930122()
{


;

}
fun OpenWSN_Mote_WaitForAck_entry0_rand_1694517094()
{


;

}
fun OpenWSN_Mote_WaitForAck_exit0_rand_1411453627()
{


;

}
fun OpenWSN_Mote_DataReceptionMode_entry0_rand_1149958194()
{


;

}
fun OpenWSN_Mote_DataReceptionMode_exit0_rand_585859198()
{


;

}start  state OpenWSN_Mote_init_mote
{entry (payload: int) {
OpenWSN_Mote_init_mote_entry98(payload);
}
exit  {
OpenWSN_Mote_init_mote_exit0_rand_1662370261();
}
defer newSlot;
ignore Data;on Initialize goto OpenWSN_Mote_WaitForNewSlot with  (payload: (machine, seq[machine])) {
OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105(payload);
}
}
 state OpenWSN_Mote_WaitForNewSlot
{entry  {
OpenWSN_Mote_WaitForNewSlot_entry0_rand_177867054();
}
exit  {
OpenWSN_Mote_WaitForNewSlot_exit0_rand_1332731301();
}
ignore Data;
ignore Ack;
on newSlot do  (payload: (bool, (machine, machine))) {
OpenWSN_Mote_WaitForNewSlot_do_newSlot136(payload);
}
on Tx goto OpenWSN_Mote_DataTransmissionMode with   {
OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_1605216559();
}

on Rx goto OpenWSN_Mote_DataReceptionMode with   {
OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_2058466020();
}

on Sleep goto OpenWSN_Mote_WaitForNewSlot with   {
OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot141();
}
}
 state OpenWSN_Mote_DataTransmissionMode
{entry  {
OpenWSN_Mote_DataTransmissionMode_entry178();
}
exit  {
OpenWSN_Mote_DataTransmissionMode_exit0_rand_1381930122();
}
on Local goto OpenWSN_Mote_WaitForNewSlot with   {
OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot208();
}

on TxDone goto OpenWSN_Mote_WaitForAck with   {
OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_1328445123();
}
}
 state OpenWSN_Mote_WaitForAck
{entry  {
OpenWSN_Mote_WaitForAck_entry0_rand_1694517094();
}
exit  {
OpenWSN_Mote_WaitForAck_exit0_rand_1411453627();
}
ignore Data;on Ack goto OpenWSN_Mote_WaitForNewSlot with  (payload: (machine, int)) {
OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221(payload);
}

on null goto OpenWSN_Mote_WaitForNewSlot with   {
OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot231();
}
}
 state OpenWSN_Mote_DataReceptionMode
{entry  {
OpenWSN_Mote_DataReceptionMode_entry0_rand_1149958194();
}
exit  {
OpenWSN_Mote_DataReceptionMode_exit0_rand_585859198();
}
on Data goto OpenWSN_Mote_WaitForNewSlot with  (payload: (machine, int)) {
OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242(payload);
}
}
}

model SlotTimerMachine
{
var SlotTimerMachine_AllMotes: seq[machine];
var SlotTimerMachine_i: int;
var SlotTimerMachine_counter: int;

fun SlotTimerMachine_increaseCounter()
{
var _tmp567: bool;


SlotTimerMachine_counter = (SlotTimerMachine_counter + 1);
_tmp567 = (SlotTimerMachine_counter == sizeof(SlotTimerMachine_AllMotes));
if(_tmp567)
{

SlotTimerMachine_counter = 0;
raise Local;

}
else
{

;


}

}
fun SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1726566943()
{


;

}
fun SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_506377459()
{


;

}
fun SlotTimerMachine_init_entry262(SlotTimerMachine_init_entry262_payload: seq[machine])
{


SlotTimerMachine_counter = 0;
SlotTimerMachine_AllMotes = SlotTimerMachine_init_entry262_payload;
raise Local;
}
fun SlotTimerMachine_init_exit0_rand_1326036639()
{


;

}
fun SlotTimerMachine_SendNewSlot_entry271()
{
var _tmp568: machine;
var _tmp569: (null, null);
var _tmp570: (bool, (null, null));


SlotTimerMachine_i = (sizeof(SlotTimerMachine_AllMotes) - 1);
while((SlotTimerMachine_i >= 0))
{

_tmp568 = SlotTimerMachine_AllMotes[SlotTimerMachine_i];
_tmp569 = (null, null);
_tmp570 = (true, _tmp569);
send _tmp568, newSlot, _tmp570;
SlotTimerMachine_i = (SlotTimerMachine_i - 1);

}

}
fun SlotTimerMachine_SendNewSlot_exit0_rand_2033545360()
{


;

}start  state SlotTimerMachine_init
{entry (payload: seq[machine]) {
SlotTimerMachine_init_entry262(payload);
}
exit  {
SlotTimerMachine_init_exit0_rand_1326036639();
}
on Local goto SlotTimerMachine_SendNewSlot with   {
SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1726566943();
}
}
 state SlotTimerMachine_SendNewSlot
{entry  {
SlotTimerMachine_SendNewSlot_entry271();
}
exit  {
SlotTimerMachine_SendNewSlot_exit0_rand_2033545360();
}
on endSlot do   {
SlotTimerMachine_increaseCounter();
}
on Local goto SlotTimerMachine_SendNewSlot with   {
SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_506377459();
}
}
}

