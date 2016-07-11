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

fun GodMachine_init_entry49(GodMachine_init_entry49__payload_0: any)
{
var _tmp1118: machine;
var _tmp1119: machine;
var _tmp1120: machine;
var _tmp1121: machine;
var _tmp1122: machine;
var _tmp1123: bool;
var _tmp1124: (machine, seq[machine]);
var _tmp1125: bool;
var _tmp1126: (machine, seq[machine]);
var _tmp1127: bool;
var _tmp1128: (machine, seq[machine]);
var _tmp1129: bool;
var _tmp1130: (machine, seq[machine]);
var _tmp1131: bool;


_tmp1118 = new OpenWSN_Mote(0);
;
GodMachine_N1 = _tmp1118;
;
_tmp1119 = new OpenWSN_Mote(1);
;
GodMachine_N2 = _tmp1119;
;
_tmp1120 = new OpenWSN_Mote(2);
;
GodMachine_N3 = _tmp1120;
;
_tmp1121 = new OpenWSN_Mote(1);
;
GodMachine_N4 = _tmp1121;
;
GodMachine_templ += (0, GodMachine_N1);
;
GodMachine_templ += (0, GodMachine_N2);
;
GodMachine_templ += (0, GodMachine_N3);
;
GodMachine_templ += (0, GodMachine_N4);
;
_tmp1122 = new SlotTimerMachine(GodMachine_templ);
;
GodMachine_slotT = _tmp1122;
;
GodMachine_templ -= 0;
;
GodMachine_templ -= 0;
;
GodMachine_templ -= 0;
;
GodMachine_templ -= 0;
;
_tmp1123 = (sizeof(GodMachine_templ) == 0);
;
assert _tmp1123;
;
GodMachine_templ += (0, GodMachine_N2);
;
_tmp1124 = (GodMachine_slotT, GodMachine_templ);
;
send GodMachine_N1, Initialize, _tmp1124;
;
GodMachine_templ -= 0;
;
_tmp1125 = (sizeof(GodMachine_templ) == 0);
;
assert _tmp1125;
;
GodMachine_templ += (0, GodMachine_N1);
;
GodMachine_templ += (0, GodMachine_N3);
;
GodMachine_templ += (0, GodMachine_N4);
;
_tmp1126 = (GodMachine_slotT, GodMachine_templ);
;
send GodMachine_N2, Initialize, _tmp1126;
;
GodMachine_templ -= 0;
;
GodMachine_templ -= 0;
;
GodMachine_templ -= 0;
;
_tmp1127 = (sizeof(GodMachine_templ) == 0);
;
assert _tmp1127;
;
GodMachine_templ += (0, GodMachine_N2);
;
GodMachine_templ += (0, GodMachine_N4);
;
_tmp1128 = (GodMachine_slotT, GodMachine_templ);
;
send GodMachine_N3, Initialize, _tmp1128;
;
GodMachine_templ -= 0;
;
GodMachine_templ -= 0;
;
_tmp1129 = (sizeof(GodMachine_templ) == 0);
;
assert _tmp1129;
;
GodMachine_templ += (0, GodMachine_N2);
;
GodMachine_templ += (0, GodMachine_N3);
;
_tmp1130 = (GodMachine_slotT, GodMachine_templ);
;
send GodMachine_N4, Initialize, _tmp1130;
;
GodMachine_templ -= 0;
;
GodMachine_templ -= 0;
;
_tmp1131 = (sizeof(GodMachine_templ) == 0);
;
assert _tmp1131;


}
fun GodMachine_init_exit0_rand_175541304()
{


;


}start  state GodMachine_init
{entry (payload: any) {
GodMachine_init_entry49(payload);
}
exit  {
GodMachine_init_exit0_rand_175541304();
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
var _tmp1132: bool;
var _tmp1133: bool;
var _tmp1134: bool;
var _tmp1135: bool;


_tmp1132 = (OpenWSN_Mote_myRank == 0);
;
if(!(_tmp1132))
{

OpenWSN_Mote_lastSynched = (OpenWSN_Mote_lastSynched + 1);
;
OpenWSN_Mote_lastSynched = (OpenWSN_Mote_lastSynched + 1);



}
else
{

;
;
;



}
;
OpenWSN_Mote_temp = OpenWSN_Mote_OperationTxorRxorSleep();
;
_tmp1133 = (OpenWSN_Mote_temp == 0);
;
if(_tmp1133)
{

raise Tx;
;
raise Tx;



}
else
{

;
;
;



}
;
_tmp1134 = (OpenWSN_Mote_temp == 1);
;
if(_tmp1134)
{

raise Rx;
;
raise Rx;



}
else
{

;
;
;



}
;
_tmp1135 = (OpenWSN_Mote_temp == 2);
;
if(_tmp1135)
{

raise Sleep;
;
raise Sleep;



}
else
{

;
;
;



}


}
model fun OpenWSN_Mote_OperationTxorRxorSleep(): int
{
var _tmp1136: bool;
var _tmp1137: bool;


_tmp1136 = $;
;
if(_tmp1136)
{

return (0);
;
return (0);



}
else
{

_tmp1137 = $;
;
if(_tmp1137)
{

return (1);
;
return (1);



}
else
{

return (2);
;
return (2);



}
;
if($)
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
var _tmp1138: bool;
var _tmp1139: bool;
var _tmp1140: machine;
var _tmp1141: (machine, int);
var _tmp1142: (machine, int);


_tmp1138 = (OpenWSN_Mote_TransmitData_target == null);
;
if(_tmp1138)
{

OpenWSN_Mote_i = (sizeof(OpenWSN_Mote_myNeighbours) - 1);
;
while((OpenWSN_Mote_i >= 0))
{

_tmp1139 = $;
;
if(_tmp1139)
{

_tmp1140 = OpenWSN_Mote_myNeighbours[OpenWSN_Mote_i];
;
_tmp1141 = (this, OpenWSN_Mote_myRank);
;
send _tmp1140, Data, _tmp1141;
;
return;
;
send OpenWSN_Mote_myNeighbours[OpenWSN_Mote_i], Data, (this, OpenWSN_Mote_myRank);
;
return;



}
else
{

OpenWSN_Mote_i = (OpenWSN_Mote_i - 1);
;
OpenWSN_Mote_i = (OpenWSN_Mote_i - 1);



}
;
if($)
{

send OpenWSN_Mote_myNeighbours[OpenWSN_Mote_i], Data, (this, OpenWSN_Mote_myRank);
;
return;



}
else
{
OpenWSN_Mote_i = (OpenWSN_Mote_i - 1);

}



}
;
OpenWSN_Mote_i = (sizeof(OpenWSN_Mote_myNeighbours) - 1);
;
while((OpenWSN_Mote_i >= 0))
{
if($)
{

send OpenWSN_Mote_myNeighbours[OpenWSN_Mote_i], Data, (this, OpenWSN_Mote_myRank);
;
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

_tmp1142 = (this, OpenWSN_Mote_myRank);
;
send OpenWSN_Mote_TransmitData_target, Data, _tmp1142;
;
send OpenWSN_Mote_TransmitData_target, Data, (this, OpenWSN_Mote_myRank);



}


}
model fun OpenWSN_Mote_CSMA_CA(): bool
{
var _tmp1143: bool;


_tmp1143 = $;
;
if(_tmp1143)
{

return (true);
;
return (true);



}
else
{

return (false);
;
return (false);



}


}
fun OpenWSN_Mote_init_mote_entry98(OpenWSN_Mote_init_mote_entry98_payload: int)
{
var _tmp1144: (null, int);


OpenWSN_Mote_myRank = OpenWSN_Mote_init_mote_entry98_payload;
;
_tmp1144 = (null, 10000);
;
OpenWSN_Mote_myTimeParent = _tmp1144;
;
OpenWSN_Mote_lastSynched = 0;


}
fun OpenWSN_Mote_init_mote_exit0_rand_1110266057()
{


;


}
fun OpenWSN_Mote_WaitForNewSlot_entry0_rand_1174393130(OpenWSN_Mote_WaitForNewSlot_entry0_rand_1174393130__payload_1: any)
{


;


}
fun OpenWSN_Mote_WaitForNewSlot_exit0_rand_1941800634()
{


;


}
fun OpenWSN_Mote_DataTransmissionMode_entry178(OpenWSN_Mote_DataTransmissionMode_entry178__payload_3: any)
{
var _tmp1145: bool;


if(!(OpenWSN_Mote_currentSlot.0))
{

_tmp1145 = (OpenWSN_Mote_currentSlot.1.0 == this);
;
if(_tmp1145)
{

OpenWSN_Mote_TransmitData(OpenWSN_Mote_currentSlot.1.1);
;
raise TxDone;
;
OpenWSN_Mote_TransmitData(OpenWSN_Mote_currentSlot.1.1);
;
raise TxDone;



}
else
{

raise Local;
;
raise Local;



}
;
if((OpenWSN_Mote_currentSlot.1.0 == this))
{

OpenWSN_Mote_TransmitData(OpenWSN_Mote_currentSlot.1.1);
;
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
;
if(OpenWSN_Mote_check)
{

OpenWSN_Mote_TransmitData(null);
;
raise TxDone;
;
OpenWSN_Mote_TransmitData(null);
;
raise TxDone;



}
else
{

raise Local;
;
raise Local;



}
;
OpenWSN_Mote_check = OpenWSN_Mote_CSMA_CA();
;
if(OpenWSN_Mote_check)
{

OpenWSN_Mote_TransmitData(null);
;
raise TxDone;



}
else
{
raise Local;

}



}


}
fun OpenWSN_Mote_DataTransmissionMode_exit0_rand_884718565()
{


;


}
fun OpenWSN_Mote_WaitForAck_entry0_rand_729871664(OpenWSN_Mote_WaitForAck_entry0_rand_729871664__payload_5: any)
{


;


}
fun OpenWSN_Mote_WaitForAck_exit0_rand_1877825412()
{


;


}
fun OpenWSN_Mote_DataReceptionMode_entry0_rand_1071148483(OpenWSN_Mote_DataReceptionMode_entry0_rand_1071148483__payload_7: any)
{


;


}
fun OpenWSN_Mote_DataReceptionMode_exit0_rand_1368208611()
{


;


}
fun OpenWSN_Mote_WaitForNewSlot_do_newSlot136(OpenWSN_Mote_WaitForNewSlot_do_newSlot136_payload: (bool, (machine, machine)))
{


OpenWSN_Mote_CheckOperationTobePerfomed(OpenWSN_Mote_WaitForNewSlot_do_newSlot136_payload);


}
fun OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105(OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload: (machine, seq[machine]))
{


OpenWSN_Mote_slotTimer = OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload.0;
;
OpenWSN_Mote_myNeighbours = OpenWSN_Mote_init_mote_on_Initialize_goto_OpenWSN_Mote_WaitForNewSlot105_payload.1;


}
fun OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_763256326(OpenWSN_Mote_WaitForNewSlot_on_Tx_goto_OpenWSN_Mote_DataTransmissionMode0_rand_763256326__payload_skip: any)
{


;


}
fun OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_133996016(OpenWSN_Mote_WaitForNewSlot_on_Rx_goto_OpenWSN_Mote_DataReceptionMode0_rand_133996016__payload_skip: any)
{


;


}
fun OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot141(OpenWSN_Mote_WaitForNewSlot_on_Sleep_goto_OpenWSN_Mote_WaitForNewSlot141__payload_2: any)
{


send OpenWSN_Mote_slotTimer, endSlot;


}
fun OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot208(OpenWSN_Mote_DataTransmissionMode_on_Local_goto_OpenWSN_Mote_WaitForNewSlot208__payload_4: any)
{


send OpenWSN_Mote_slotTimer, endSlot;


}
fun OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_515752733(OpenWSN_Mote_DataTransmissionMode_on_TxDone_goto_OpenWSN_Mote_WaitForAck0_rand_515752733__payload_skip: any)
{


;


}
fun OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221(OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload: (machine, int))
{
var _tmp1146: bool;


if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload.1))
{

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload;
;
OpenWSN_Mote_myTimeParent = OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload;



}
else
{

;
;
;



}
;
_tmp1146 = (OpenWSN_Mote_WaitForAck_on_Ack_goto_OpenWSN_Mote_WaitForNewSlot221_payload.0 == OpenWSN_Mote_myTimeParent.0);
;
if(_tmp1146)
{

OpenWSN_Mote_lastSynched = 0;
;
OpenWSN_Mote_lastSynched = 0;



}
else
{

;
;
;



}
;
send OpenWSN_Mote_slotTimer, endSlot;


}
fun OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot231(OpenWSN_Mote_WaitForAck_on_null_goto_OpenWSN_Mote_WaitForNewSlot231__payload_6: any)
{


send OpenWSN_Mote_slotTimer, endSlot;


}
fun OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242(OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload: (machine, int))
{
var _tmp1147: bool;
var _tmp1148: (machine, int);


if((OpenWSN_Mote_myTimeParent.1 > OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.1))
{

OpenWSN_Mote_myTimeParent = OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload;
;
OpenWSN_Mote_myTimeParent = OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload;



}
else
{

;
;
;



}
;
_tmp1147 = (OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.0 == OpenWSN_Mote_myTimeParent.0);
;
if(_tmp1147)
{

OpenWSN_Mote_lastSynched = 0;
;
OpenWSN_Mote_lastSynched = 0;



}
else
{

;
;
;



}
;
_tmp1148 = (this, OpenWSN_Mote_myRank);
;
send OpenWSN_Mote_DataReceptionMode_on_Data_goto_OpenWSN_Mote_WaitForNewSlot242_payload.0, Ack, _tmp1148;
;
send OpenWSN_Mote_slotTimer, endSlot;


}start  state OpenWSN_Mote_init_mote
{entry (payload: int) {
OpenWSN_Mote_init_mote_entry98(payload);
}
exit  {
OpenWSN_Mote_init_mote_exit0_rand_1110266057();
}
}
 state OpenWSN_Mote_WaitForNewSlot
{entry (payload: any) {
OpenWSN_Mote_WaitForNewSlot_entry0_rand_1174393130(payload);
}
exit  {
OpenWSN_Mote_WaitForNewSlot_exit0_rand_1941800634();
}
}
 state OpenWSN_Mote_DataTransmissionMode
{entry (payload: any) {
OpenWSN_Mote_DataTransmissionMode_entry178(payload);
}
exit  {
OpenWSN_Mote_DataTransmissionMode_exit0_rand_884718565();
}
}
 state OpenWSN_Mote_WaitForAck
{entry (payload: any) {
OpenWSN_Mote_WaitForAck_entry0_rand_729871664(payload);
}
exit  {
OpenWSN_Mote_WaitForAck_exit0_rand_1877825412();
}
}
 state OpenWSN_Mote_DataReceptionMode
{entry (payload: any) {
OpenWSN_Mote_DataReceptionMode_entry0_rand_1071148483(payload);
}
exit  {
OpenWSN_Mote_DataReceptionMode_exit0_rand_1368208611();
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
var _tmp1149: bool;


SlotTimerMachine_counter = (SlotTimerMachine_counter + 1);
;
_tmp1149 = (SlotTimerMachine_counter == sizeof(SlotTimerMachine_AllMotes));
;
if(_tmp1149)
{

SlotTimerMachine_counter = 0;
;
raise Local;
;
SlotTimerMachine_counter = 0;
;
raise Local;



}
else
{

;
;
;



}


}
fun SlotTimerMachine_init_entry262(SlotTimerMachine_init_entry262_payload: seq[machine])
{


SlotTimerMachine_counter = 0;
;
SlotTimerMachine_AllMotes = SlotTimerMachine_init_entry262_payload;
;
raise Local;


}
fun SlotTimerMachine_init_exit0_rand_1345929266()
{


;


}
fun SlotTimerMachine_SendNewSlot_entry271(SlotTimerMachine_SendNewSlot_entry271__payload_8: any)
{
var _tmp1150: machine;
var _tmp1151: (null, null);
var _tmp1152: (bool, (null, null));


SlotTimerMachine_i = (sizeof(SlotTimerMachine_AllMotes) - 1);
;
while((SlotTimerMachine_i >= 0))
{

_tmp1150 = SlotTimerMachine_AllMotes[SlotTimerMachine_i];
;
_tmp1151 = (null, null);
;
_tmp1152 = (true, _tmp1151);
;
send _tmp1150, newSlot, _tmp1152;
;
SlotTimerMachine_i = (SlotTimerMachine_i - 1);
;
send SlotTimerMachine_AllMotes[SlotTimerMachine_i], newSlot, (true, (null, null));
;
SlotTimerMachine_i = (SlotTimerMachine_i - 1);



}


}
fun SlotTimerMachine_SendNewSlot_exit0_rand_2092569852()
{


;


}
fun SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_2136116610(SlotTimerMachine_init_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_2136116610__payload_skip: any)
{


;


}
fun SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1657150125(SlotTimerMachine_SendNewSlot_on_Local_goto_SlotTimerMachine_SendNewSlot0_rand_1657150125__payload_skip: any)
{


;


}start  state SlotTimerMachine_init
{entry (payload: seq[machine]) {
SlotTimerMachine_init_entry262(payload);
}
exit  {
SlotTimerMachine_init_exit0_rand_1345929266();
}
}
 state SlotTimerMachine_SendNewSlot
{entry (payload: any) {
SlotTimerMachine_SendNewSlot_entry271(payload);
}
exit  {
SlotTimerMachine_SendNewSlot_exit0_rand_2092569852();
}
}
}

