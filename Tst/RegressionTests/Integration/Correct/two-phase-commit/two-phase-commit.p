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

fun Timer_Init_entry27(Timer_Init_entry27_payload: machine)
{


Timer_target = Timer_Init_entry27_payload;
;
raise Unit;


}
fun Timer_Init_exit0_rand_1231610387()
{


;


}
fun Timer_Loop_entry0_rand_2008201582(Timer_Loop_entry0_rand_2008201582__payload_skip: any)
{


;


}
fun Timer_Loop_exit0_rand_1973718516()
{


;


}
fun Timer_TimerStarted_entry40(Timer_TimerStarted_entry40__payload_0: any)
{
var _tmp1186: bool;


_tmp1186 = $;
;
if(_tmp1186)
{

send Timer_target, Timeout;
;
raise Unit;
;
send Timer_target, Timeout;
;
raise Unit;



}
else
{

;
;
;



}


}
fun Timer_TimerStarted_exit0_rand_1826859933()
{


;


}
fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_710504468(Timer_Init_on_Unit_goto_Timer_Loop0_rand_710504468__payload_skip: any)
{


;


}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_1311002939(Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_1311002939__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_1525114056(Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_1525114056__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47(Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47__payload_1: any)
{
var _tmp1187: bool;


_tmp1187 = $;
;
if(_tmp1187)
{

send Timer_target, CancelTimerFailure;
;
send Timer_target, Timeout;
;
send Timer_target, CancelTimerFailure;
;
send Timer_target, Timeout;



}
else
{

send Timer_target, CancelTimerSuccess;
;
send Timer_target, CancelTimerSuccess;



}


}start  state Timer_Init
{entry (payload: machine) {
Timer_Init_entry27(payload);
}
exit  {
Timer_Init_exit0_rand_1231610387();
}
}
 state Timer_Loop
{entry (payload: any) {
Timer_Loop_entry0_rand_2008201582(payload);
}
exit  {
Timer_Loop_exit0_rand_1973718516();
}
}
 state Timer_TimerStarted
{entry (payload: any) {
Timer_TimerStarted_entry40(payload);
}
exit  {
Timer_TimerStarted_exit0_rand_1826859933();
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
;
assert (Replica_pendingWriteReq.0 > Replica_lastSeqNum);
;
Replica_shouldCommit = Replica_ShouldCommitWrite();
;
if(Replica_shouldCommit)
{

send Replica_coordinator, RESP_REPLICA_COMMIT, Replica_pendingWriteReq.0;
;
send Replica_coordinator, RESP_REPLICA_COMMIT, Replica_pendingWriteReq.0;



}
else
{

send Replica_coordinator, RESP_REPLICA_ABORT, Replica_pendingWriteReq.0;
;
send Replica_coordinator, RESP_REPLICA_ABORT, Replica_pendingWriteReq.0;



}


}
model fun Replica_ShouldCommitWrite(): bool
{
var _tmp1188: bool;


_tmp1188 = $;
;
return (_tmp1188);


}
fun Replica_Init_entry66(Replica_Init_entry66_payload: machine)
{


Replica_coordinator = Replica_Init_entry66_payload;
;
Replica_lastSeqNum = 0;
;
raise Unit;


}
fun Replica_Init_exit0_rand_844314385()
{


;


}
fun Replica_Loop_entry0_rand_537471626(Replica_Loop_entry0_rand_537471626__payload_skip: any)
{


;


}
fun Replica_Loop_exit0_rand_863113778()
{


;


}
fun Replica_Loop_do_GLOBAL_ABORT87(Replica_Loop_do_GLOBAL_ABORT87_payload: int)
{
var _tmp1189: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT87_payload);
;
_tmp1189 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT87_payload);
;
if(_tmp1189)
{

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT87_payload;
;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT87_payload;



}
else
{

;
;
;



}


}
fun Replica_Loop_do_GLOBAL_COMMIT93(Replica_Loop_do_GLOBAL_COMMIT93_payload: int)
{
var _tmp1190: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT93_payload);
;
_tmp1190 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT93_payload);
;
if(_tmp1190)
{

Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT93_payload;
;
Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT93_payload;



}
else
{

;
;
;



}


}
fun Replica_Loop_do_REQ_REPLICA100(Replica_Loop_do_REQ_REPLICA100_payload: (int, int, int))
{


Replica_HandleReqReplica(Replica_Loop_do_REQ_REPLICA100_payload);


}
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_1053149375(Replica_Init_on_Unit_goto_Replica_Loop0_rand_1053149375__payload_skip: any)
{


;


}start  state Replica_Init
{entry (payload: machine) {
Replica_Init_entry66(payload);
}
exit  {
Replica_Init_exit0_rand_844314385();
}
}
 state Replica_Loop
{entry (payload: any) {
Replica_Loop_entry0_rand_537471626(payload);
}
exit  {
Replica_Loop_exit0_rand_863113778();
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
var _tmp1191: bool;
var _tmp1192: int;


_tmp1191 = (Coordinator_DoRead_payload.1 in Coordinator_data);
;
if(_tmp1191)
{

;
;
_tmp1192 = Coordinator_data[Coordinator_DoRead_payload.1];
;
send Coordinator_DoRead_payload.0, READ_SUCCESS, _tmp1192;
;
;
;
send Coordinator_DoRead_payload.0, READ_SUCCESS, Coordinator_data[Coordinator_DoRead_payload.1];



}
else
{

;
;
send Coordinator_DoRead_payload.0, READ_UNAVAILABLE;
;
;
;
send Coordinator_DoRead_payload.0, READ_UNAVAILABLE;



}


}
fun Coordinator_DoWrite(Coordinator_DoWrite_payload: (machine, int, int))
{
var _tmp1193: machine;
var _tmp1194: (int, int, int);


Coordinator_pendingWriteReq = Coordinator_DoWrite_payload;
;
Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
;
Coordinator_i = 0;
;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp1193 = Coordinator_replicas[Coordinator_i];
;
_tmp1194 = (Coordinator_currSeqNum, Coordinator_pendingWriteReq.1, Coordinator_pendingWriteReq.2);
;
send _tmp1193, REQ_REPLICA, _tmp1194;
;
Coordinator_i = (Coordinator_i + 1);
;
send Coordinator_replicas[Coordinator_i], REQ_REPLICA, (Coordinator_currSeqNum, Coordinator_pendingWriteReq.1, Coordinator_pendingWriteReq.2);
;
Coordinator_i = (Coordinator_i + 1);



}
;
send Coordinator_timer, StartTimer, 100;
;
raise Unit;


}
fun Coordinator_DoGlobalAbort()
{
var _tmp1195: machine;


Coordinator_i = 0;
;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp1195 = Coordinator_replicas[Coordinator_i];
;
send _tmp1195, GLOBAL_ABORT, Coordinator_currSeqNum;
;
Coordinator_i = (Coordinator_i + 1);
;
send Coordinator_replicas[Coordinator_i], GLOBAL_ABORT, Coordinator_currSeqNum;
;
Coordinator_i = (Coordinator_i + 1);



}
;
send Coordinator_pendingWriteReq.0, WRITE_FAIL;


}
fun Coordinator_HandleAbort(Coordinator_HandleAbort_payload: int)
{
var _tmp1196: bool;


_tmp1196 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
;
if(_tmp1196)
{

Coordinator_DoGlobalAbort();
;
send Coordinator_timer, CancelTimer;
;
raise Unit;
;
Coordinator_DoGlobalAbort();
;
send Coordinator_timer, CancelTimer;
;
raise Unit;



}
else
{

;
;
;



}


}
fun Coordinator_Init_entry121(Coordinator_Init_entry121_payload: int)
{
var _tmp1197: machine;
var _tmp1198: machine;


Coordinator_numReplicas = Coordinator_Init_entry121_payload;
;
assert (Coordinator_numReplicas > 0);
;
Coordinator_i = 0;
;
while((Coordinator_i < Coordinator_numReplicas))
{

_tmp1197 = new Replica(this);
;
Coordinator_replica = _tmp1197;
;
Coordinator_replicas += (Coordinator_i, Coordinator_replica);
;
Coordinator_i = (Coordinator_i + 1);
;
Coordinator_replica = new Replica(this);
;
Coordinator_replicas += (Coordinator_i, Coordinator_replica);
;
Coordinator_i = (Coordinator_i + 1);



}
;
Coordinator_currSeqNum = 0;
;
_tmp1198 = new Timer(this);
;
Coordinator_timer = _tmp1198;
;
raise Unit;


}
fun Coordinator_Init_exit0_rand_1352495573()
{


;


}
fun Coordinator_Loop_entry0_rand_1080970765(Coordinator_Loop_entry0_rand_1080970765__payload_skip: any)
{


;


}
fun Coordinator_Loop_exit0_rand_651853553()
{


;


}
fun Coordinator_CountVote_entry176(Coordinator_CountVote_entry176__payload_2: any)
{
var _tmp1199: bool;
var _tmp1200: machine;


_tmp1199 = (Coordinator_i == 0);
;
if(_tmp1199)
{

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp1200 = Coordinator_replicas[Coordinator_i];
;
send _tmp1200, GLOBAL_COMMIT, Coordinator_currSeqNum;
;
Coordinator_i = (Coordinator_i + 1);
;
send Coordinator_replicas[Coordinator_i], GLOBAL_COMMIT, Coordinator_currSeqNum;
;
Coordinator_i = (Coordinator_i + 1);



}
;
Coordinator_data[Coordinator_pendingWriteReq.1] = Coordinator_pendingWriteReq.2;
;
;
;
send Coordinator_pendingWriteReq.0, WRITE_SUCCESS;
;
send Coordinator_timer, CancelTimer;
;
raise Unit;
;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

send Coordinator_replicas[Coordinator_i], GLOBAL_COMMIT, Coordinator_currSeqNum;
;
Coordinator_i = (Coordinator_i + 1);



}
;
Coordinator_data[Coordinator_pendingWriteReq.1] = Coordinator_pendingWriteReq.2;
;
;
;
send Coordinator_pendingWriteReq.0, WRITE_SUCCESS;
;
send Coordinator_timer, CancelTimer;
;
raise Unit;



}
else
{

;
;
;



}


}
fun Coordinator_CountVote_exit0_rand_801433543()
{


;


}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_1850548482(Coordinator_WaitForCancelTimerResponse_entry0_rand_1850548482__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_700404030()
{


;


}
fun Coordinator_WaitForTimeout_entry0_rand_566767002(Coordinator_WaitForTimeout_entry0_rand_566767002__payload_skip: any)
{


;


}
fun Coordinator_WaitForTimeout_exit0_rand_1666422024()
{


;


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
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1662839865(Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1662839865__payload_skip: any)
{


;


}
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_457591092(Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_457591092__payload_skip: any)
{


;


}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload: int)
{
var _tmp1201: bool;


_tmp1201 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload);
;
if(_tmp1201)
{

Coordinator_i = (Coordinator_i - 1);
;
Coordinator_i = (Coordinator_i - 1);



}
else
{

;
;
;



}


}
fun Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop197(Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop197__payload_3: any)
{


Coordinator_DoGlobalAbort();


}
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1053115720(Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1053115720__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_779328241(Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_779328241__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_2061848746(Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_2061848746__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_1722005980(Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_1722005980__payload_skip: any)
{


;


}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_53262784(Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_53262784__payload_skip: any)
{


;


}start  state Coordinator_Init
{entry (payload: int) {
Coordinator_Init_entry121(payload);
}
exit  {
Coordinator_Init_exit0_rand_1352495573();
}
}
 state Coordinator_Loop
{entry (payload: any) {
Coordinator_Loop_entry0_rand_1080970765(payload);
}
exit  {
Coordinator_Loop_exit0_rand_651853553();
}
}
 state Coordinator_CountVote
{entry (payload: any) {
Coordinator_CountVote_entry176(payload);
}
exit  {
Coordinator_CountVote_exit0_rand_801433543();
}
}
 state Coordinator_WaitForCancelTimerResponse
{entry (payload: any) {
Coordinator_WaitForCancelTimerResponse_entry0_rand_1850548482(payload);
}
exit  {
Coordinator_WaitForCancelTimerResponse_exit0_rand_700404030();
}
}
 state Coordinator_WaitForTimeout
{entry (payload: any) {
Coordinator_WaitForTimeout_entry0_rand_566767002(payload);
}
exit  {
Coordinator_WaitForTimeout_exit0_rand_1666422024();
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
var _tmp1202: bool;


_tmp1202 = $;
;
if(_tmp1202)
{

return (0);
;
return (0);



}
else
{

return (1);
;
return (1);



}


}
fun Client_ChooseValue(): int
{
var _tmp1203: bool;


_tmp1203 = $;
;
if(_tmp1203)
{

return (0);
;
return (0);



}
else
{

return (1);
;
return (1);



}


}
fun Client_Init_entry228(Client_Init_entry228_payload: machine)
{


Client_coordinator = Client_Init_entry228_payload;
;
raise Unit;


}
fun Client_Init_exit0_rand_962939272()
{


;


}
fun Client_DoWrite_entry237(Client_DoWrite_entry237__payload_4: any)
{
var _tmp1204: (machine, int, int);


Client_idx = Client_ChooseIndex();
;
Client_val = Client_ChooseValue();
;
_tmp1204 = (this, Client_idx, Client_val);
;
send Client_coordinator, WRITE_REQ, _tmp1204;


}
fun Client_DoWrite_exit0_rand_2046782681()
{


;


}
fun Client_DoRead_entry247(Client_DoRead_entry247__payload_5: any)
{
var _tmp1205: (machine, int);


_tmp1205 = (this, Client_idx);
;
send Client_coordinator, READ_REQ, _tmp1205;


}
fun Client_DoRead_exit0_rand_578283222()
{


;


}
fun Client_End_entry0_rand_1101650723(Client_End_entry0_rand_1101650723__payload_skip: any)
{


;


}
fun Client_End_exit0_rand_1025656582()
{


;


}
fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_1203357022(Client_Init_on_Unit_goto_Client_DoWrite0_rand_1203357022__payload_skip: any)
{


;


}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_1458949221(Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_1458949221__payload_skip: any)
{


;


}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_617862781(Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_617862781__payload_skip: any)
{


;


}
fun Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_881294628(Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_881294628__payload_skip: any)
{


;


}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_144597297(Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_144597297__payload_skip: any)
{


;


}start  state Client_Init
{entry (payload: machine) {
Client_Init_entry228(payload);
}
exit  {
Client_Init_exit0_rand_962939272();
}
}
 state Client_DoWrite
{entry (payload: any) {
Client_DoWrite_entry237(payload);
}
exit  {
Client_DoWrite_exit0_rand_2046782681();
}
}
 state Client_DoRead
{entry (payload: any) {
Client_DoRead_entry247(payload);
}
exit  {
Client_DoRead_exit0_rand_578283222();
}
}
 state Client_End
{entry (payload: any) {
Client_End_entry0_rand_1101650723(payload);
}
exit  {
Client_End_exit0_rand_1025656582();
}
}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;
var TwoPhaseCommit_client: machine;

fun TwoPhaseCommit_Init_entry294(TwoPhaseCommit_Init_entry294__payload_6: any)
{
var _tmp1206: machine;
var _tmp1207: machine;
var _tmp1208: machine;


_tmp1206 = new Coordinator(2);
;
TwoPhaseCommit_coordinator = _tmp1206;
;
_tmp1207 = new Client(TwoPhaseCommit_coordinator);
;
TwoPhaseCommit_client = _tmp1207;
;
_tmp1208 = new Client(TwoPhaseCommit_coordinator);
;
TwoPhaseCommit_client = _tmp1208;


}
fun TwoPhaseCommit_Init_exit0_rand_1469212103()
{


;


}start  state TwoPhaseCommit_Init
{entry (payload: any) {
TwoPhaseCommit_Init_entry294(payload);
}
exit  {
TwoPhaseCommit_Init_exit0_rand_1469212103();
}
}
}

