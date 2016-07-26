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

fun GodMachine_init_entry49(GodMachine_init_entry49__payload_0: null)
{
var Tmp603: machine;
var Tmp604: machine;
var Tmp605: machine;
var Tmp606: machine;
var Tmp607: machine;
var Tmp608: bool;
var Tmp609: (machine, seq[machine]);
var Tmp610: bool;
var Tmp611: (machine, seq[machine]);
var Tmp612: bool;
var Tmp613: (machine, seq[machine]);
var Tmp614: bool;
var Tmp615: (machine, seq[machine]);
var Tmp616: bool;


;

Tmp603 = new OpenWSN_Mote(0);
GodMachine_N1 = Tmp603;
;

Tmp604 = new OpenWSN_Mote(1);
GodMachine_N2 = Tmp604;
;

Tmp605 = new OpenWSN_Mote(2);
GodMachine_N3 = Tmp605;
;

Tmp606 = new OpenWSN_Mote(1);
GodMachine_N4 = Tmp606;
;

GodMachine_templ += (0, GodMachine_N1);
;

GodMachine_templ += (0, GodMachine_N2);
;

GodMachine_templ += (0, GodMachine_N3);
;

GodMachine_templ += (0, GodMachine_N4);
;

Tmp607 = new SlotTimerMachine(GodMachine_templ);
GodMachine_slotT = Tmp607;
;

GodMachine_templ -= 0;
;

GodMachine_templ -= 0;
;

GodMachine_templ -= 0;
;

GodMachine_templ -= 0;
;

Tmp608 = (sizeof(GodMachine_templ) == 0);
assert Tmp608;
;

GodMachine_templ += (0, GodMachine_N2);
;

Tmp609 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N1, Initialize, Tmp609;
;

GodMachine_templ -= 0;
;

Tmp610 = (sizeof(GodMachine_templ) == 0);
assert Tmp610;
;

GodMachine_templ += (0, GodMachine_N1);
;

GodMachine_templ += (0, GodMachine_N3);
;

GodMachine_templ += (0, GodMachine_N4);
;

Tmp611 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N2, Initialize, Tmp611;
;

GodMachine_templ -= 0;
;

GodMachine_templ -= 0;
;

GodMachine_templ -= 0;
;

Tmp612 = (sizeof(GodMachine_templ) == 0);
assert Tmp612;
;

GodMachine_templ += (0, GodMachine_N2);
;

GodMachine_templ += (0, GodMachine_N4);
;

Tmp613 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N3, Initialize, Tmp613;
;

GodMachine_templ -= 0;
;

GodMachine_templ -= 0;
;

Tmp614 = (sizeof(GodMachine_templ) == 0);
assert Tmp614;
;

GodMachine_templ += (0, GodMachine_N2);
;

GodMachine_templ += (0, GodMachine_N3);
;

Tmp615 = (GodMachine_slotT, GodMachine_templ);
send GodMachine_N4, Initialize, Tmp615;
;

GodMachine_templ -= 0;
;

GodMachine_templ -= 0;
;

Tmp616 = (sizeof(GodMachine_templ) == 0);
assert Tmp616;
return;
}
fun GodMachine_init_exit0_rand_1716465578(GodMachine_init_exit0_rand_1716465578__payload_skip: any)
{


;

;

return;
}start 
 state GodMachine_init
{
entry (payload: null) {
GodMachine_init_entry49(payload);
}exit {
GodMachine_init_exit0_rand_1716465578(null);
}}
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
var Tmp617: bool;
var Tmp618: bool;
var Tmp619: bool;
var Tmp620: bool;


;

Tmp617 = (OpenWSN_Mote_myRank == 0);
if(!(Tmp617))
{

;

OpenWSN_Mote_lastSynched = (OpenWSN_Mote_lastSynched + 1);

}
else
{

;

;


}

;

OpenWSN_Mote_temp = OpenWSN_Mote_OperationTxorRxorSleep();
;

Tmp618 = (OpenWSN_Mote_temp == 0);
if(Tmp618)
{

;

raise Tx;

}
else
{

;

;


}

;

Tmp619 = (OpenWSN_Mote_temp == 1);
if(Tmp619)
{

;

raise Rx;

}
else
{

;

;


}

