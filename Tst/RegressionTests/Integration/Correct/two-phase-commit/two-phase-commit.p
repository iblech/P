event REQ_REPLICA: (int, int, int);
event RESP_REPLICA_COMMIT: int;
event RESP_REPLICA_ABORT: int;
event GLOBAL_ABORT: int;
event GLOBAL_COMMIT: int;
event WRITE_REQ: (machine, int, int);
event WRITE_FAIL;
event WRITE_SUCCESS;
event READ_REQ: (machine, int);
event READ_FAIL;
event READ_UNAVAILABLE;
event READ_SUCCESS: int;
event Unit;
event Timeout;
event StartTimer: int;
event CancelTimer;
event CancelTimerFailure;
event CancelTimerSuccess;
event MONITOR_WRITE: (int, int);
event MONITOR_READ_SUCCESS: (int, int);
event MONITOR_READ_UNAVAILABLE: int;

model Timer
{
var Timer_target: machine;

fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_713200358()
{


;

}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_118491391()
{


;

}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_436453176()
{


;

}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47()
{
var _tmp604: bool;


_tmp604 = $;
if(_tmp604)
{

send Timer_target, CancelTimerFailure;
send Timer_target, Timeout;

}
else
{

send Timer_target, CancelTimerSuccess;

}

}
fun Timer_Init_entry27(Timer_Init_entry27_payload: machine)
{


Timer_target = Timer_Init_entry27_payload;
raise Unit;
}
fun Timer_Init_exit0_rand_1127935100()
{


;

}
fun Timer_Loop_entry0_rand_998658804()
{


;

}
fun Timer_Loop_exit0_rand_1472319974()
{


;

}
fun Timer_TimerStarted_entry40()
{
var _tmp605: bool;


_tmp605 = $;
if(_tmp605)
{

send Timer_target, Timeout;
raise Unit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_388671388()
{


;

}start  state Timer_Init
{entry (payload: machine) {
Timer_Init_entry27(payload);
}
exit  {
Timer_Init_exit0_rand_1127935100();
}
on Unit goto Timer_Loop with   {
Timer_Init_on_Unit_goto_Timer_Loop0_rand_713200358();
}
}
 state Timer_Loop
{entry  {
Timer_Loop_entry0_rand_998658804();
}
exit  {
Timer_Loop_exit0_rand_1472319974();
}
ignore CancelTimer;on StartTimer goto Timer_TimerStarted with  (payload: int) {
Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_118491391();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry40();
}
exit  {
Timer_TimerStarted_exit0_rand_388671388();
}
on Unit goto Timer_Loop with   {
Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_436453176();
}

on CancelTimer goto Timer_Loop with   {
Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47();
}
}
}

machine Replica
{
var Replica_coordinator: machine;
var Replica_data: map[int, int];
var Replica_pendingWriteReq: (int, int, int);
var Replica_shouldCommit: bool;
var Replica_lastSeqNum: int;

fun Replica_HandleReqReplica(Replica_HandleReqReplica_payload: (int, int, int))
{


Replica_pendingWriteReq = Replica_HandleReqReplica_payload;
assert (Replica_pendingWriteReq.0 > Replica_lastSeqNum);
Replica_shouldCommit = Replica_ShouldCommitWrite();
if(Replica_shouldCommit)
{

send Replica_coordinator, RESP_REPLICA_COMMIT, Replica_pendingWriteReq.0;

}
else
{

send Replica_coordinator, RESP_REPLICA_ABORT, Replica_pendingWriteReq.0;

}

}
model fun Replica_ShouldCommitWrite(): bool
{
var _tmp606: bool;


_tmp606 = $;
return (_tmp606);
}
fun Replica_Loop_do_GLOBAL_ABORT87(Replica_Loop_do_GLOBAL_ABORT87_payload: int)
{
var _tmp607: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT87_payload);
_tmp607 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT87_payload);
if(_tmp607)
{

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT87_payload;

}
else
{

;


}

}
fun Replica_Loop_do_GLOBAL_COMMIT93(Replica_Loop_do_GLOBAL_COMMIT93_payload: int)
{
var _tmp608: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT93_payload);
_tmp608 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT93_payload);
if(_tmp608)
{

Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT93_payload;

}
else
{

;


}

}
fun Replica_Loop_do_REQ_REPLICA100(Replica_Loop_do_REQ_REPLICA100_payload: (int, int, int))
{


Replica_HandleReqReplica(Replica_Loop_do_REQ_REPLICA100_payload);
}
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_886911092()
{


;

}
fun Replica_Init_entry66(Replica_Init_entry66_payload: machine)
{


Replica_coordinator = Replica_Init_entry66_payload;
Replica_lastSeqNum = 0;
raise Unit;
}
fun Replica_Init_exit0_rand_769459244()
{


;

}
fun Replica_Loop_entry0_rand_1949924577()
{


;

}
fun Replica_Loop_exit0_rand_1231656712()
{


;

}start  state Replica_Init
{entry (payload: machine) {
Replica_Init_entry66(payload);
}
exit  {
Replica_Init_exit0_rand_769459244();
}
on Unit goto Replica_Loop with   {
Replica_Init_on_Unit_goto_Replica_Loop0_rand_886911092();
}
}
 state Replica_Loop
{entry  {
Replica_Loop_entry0_rand_1949924577();
}
exit  {
Replica_Loop_exit0_rand_1231656712();
}
on GLOBAL_ABORT do  (payload: int) {
Replica_Loop_do_GLOBAL_ABORT87(payload);
}

on GLOBAL_COMMIT do  (payload: int) {
Replica_Loop_do_GLOBAL_COMMIT93(payload);
}

on REQ_REPLICA do  (payload: (int, int, int)) {
Replica_Loop_do_REQ_REPLICA100(payload);
}
}
}

