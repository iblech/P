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
var Tmp536: machine;
var Tmp537: machine;
var Tmp538: machine;
var Tmp539: machine;
var Tmp540: machine;
var Tmp541: bool;
var Tmp542: (machine, seq[machine]);
var Tmp543: bool;
var Tmp544: (machine, seq[machine]);
var Tmp545: bool;
var Tmp546: (machine, seq[machine]);
var Tmp547: bool;
var Tmp548: (machine, seq[machine]);
var Tmp549: bool;


Tmp536 = new OpenWSN_Mote(0);
GodMachine_N1 = Tmp536;
Tmp537 = new OpenWSN_Mote(1);
GodMachine_N2 = Tmp537;
Tmp538 = new OpenWSN_Mote(2);
GodMachine_N3 = Tmp538;
Tmp539 = new OpenWSN_Mote(1);
GodMachine_N4 = Tmp539;
GodMachine_templ += (0, GodMachine_N1);
GodMachine_templ += (0, GodMachine_N2);
GodMachine_templ += (0, GodMachine_N3);
GodMachine_templ += (0, GodMachine_N4);
Tmp540 = new SlotTimerMachine(GodMachine_templ);
GodMachine_slotT = Tmp540;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
Tmp541 = (sizeof(GodMachine_templ) == 0);
assert Tmp541;
GodMachine_templ += (0, GodMachine_N2);
Tmp542 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N1, Initialize, Tmp542;
GodMachine_templ -= 0;
Tmp543 = (sizeof(GodMachine_templ) == 0);
assert Tmp543;
GodMachine_templ += (0, GodMachine_N1);
GodMachine_templ += (0, GodMachine_N3);
GodMachine_templ += (0, GodMachine_N4);
Tmp544 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N2, Initialize, Tmp544;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
Tmp545 = (sizeof(GodMachine_templ) == 0);
assert Tmp545;
GodMachine_templ += (0, GodMachine_N2);
GodMachine_templ += (0, GodMachine_N4);
Tmp546 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N3, Initialize, Tmp546;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
Tmp547 = (sizeof(GodMachine_templ) == 0);
assert Tmp547;
GodMachine_templ += (0, GodMachine_N2);
GodMachine_templ += (0, GodMachine_N3);
Tmp548 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N4, Initialize, Tmp548;
GodMachine_templ -= 0;
GodMachine_templ -= 0;
Tmp549 = (sizeof(GodMachine_templ) == 0);
assert Tmp549;
}
fun GodMachine_init_exit0_rand_486941236()
{


;

}start 
 state GodMachine_init
{
entry  {
GodMachine_init_entry49();
}
exit  {
GodMachine_init_exit0_rand_486941236();
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
var Tmp550: bool;
var Tmp551: bool;
var Tmp552: bool;
var Tmp553: bool;


Tmp550 = (OpenWSN_Mote_myRank == 0);
if(!(Tmp550))
{

OpenWSN_Mote_lastSynched = (OpenWSN_Mote_lastSynched + 1);

}
else
{

;


}

OpenWSN_Mote_temp = OpenWSN_Mote_OperationTxorRxorSleep();
Tmp551 = (OpenWSN_Mote_temp == 0);
if(Tmp551)
{

raise Tx;

}
else
{

;


}

Tmp552 = (OpenWSN_Mote_temp == 1);
if(Tmp552)
{

raise Rx;

}
else
{

;


}

Tmp553 = (OpenWSN_Mote_temp == 2);
if(Tmp553)
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
var Tmp554: bool;
var Tmp555: bool;


Tmp554 = $;
if(Tmp554)
{

return (0);

}
else
{

Tmp555 = $;
if(Tmp555)
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
var Tmp556: bool;
var Tmp557: bool;
var Tmp558: machine;
var Tmp559: (machine, int);
var Tmp560: (machine, int);


Tmp556 = (OpenWSN_Mote_TransmitData_target == null);
if(Tmp556)
{

OpenWSN_Mote_i = (sizeof(OpenWSN_Mote_myNeighbours) - 1);
while((OpenWSN_Mote_i >= 0))
{

Tmp557 = $;
if(Tmp557)
{

Tmp558 = OpenWSN_Mote_myNeighbours[OpenWSN_Mote_i];
Tmp559 = (this, OpenWSN_Mote_myRank);
send Tmp558, Data, Tmp559;
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

Tmp560 = (this, OpenWSN_Mote_myRank);
send OpenWSN_Mote_TransmitData_target, Data, Tmp560;

}

}
model fun OpenWSN_Mote_CSMA_CA(): bool
{
var Tmp561: bool;


Tmp561 = $;
if(Tmp561)
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
fun OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_259822354()
{


;

}
fun OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_1688729988()
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
fun OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_999377440()
{


;

}
fun OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221(OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload: (machine, int))
{
var Tmp562: bool;


if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload.1))
{

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload;

}
else
{

;


}

Tmp562 = (OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload.0 == OpenWSN_Mote_myTimeParent.0);
if(Tmp562)
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
var Tmp563: bool;
var Tmp564: (machine, int);


if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.1))
{

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload;

}
else
{

;


}

Tmp563 = (OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.0 == OpenWSN_Mote_myTimeParent.0);
if(Tmp563)
{

OpenWSN_Mote_lastSynched = 0;

}
else
{

;


}

Tmp564 = (this, OpenWSN_Mote_myRank);
send OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.0, Ack, Tmp564;
send OpenWSN_Mote_slotTimer, endSlot;
}
fun OpenWSN_Mote_init_mote_entry98(OpenWSN_Mote_init_mote_entry98_payload: int)
{
var Tmp565: (null, int);


OpenWSN_Mote_myRank = OpenWSN_Mote_init_mote_entry98_payload;
Tmp565 = (null, 10000);
OpenWSN_Mote_myTimeParent = Tmp565;
OpenWSN_Mote_lastSynched = 0;
}
fun OpenWSN_Mote_init_mote_exit0_rand_609013140()
{


;

}
fun OpenWSN_Mote_WaitForNewSlot_entry0_rand_1725173570()
{


;

}
fun OpenWSN_Mote_WaitForNewSlot_exit0_rand_1736545034()
{


;

}
fun OpenWSN_Mote_DataTransmissionMode_entry178()
{
var Tmp566: bool;


if(!(OpenWSN_Mote_currentSlot.0))
{

Tmp566 = (OpenWSN_Mote_currentSlot.1.0 == this);
if(Tmp566)
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
fun OpenWSN_Mote_DataTransmissionMode_exit0_rand_1016320906()
{


;

}
fun OpenWSN_Mote_WaitForAck_entry0_rand_635965214()
{


;

}
fun OpenWSN_Mote_WaitForAck_exit0_rand_693246813()
{


;

}
fun OpenWSN_Mote_DataReceptionMode_entry0_rand_629298012()
{


;

}
fun OpenWSN_Mote_DataReceptionMode_exit0_rand_1109233723()
{


;

}start 
 state OpenWSN_Mote_init_mote
{
entry (payload: int) {
OpenWSN_Mote_init_mote_entry98(payload);
}
exit  {
OpenWSN_Mote_init_mote_exit0_rand_609013140();
}
defer newSlot;
ignore Data;on Initialize goto OpenWSN_Mote_WaitForNewSlot with  (payload: (machine, seq[machine])) {
OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105(payload);
}
}

 state OpenWSN_Mote_WaitForNewSlot
{
entry  {
OpenWSN_Mote_WaitForNewSlot_entry0_rand_1725173570();
}
exit  {
OpenWSN_Mote_WaitForNewSlot_exit0_rand_1736545034();
}
ignore Data;
ignore Ack;
on newSlot do  (payload: (bool, (machine, machine))) {
OpenWSN_Mote_WaitForNewSlot_do_newSlot136(payload);
}
on Tx goto OpenWSN_Mote_DataTransmissionMode with   {
OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_259822354();
}

on Rx goto OpenWSN_Mote_DataReceptionMode with   {
OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_1688729988();
}

on Sleep goto OpenWSN_Mote_WaitForNewSlot with   {
OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot141();
}
}

 state OpenWSN_Mote_DataTransmissionMode
{
entry  {
OpenWSN_Mote_DataTransmissionMode_entry178();
}
exit  {
OpenWSN_Mote_DataTransmissionMode_exit0_rand_1016320906();
}
on Local goto OpenWSN_Mote_WaitForNewSlot with   {
OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot208();
}

on TxDone goto OpenWSN_Mote_WaitForAck with   {
OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_999377440();
}
}

 state OpenWSN_Mote_WaitForAck
{
entry  {
OpenWSN_Mote_WaitForAck_entry0_rand_635965214();
}
exit  {
OpenWSN_Mote_WaitForAck_exit0_rand_693246813();
}
ignore Data;on Ack goto OpenWSN_Mote_WaitForNewSlot with  (payload: (machine, int)) {
OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221(payload);
}

on null goto OpenWSN_Mote_WaitForNewSlot with   {
OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot231();
}
}

 state OpenWSN_Mote_DataReceptionMode
{
entry  {
OpenWSN_Mote_DataReceptionMode_entry0_rand_629298012();
}
exit  {
OpenWSN_Mote_DataReceptionMode_exit0_rand_1109233723();
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
var Tmp567: bool;


SlotTimerMachine_counter = (SlotTimerMachine_counter + 1);
Tmp567 = (SlotTimerMachine_counter == sizeof(SlotTimerMachine_AllMotes));
if(Tmp567)
{

SlotTimerMachine_counter = 0;
raise Local;

}
else
{

;


}

}
fun SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1145609900()
{


;

}
fun SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1627964616()
{


;

}
fun SlotTimerMachine_init_entry262(SlotTimerMachine_init_entry262_payload: seq[machine])
{


SlotTimerMachine_counter = 0;
SlotTimerMachine_AllMotes = SlotTimerMachine_init_entry262_payload;
raise Local;
}
fun SlotTimerMachine_init_exit0_rand_336468942()
{


;

}
fun SlotTimerMachine_SendNewSlot_entry271()
{
var Tmp568: machine;
var Tmp569: (null, null);
var Tmp570: (bool, (null, null));


SlotTimerMachine_i = (sizeof(SlotTimerMachine_AllMotes) - 1);
while((SlotTimerMachine_i >= 0))
{

Tmp568 = SlotTimerMachine_AllMotes[SlotTimerMachine_i];
Tmp569 = (null, null);
Tmp570 = (true, Tmp569);
send Tmp568, newSlot, Tmp570;
SlotTimerMachine_i = (SlotTimerMachine_i - 1);

}

}
fun SlotTimerMachine_SendNewSlot_exit0_rand_141213756()
{


;

}start 
 state SlotTimerMachine_init
{
entry (payload: seq[machine]) {
SlotTimerMachine_init_entry262(payload);
}
exit  {
SlotTimerMachine_init_exit0_rand_336468942();
}
on Local goto SlotTimerMachine_SendNewSlot with   {
SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1145609900();
}
}

 state SlotTimerMachine_SendNewSlot
{
entry  {
SlotTimerMachine_SendNewSlot_entry271();
}
exit  {
SlotTimerMachine_SendNewSlot_exit0_rand_141213756();
}
on endSlot do   {
SlotTimerMachine_increaseCounter();
}
on Local goto SlotTimerMachine_SendNewSlot with   {
SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1627964616();
}
}
}