;

Tmp620 = (OpenWSN_Mote_temp == 2);
if(Tmp620)
{

;

raise Sleep;

}
else
{

;

;


}

}
fun OpenWSN_Mote_OperationTxorRxorSleep(): int
{
var Tmp621: bool;
var Tmp622: bool;


;

Tmp621 = $;
if(Tmp621)
{

;

return (0);

}
else
{

;

Tmp622 = $;
if(Tmp622)
{

;

return (1);

}
else
{

;

return (2);

}


}

}
fun OpenWSN_Mote_TransmitData(OpenWSN_Mote_TransmitData_target: machine)
{
var Tmp623: bool;
var Tmp624: bool;
var Tmp625: machine;
var Tmp626: (machine, int);
var Tmp627: (machine, int);


;

Tmp623 = (OpenWSN_Mote_TransmitData_target == null);
if(Tmp623)
{

;

OpenWSN_Mote_i = (sizeof(OpenWSN_Mote_myNeighbours) - 1);
;

while((OpenWSN_Mote_i >= 0))
{

;

Tmp624 = $;
if(Tmp624)
{

;

Tmp625 = OpenWSN_Mote_myNeighbours[OpenWSN_Mote_i];
Tmp626 = (this, OpenWSN_Mote_myRank);
send Tmp625, Data, Tmp626;
;

return;

}
else
{

;

OpenWSN_Mote_i = (OpenWSN_Mote_i - 1);

}


}


}
else
{

;

Tmp627 = (this, OpenWSN_Mote_myRank);
send OpenWSN_Mote_TransmitData_target, Data, Tmp627;

}

}
fun OpenWSN_Mote_CSMA_CA(): bool
{
var Tmp628: bool;


;

Tmp628 = $;
if(Tmp628)
{

;

return (true);

}
else
{

;

return (false);

}

}
fun OpenWSN_Mote_WaitForNewSlot_do_newSlot133(OpenWSN_Mote_WaitForNewSlot_do_newSlot133_payload: (bool, (machine, machine)))
{


;

OpenWSN_Mote_CheckOperationTobePerfomed(OpenWSN_Mote_WaitForNewSlot_do_newSlot133_payload);
return;
}
fun OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105(OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload: (machine, seq[machine]))
{


;

OpenWSN_Mote_slotTimer = OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload.0;
;

OpenWSN_Mote_myNeighbours = OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload.1;
return;
}
fun OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_262999561(OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_262999561__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_529885219(OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_529885219__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot138(OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot138__payload_1: null)
{


;

send OpenWSN_Mote_slotTimer, endSlot;
return;
}
fun OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot205(OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot205__payload_3: null)
{


;

send OpenWSN_Mote_slotTimer, endSlot;
return;
}
fun OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_1688499050(OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_1688499050__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot218(OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot218_payload: (machine, int))
{
var Tmp629: bool;


;

if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot218_payload.1))
{

;

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot218_payload;

}
else
{

;

;


}

;

Tmp629 = (OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot218_payload.0 == OpenWSN_Mote_myTimeParent.0);
if(Tmp629)
{

;

OpenWSN_Mote_lastSynched = 0;

}
else
{

;

;


}

;

send OpenWSN_Mote_slotTimer, endSlot;
return;
}
fun OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot228(OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot228__payload_5: null)
{


;

send OpenWSN_Mote_slotTimer, endSlot;
return;
}
fun OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot239(OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot239_payload: (machine, int))
{
var Tmp630: bool;
var Tmp631: (machine, int);


;

if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot239_payload.1))
{

;

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot239_payload;

}
else
{

;

;


}

;

Tmp630 = (OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot239_payload.0 == OpenWSN_Mote_myTimeParent.0);
if(Tmp630)
{

;

OpenWSN_Mote_lastSynched = 0;

}
else
{

;

;


}

;

Tmp631 = (this, OpenWSN_Mote_myRank);
send OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot239_payload.0, Ack, Tmp631;
;