machine Coordinator
{
var Coordinator_data: map[int, int];
var Coordinator_replicas: seq[machine];
var Coordinator_numReplicas: int;
var Coordinator_i: int;
var Coordinator_pendingWriteReq: (machine, int, int);
var Coordinator_replica: machine;
var Coordinator_currSeqNum: int;
var Coordinator_timer: machine;

fun Coordinator_DoRead(Coordinator_DoRead_payload: (machine, int))
{
var _tmp609: bool;
var _tmp610: int;


_tmp609 = (Coordinator_DoRead_payload.1 in Coordinator_data);
if(_tmp609)
{

;

_tmp610 = Coordinator_data[Coordinator_DoRead_payload.1];
send Coordinator_DoRead_payload.0, READ_SUCCESS, _tmp610;

}
else
{

;

send Coordinator_DoRead_payload.0, READ_UNAVAILABLE;

}

}
fun Coordinator_DoWrite(Coordinator_DoWrite_payload: (machine, int, int))
{
var _tmp611: machine;
var _tmp612: (int, int, int);


Coordinator_pendingWriteReq = Coordinator_DoWrite_payload;
Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp611 = Coordinator_replicas[Coordinator_i];
_tmp612 = (Coordinator_currSeqNum, Coordinator_pendingWriteReq.1, Coordinator_pendingWriteReq.2);
send _tmp611, REQ_REPLICA, _tmp612;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_timer, StartTimer, 100;
raise Unit;
}
fun Coordinator_DoGlobalAbort()
{
var _tmp613: machine;


Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp613 = Coordinator_replicas[Coordinator_i];
send _tmp613, GLOBAL_ABORT, Coordinator_currSeqNum;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_pendingWriteReq.0, WRITE_FAIL;
}
fun Coordinator_HandleAbort(Coordinator_HandleAbort_payload: int)
{
var _tmp614: bool;


_tmp614 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
if(_tmp614)
{

Coordinator_DoGlobalAbort();
send Coordinator_timer, CancelTimer;
raise Unit;

}
else
{

;


}

}
fun Coordinator_Loop_do_WRITE_REQ159(Coordinator_Loop_do_WRITE_REQ159_payload: (machine, int, int))
{


Coordinator_DoWrite(Coordinator_Loop_do_WRITE_REQ159_payload);
}
fun Coordinator_Loop_do_READ_REQ161(Coordinator_Loop_do_READ_REQ161_payload: (machine, int))
{


Coordinator_DoRead(Coordinator_Loop_do_READ_REQ161_payload);
}
fun Coordinator_CountVote_do_READ_REQ189(Coordinator_CountVote_do_READ_REQ189_payload: (machine, int))
{


Coordinator_DoRead(Coordinator_CountVote_do_READ_REQ189_payload);
}
fun Coordinator_CountVote_do_RESP_REPLICA_ABORT195(Coordinator_CountVote_do_RESP_REPLICA_ABORT195_payload: int)
{


Coordinator_HandleAbort(Coordinator_CountVote_do_RESP_REPLICA_ABORT195_payload);
}
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1556476338()
{


;

}
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1206989967()
{


;

}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload: int)
{
var _tmp615: bool;


_tmp615 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload);
if(_tmp615)
{

Coordinator_i = (Coordinator_i - 1);

}
else
{

;


}

}
fun Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop197()
{


Coordinator_DoGlobalAbort();
}
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1306151629()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_119778423()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_659409793()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_631636003()
{


;

}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_813243291()
{


;

}
fun Coordinator_Init_entry121(Coordinator_Init_entry121_payload: int)
{
var _tmp616: machine;
var _tmp617: machine;


Coordinator_numReplicas = Coordinator_Init_entry121_payload;
assert (Coordinator_numReplicas > 0);
Coordinator_i = 0;
while((Coordinator_i < Coordinator_numReplicas))
{

_tmp616 = new Replica(this);
Coordinator_replica = _tmp616;
Coordinator_replicas += (Coordinator_i, Coordinator_replica);
Coordinator_i = (Coordinator_i + 1);

}

Coordinator_currSeqNum = 0;
_tmp617 = new Timer(this);
Coordinator_timer = _tmp617;
raise Unit;
}
fun Coordinator_Init_exit0_rand_1362014659()
{


;

}
fun Coordinator_Loop_entry0_rand_90431272()
{


;

}
fun Coordinator_Loop_exit0_rand_57294458()
{


;

}
fun Coordinator_CountVote_entry176()
{
var _tmp618: bool;
var _tmp619: machine;


_tmp618 = (Coordinator_i == 0);
if(_tmp618)
{

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp619 = Coordinator_replicas[Coordinator_i];
send _tmp619, GLOBAL_COMMIT, Coordinator_currSeqNum;
Coordinator_i = (Coordinator_i + 1);

}

Coordinator_data[Coordinator_pendingWriteReq.1] = Coordinator_pendingWriteReq.2;
;

send Coordinator_pendingWriteReq.0, WRITE_SUCCESS;
send Coordinator_timer, CancelTimer;
raise Unit;

}
else
{

;


}

}
fun Coordinator_CountVote_exit0_rand_1840021051()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_2037534099()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_28607714()
{


;

}
fun Coordinator_WaitForTimeout_entry0_rand_1368457103()
{


;

}
fun Coordinator_WaitForTimeout_exit0_rand_660591161()
{


;

}start  state Coordinator_Init
{entry (payload: int) {
Coordinator_Init_entry121(payload);
}
exit  {
Coordinator_Init_exit0_rand_1362014659();
}
on Unit goto Coordinator_Loop with   {
Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1556476338();
}
}
 state Coordinator_Loop
{entry  {
Coordinator_Loop_entry0_rand_90431272();
}
exit  {
Coordinator_Loop_exit0_rand_57294458();
}
on WRITE_REQ do  (payload: (machine, int, int)) {
Coordinator_Loop_do_WRITE_REQ159(payload);
}

on READ_REQ do  (payload: (machine, int)) {
Coordinator_Loop_do_READ_REQ161(payload);
}

ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Unit goto Coordinator_CountVote with   {
Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1206989967();
}
}
 state Coordinator_CountVote
{entry  {
Coordinator_CountVote_entry176();
}
exit  {
Coordinator_CountVote_exit0_rand_1840021051();
}
defer WRITE_REQ;
on READ_REQ do  (payload: (machine, int)) {
Coordinator_CountVote_do_READ_REQ189(payload);
}

on RESP_REPLICA_ABORT do  (payload: int) {
Coordinator_CountVote_do_RESP_REPLICA_ABORT195(payload);
}
on RESP_REPLICA_COMMIT goto Coordinator_CountVote with  (payload: int) {
Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191(payload);
}

on Timeout goto Coordinator_Loop with   {
Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop197();
}

on Unit goto Coordinator_WaitForCancelTimerResponse with   {
Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1306151629();
}
}
 state Coordinator_WaitForCancelTimerResponse
{entry  {
Coordinator_WaitForCancelTimerResponse_entry0_rand_2037534099();
}
exit  {
Coordinator_WaitForCancelTimerResponse_exit0_rand_28607714();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_119778423();
}

on CancelTimerSuccess goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_659409793();
}

on CancelTimerFailure goto Coordinator_WaitForTimeout with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_631636003();
}
}
 state Coordinator_WaitForTimeout
{entry  {
Coordinator_WaitForTimeout_entry0_rand_1368457103();
}
exit  {
Coordinator_WaitForTimeout_exit0_rand_660591161();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_813243291();
}
}
}

model Client
{
var Client_coordinator: machine;
var Client_idx: int;
var Client_val: int;

fun Client_ChooseIndex(): int
{
var _tmp620: bool;


_tmp620 = $;
if(_tmp620)
{

return (0);

}
else
{

return (1);

}

}
fun Client_ChooseValue(): int
{
var _tmp621: bool;


_tmp621 = $;
if(_tmp621)
{

return (0);

}
else
{

return (1);

}

}
fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_1653274266()
{


;

}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_1963614272()
{


;

}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1328830399()
{


;

}
fun Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_448774279()
{


;

}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_1560003785()
{


;

}
fun Client_Init_entry228(Client_Init_entry228_payload: machine)
{


Client_coordinator = Client_Init_entry228_payload;
raise Unit;
}
fun Client_Init_exit0_rand_1541557475()
{


;

}
fun Client_DoWrite_entry237()
{
var _tmp622: (machine, int, int);


Client_idx = Client_ChooseIndex();
Client_val = Client_ChooseValue();
_tmp622 = (this, Client_idx, Client_val);
send Client_coordinator, WRITE_REQ, _tmp622;
}
fun Client_DoWrite_exit0_rand_958249404()
{


;

}
fun Client_DoRead_entry247()
{
var _tmp623: (machine, int);


_tmp623 = (this, Client_idx);
send Client_coordinator, READ_REQ, _tmp623;
}
fun Client_DoRead_exit0_rand_1273116995()
{


;

}
fun Client_End_entry0_rand_1626429048()
{


;

}
fun Client_End_exit0_rand_1086154301()
{


;

}start  state Client_Init
{entry (payload: machine) {
Client_Init_entry228(payload);
}
exit  {
Client_Init_exit0_rand_1541557475();
}
on Unit goto Client_DoWrite with   {
Client_Init_on_Unit_goto_Client_DoWrite0_rand_1653274266();
}
}
 state Client_DoWrite
{entry  {
Client_DoWrite_entry237();
}
exit  {
Client_DoWrite_exit0_rand_958249404();
}
on WRITE_FAIL goto Client_End with   {
Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_1963614272();
}

on WRITE_SUCCESS goto Client_DoRead with   {
Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1328830399();
}
}
 state Client_DoRead
{entry  {
Client_DoRead_entry247();
}
exit  {
Client_DoRead_exit0_rand_1273116995();
}
on READ_FAIL goto Client_End with   {
Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_448774279();
}

on READ_SUCCESS goto Client_End with  (payload: int) {
Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_1560003785();
}
}
 state Client_End
{entry  {
Client_End_entry0_rand_1626429048();
}
exit  {
Client_End_exit0_rand_1086154301();
}
}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;
var TwoPhaseCommit_client: machine;

fun TwoPhaseCommit_Init_entry294()
{
var _tmp624: machine;
var _tmp625: machine;
var _tmp626: machine;


_tmp624 = new Coordinator(2);
TwoPhaseCommit_coordinator = _tmp624;
_tmp625 = new Client(TwoPhaseCommit_coordinator);
TwoPhaseCommit_client = _tmp625;
_tmp626 = new Client(TwoPhaseCommit_coordinator);
TwoPhaseCommit_client = _tmp626;
}
fun TwoPhaseCommit_Init_exit0_rand_283344463()
{


;

}start  state TwoPhaseCommit_Init
{entry  {
TwoPhaseCommit_Init_entry294();
}
exit  {
TwoPhaseCommit_Init_exit0_rand_283344463();
}
}
}