send OpenWSN_Mote_slotTimer, endSlot;
return;
}
fun OpenWSN_Mote_init_mote_entry98(OpenWSN_Mote_init_mote_entry98_payload: int)
{
var Tmp632: (null, int);


;

OpenWSN_Mote_myRank = OpenWSN_Mote_init_mote_entry98_payload;
;

Tmp632 = (null, 10000);
OpenWSN_Mote_myTimeParent = Tmp632;
;

OpenWSN_Mote_lastSynched = 0;
return;
}
fun OpenWSN_Mote_init_mote_exit0_rand_439790253(OpenWSN_Mote_init_mote_exit0_rand_439790253__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_WaitForNewSlot_entry0_rand_1020427696(OpenWSN_Mote_WaitForNewSlot_entry0_rand_1020427696__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_WaitForNewSlot_exit0_rand_181770119(OpenWSN_Mote_WaitForNewSlot_exit0_rand_181770119__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_DataTransmissionMode_entry175(OpenWSN_Mote_DataTransmissionMode_entry175__payload_2: null)
{
var Tmp633: bool;


;

if(!(OpenWSN_Mote_currentSlot.0))
{

;

Tmp633 = (OpenWSN_Mote_currentSlot.1.0 == this);
if(Tmp633)
{

;

OpenWSN_Mote_TransmitData(OpenWSN_Mote_currentSlot.1.1);
;

raise TxDone;

}
else
{

;

raise Local;

}


}
else
{

;

OpenWSN_Mote_check = OpenWSN_Mote_CSMA_CA();
;

if(OpenWSN_Mote_check)
{

;

OpenWSN_Mote_TransmitData(null);
;

raise TxDone;

}
else
{

;

raise Local;

}


}

return;
}
fun OpenWSN_Mote_DataTransmissionMode_exit0_rand_99850059(OpenWSN_Mote_DataTransmissionMode_exit0_rand_99850059__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_WaitForAck_entry0_rand_786443991(OpenWSN_Mote_WaitForAck_entry0_rand_786443991__payload_4: null)
{


;

;

return;
}
fun OpenWSN_Mote_WaitForAck_exit0_rand_1993129534(OpenWSN_Mote_WaitForAck_exit0_rand_1993129534__payload_skip: any)
{


;

;

return;
}
fun OpenWSN_Mote_DataReceptionMode_entry0_rand_2080408958(OpenWSN_Mote_DataReceptionMode_entry0_rand_2080408958__payload_6: null)
{


;

;

return;
}
fun OpenWSN_Mote_DataReceptionMode_exit0_rand_889647419(OpenWSN_Mote_DataReceptionMode_exit0_rand_889647419__payload_skip: any)
{


;

;

return;
}start 
 state OpenWSN_Mote_init_mote
{
entry (payload: int) {
OpenWSN_Mote_init_mote_entry98(payload);
}exit {
OpenWSN_Mote_init_mote_exit0_rand_439790253(null);
}defer newSlot;
ignore Data;on Initialize goto OpenWSN_Mote_WaitForNewSlot with (payload: (machine, seq[machine])) {
OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105(payload);
}}

 state OpenWSN_Mote_WaitForNewSlot
{
entry (payload: any) {
OpenWSN_Mote_WaitForNewSlot_entry0_rand_1020427696(payload);
}exit {
OpenWSN_Mote_WaitForNewSlot_exit0_rand_181770119(null);
}ignore Data;
ignore Ack;
on newSlot do (payload: (bool, (machine, machine))) {
OpenWSN_Mote_WaitForNewSlot_do_newSlot133(payload);
}on Tx goto OpenWSN_Mote_DataTransmissionMode with (payload: null) {
OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_262999561(payload);
}
on Rx goto OpenWSN_Mote_DataReceptionMode with (payload: null) {
OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_529885219(payload);
}
on Sleep goto OpenWSN_Mote_WaitForNewSlot with (payload: null) {
OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot138(payload);
}}

 state OpenWSN_Mote_DataTransmissionMode
{
entry (payload: null) {
OpenWSN_Mote_DataTransmissionMode_entry175(payload);
}exit {
OpenWSN_Mote_DataTransmissionMode_exit0_rand_99850059(null);
}on Local goto OpenWSN_Mote_WaitForNewSlot with (payload: null) {
OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot205(payload);
}
on TxDone goto OpenWSN_Mote_WaitForAck with (payload: null) {
OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_1688499050(payload);
}}

 state OpenWSN_Mote_WaitForAck
{
entry (payload: null) {
OpenWSN_Mote_WaitForAck_entry0_rand_786443991(payload);
}exit {
OpenWSN_Mote_WaitForAck_exit0_rand_1993129534(null);
}ignore Data;on Ack goto OpenWSN_Mote_WaitForNewSlot with (payload: (machine, int)) {
OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot218(payload);
}
on null goto OpenWSN_Mote_WaitForNewSlot with (payload: null) {
OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot228(payload);
}}

 state OpenWSN_Mote_DataReceptionMode
{
entry (payload: null) {
OpenWSN_Mote_DataReceptionMode_entry0_rand_2080408958(payload);
}exit {
OpenWSN_Mote_DataReceptionMode_exit0_rand_889647419(null);
}on Data goto OpenWSN_Mote_WaitForNewSlot with (payload: (machine, int)) {
OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot239(payload);
}}
}

machine SlotTimerMachine
{
var SlotTimerMachine_AllMotes: seq[machine];
var SlotTimerMachine_i: int;
var SlotTimerMachine_counter: int;

fun SlotTimerMachine_increaseCounter()
{
var Tmp634: bool;


;

SlotTimerMachine_counter = (SlotTimerMachine_counter + 1);
;

Tmp634 = (SlotTimerMachine_counter == sizeof(SlotTimerMachine_AllMotes));
if(Tmp634)
{

;

SlotTimerMachine_counter = 0;
;

raise Local;

}
else
{

;

;


}

}
fun SlotTimerMachine_SendNewSlot_do_endSlot(payload: null)
{


SlotTimerMachine_increaseCounter();
}
fun SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_251992464(SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_251992464__payload_skip: any)
{


;

;

return;
}
fun SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_488449470(SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_488449470__payload_skip: any)
{


;

;

return;
}
fun SlotTimerMachine_init_entry259(SlotTimerMachine_init_entry259_payload: seq[machine])
{


;

SlotTimerMachine_counter = 0;
;

SlotTimerMachine_AllMotes = SlotTimerMachine_init_entry259_payload;
;

raise Local;
return;
}
fun SlotTimerMachine_init_exit0_rand_1574963109(SlotTimerMachine_init_exit0_rand_1574963109__payload_skip: any)
{


;

;

return;
}
fun SlotTimerMachine_SendNewSlot_entry268(SlotTimerMachine_SendNewSlot_entry268__payload_7: null)
{
var Tmp635: machine;
var Tmp636: (null, null);
var Tmp637: (bool, (null, null));


;

SlotTimerMachine_i = (sizeof(SlotTimerMachine_AllMotes) - 1);
;

while((SlotTimerMachine_i >= 0))
{

;

Tmp635 = SlotTimerMachine_AllMotes[SlotTimerMachine_i];
Tmp636 = (null, null);
Tmp637 = (true, Tmp636);
send Tmp635, newSlot, Tmp637;
;

SlotTimerMachine_i = (SlotTimerMachine_i - 1);

}

return;
}
fun SlotTimerMachine_SendNewSlot_exit0_rand_1290043978(SlotTimerMachine_SendNewSlot_exit0_rand_1290043978__payload_skip: any)
{


;

;

return;
}start 
 state SlotTimerMachine_init
{
entry (payload: seq[machine]) {
SlotTimerMachine_init_entry259(payload);
}exit {
SlotTimerMachine_init_exit0_rand_1574963109(null);
}on Local goto SlotTimerMachine_SendNewSlot with (payload: null) {
SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_251992464(payload);
}}

 state SlotTimerMachine_SendNewSlot
{
entry (payload: null) {
SlotTimerMachine_SendNewSlot_entry268(payload);
}exit {
SlotTimerMachine_SendNewSlot_exit0_rand_1290043978(null);
}on endSlot do (payload: null) {
SlotTimerMachine_SendNewSlot_do_endSlot(payload);
}on Local goto SlotTimerMachine_SendNewSlot with (payload: null) {
SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_488449470(payload);
}}
}

