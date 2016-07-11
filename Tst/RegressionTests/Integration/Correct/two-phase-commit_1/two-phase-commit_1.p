event REQ_REPLICA: (int, int, int);
event RESP_REPLICA_COMMIT: int;
event RESP_REPLICA_ABORT: int;
event GLOBAL_ABORT: int;
event GLOBAL_COMMIT: int;
event WRITE_REQ: (machine, int, int);
event WRITE_FAIL;
event WRITE_SUCCESS;
event READ_REQ_REPLICA: int;
event READ_REQ: (machine, int);
event READ_FAIL;
event READ_SUCCESS: int;
event REP_READ_FAIL;
event REP_READ_SUCCESS: int;
event Unit;
event Timeout;
event StartTimer: int;
event CancelTimer;
event CancelTimerFailure;
event CancelTimerSuccess;
event MONITOR_WRITE_SUCCESS: (machine, int, int);
event MONITOR_WRITE_FAILURE: (machine, int, int);
event MONITOR_READ_SUCCESS: (machine, int, int);
event MONITOR_READ_FAILURE: machine;
event MONITOR_UPDATE: (machine, int, int);
event goEnd;
event final;

model Timer
{
var Timer_target: machine;

fun Timer_Init_entry36(Timer_Init_entry36_payload: machine)
{


Timer_target = Timer_Init_entry36_payload;
;
raise Unit;


}
fun Timer_Init_exit0_rand_783211059()
{


;


}
fun Timer_Loop_entry0_rand_1568604359(Timer_Loop_entry0_rand_1568604359__payload_skip: any)
{


;


}
fun Timer_Loop_exit0_rand_4387724()
{


;


}
fun Timer_TimerStarted_entry49(Timer_TimerStarted_entry49__payload_0: any)
{
var _tmp1209: bool;


_tmp1209 = $;
;
if(_tmp1209)
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
fun Timer_TimerStarted_exit0_rand_1535062985()
{


;


}
fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_1328958167(Timer_Init_on_Unit_goto_Timer_Loop0_rand_1328958167__payload_skip: any)
{


;


}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_79880534(Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_79880534__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_1957481705(Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_1957481705__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56(Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56__payload_1: any)
{
var _tmp1210: bool;


_tmp1210 = $;
;
if(_tmp1210)
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
Timer_Init_entry36(payload);
}
exit  {
Timer_Init_exit0_rand_783211059();
}
}
 state Timer_Loop
{entry (payload: any) {
Timer_Loop_entry0_rand_1568604359(payload);
}
exit  {
Timer_Loop_exit0_rand_4387724();
}
}
 state Timer_TimerStarted
{entry (payload: any) {
Timer_TimerStarted_entry49(payload);
}
exit  {
Timer_TimerStarted_exit0_rand_1535062985();
}
}
}

machine Replica
{
var Replica_coordinator: machine;
var Replica_data: map[int, int];
var Replica_pendingWriteReq: (int, int, int);
var Replica_lastSeqNum: int;
var Replica_shouldCommit: bool;

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
var _tmp1211: bool;


_tmp1211 = $;
;
return (_tmp1211);


}
fun Replica_Init_entry75(Replica_Init_entry75_payload: machine)
{


Replica_coordinator = Replica_Init_entry75_payload;
;
Replica_lastSeqNum = 0;
;
raise Unit;


}
fun Replica_Init_exit0_rand_584224388()
{


;


}
fun Replica_Loop_entry0_rand_2041774795(Replica_Loop_entry0_rand_2041774795__payload_skip: any)
{


;


}
fun Replica_Loop_exit0_rand_905563504()
{


;


}
fun Replica_Loop_do_GLOBAL_ABORT96(Replica_Loop_do_GLOBAL_ABORT96_payload: int)
{
var _tmp1212: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT96_payload);
;
_tmp1212 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT96_payload);
;
if(_tmp1212)
{

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT96_payload;
;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT96_payload;



}
else
{

;
;
;



}


}
fun Replica_Loop_do_GLOBAL_COMMIT102(Replica_Loop_do_GLOBAL_COMMIT102_payload: int)
{
var _tmp1213: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT102_payload);
;
_tmp1213 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT102_payload);
;
if(_tmp1213)
{

Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT102_payload;
;
Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT102_payload;



}
else
{

;
;
;



}


}
fun Replica_Loop_do_REQ_REPLICA109(Replica_Loop_do_REQ_REPLICA109_payload: (int, int, int))
{


Replica_HandleReqReplica(Replica_Loop_do_REQ_REPLICA109_payload);


}
fun Replica_Loop_do_READ_REQ_REPLICA111(Replica_Loop_do_READ_REQ_REPLICA111_payload: int)
{
var _tmp1214: bool;
var _tmp1215: int;


_tmp1214 = (Replica_Loop_do_READ_REQ_REPLICA111_payload in Replica_data);
;
if(_tmp1214)
{

_tmp1215 = Replica_data[Replica_Loop_do_READ_REQ_REPLICA111_payload];
;
send Replica_coordinator, REP_READ_SUCCESS, _tmp1215;
;
send Replica_coordinator, REP_READ_SUCCESS, Replica_data[Replica_Loop_do_READ_REQ_REPLICA111_payload];



}
else
{

send Replica_coordinator, REP_READ_FAIL;
;
send Replica_coordinator, REP_READ_FAIL;



}


}
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_573167332(Replica_Init_on_Unit_goto_Replica_Loop0_rand_573167332__payload_skip: any)
{


;


}start  state Replica_Init
{entry (payload: machine) {
Replica_Init_entry75(payload);
}
exit  {
Replica_Init_exit0_rand_584224388();
}
}
 state Replica_Loop
{entry (payload: any) {
Replica_Loop_entry0_rand_2041774795(payload);
}
exit  {
Replica_Loop_exit0_rand_905563504();
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
var Coordinator_client: machine;
var Coordinator_key: int;
var Coordinator_readResult: (bool, int);

fun Coordinator_DoWrite(Coordinator_DoWrite_pendingWriteReq: (machine, int, int))
{
var _tmp1216: machine;
var _tmp1217: (int, int, int);


Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
;
Coordinator_i = 0;
;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp1216 = Coordinator_replicas[Coordinator_i];
;
_tmp1217 = (Coordinator_currSeqNum, Coordinator_DoWrite_pendingWriteReq.1, Coordinator_DoWrite_pendingWriteReq.2);
;
send _tmp1216, REQ_REPLICA, _tmp1217;
;
Coordinator_i = (Coordinator_i + 1);
;
send Coordinator_replicas[Coordinator_i], REQ_REPLICA, (Coordinator_currSeqNum, Coordinator_DoWrite_pendingWriteReq.1, Coordinator_DoWrite_pendingWriteReq.2);
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
var _tmp1218: machine;


Coordinator_i = 0;
;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp1218 = Coordinator_replicas[Coordinator_i];
;
send _tmp1218, GLOBAL_ABORT, Coordinator_currSeqNum;
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
var _tmp1219: bool;


_tmp1219 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
;
if(_tmp1219)
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
fun Coordinator_Init_entry138(Coordinator_Init_entry138_payload: int)
{
var _tmp1220: machine;
var _tmp1221: machine;


Coordinator_numReplicas = Coordinator_Init_entry138_payload;
;
assert (Coordinator_numReplicas > 0);
;
Coordinator_i = 0;
;
while((Coordinator_i < Coordinator_numReplicas))
{

_tmp1220 = new Replica(this);
;
Coordinator_replica = _tmp1220;
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
_tmp1221 = new Timer(this);
;
Coordinator_timer = _tmp1221;
;
raise Unit;


}
fun Coordinator_Init_exit0_rand_1925906442()
{


;


}
fun Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166(env: ((machine, int)), Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1: int): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var _tmp1222: (bool, int);
var _tmp1223: ((machine, int));


Coordinator_DoRead_entry156_payload = env.0;
;
_tmp1222 = (false, Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1);
;
Coordinator_readResult = _tmp1222;
;
_tmp1223 = (Coordinator_DoRead_entry156_payload,);
;
return (_tmp1223);


}
fun Coordinator_DoRead_entry156_case_REP_READ_FAIL165(env: ((machine, int))): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var _tmp1224: (bool, int);
var _tmp1225: ((machine, int));


Coordinator_DoRead_entry156_payload = env.0;
;
_tmp1224 = (true, ~(1));
;
Coordinator_readResult = _tmp1224;
;
_tmp1225 = (Coordinator_DoRead_entry156_payload,);
;
return (_tmp1225);


}
fun Coordinator_DoRead_entry156(Coordinator_DoRead_entry156_payload: (machine, int))
{
var _tmp1226: bool;
var _tmp1227: machine;
var _tmp1228: machine;


Coordinator_client = Coordinator_DoRead_entry156_payload.0;
;
Coordinator_key = Coordinator_DoRead_entry156_payload.1;
;
_tmp1226 = $;
;
if(_tmp1226)
{

_tmp1227 = Coordinator_replicas[0];
;
send _tmp1227, READ_REQ_REPLICA, Coordinator_key;
;
send Coordinator_replicas[0], READ_REQ_REPLICA, Coordinator_key;



}
else
{

_tmp1228 = Coordinator_replicas[(sizeof(Coordinator_replicas) - 1)];
;
send _tmp1228, READ_REQ_REPLICA, Coordinator_key;
;
send Coordinator_replicas[(sizeof(Coordinator_replicas) - 1)], READ_REQ_REPLICA, Coordinator_key;



}
;
receive
{
case REP_READ_SUCCESS:  (payload: int) {
var env: ((machine, int));
env = Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166((Coordinator_DoRead_entry156_payload,), payload);
Coordinator_DoRead_entry156_payload=env.0;
}

case REP_READ_FAIL:   {
var env: ((machine, int));
env = Coordinator_DoRead_entry156_case_REP_READ_FAIL165((Coordinator_DoRead_entry156_payload,));
Coordinator_DoRead_entry156_payload=env.0;
}

}
;
if(Coordinator_readResult.0)
{

raise READ_FAIL;
;
raise READ_FAIL;



}
else
{

raise READ_SUCCESS, Coordinator_readResult.1;
;
raise READ_SUCCESS, Coordinator_readResult.1;



}


}
fun Coordinator_DoRead_exit0_rand_1608458499()
{


;


}
fun Coordinator_Loop_entry0_rand_1396650256(Coordinator_Loop_entry0_rand_1396650256__payload_skip: any)
{


;


}
fun Coordinator_Loop_exit0_rand_1633666688()
{


;


}
fun Coordinator_CountVote_entry214(Coordinator_CountVote_entry214__payload_4: any)
{
var _tmp1229: bool;
var _tmp1230: machine;


_tmp1229 = (Coordinator_i == 0);
;
if(_tmp1229)
{

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp1230 = Coordinator_replicas[Coordinator_i];
;
send _tmp1230, GLOBAL_COMMIT, Coordinator_currSeqNum;
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
fun Coordinator_CountVote_exit0_rand_397012003()
{


;


}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_1038638752(Coordinator_WaitForCancelTimerResponse_entry0_rand_1038638752__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_1960959971()
{


;


}
fun Coordinator_WaitForTimeout_entry0_rand_2144848137(Coordinator_WaitForTimeout_entry0_rand_2144848137__payload_skip: any)
{


;


}
fun Coordinator_WaitForTimeout_exit0_rand_249510860()
{


;


}
fun Coordinator_Loop_do_WRITE_REQ197(Coordinator_Loop_do_WRITE_REQ197_payload: (machine, int, int))
{


Coordinator_DoWrite(Coordinator_Loop_do_WRITE_REQ197_payload);


}
fun Coordinator_CountVote_do_RESP_REPLICA_ABORT232(Coordinator_CountVote_do_RESP_REPLICA_ABORT232_payload: int)
{


Coordinator_HandleAbort(Coordinator_CountVote_do_RESP_REPLICA_ABORT232_payload);


}
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1166605666(Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1166605666__payload_skip: any)
{


;


}
fun Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175(Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175__payload_3: any)
{


send Coordinator_client, READ_FAIL;


}
fun Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179(Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179_payload: int)
{


send Coordinator_client, READ_SUCCESS, Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179_payload;


}
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1077331220(Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1077331220__payload_skip: any)
{


;


}
fun Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_748170759(Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_748170759__payload_skip: any)
{


;


}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload: int)
{
var _tmp1231: bool;


_tmp1231 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload);
;
if(_tmp1231)
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
fun Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop234(Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop234__payload_5: any)
{


Coordinator_DoGlobalAbort();


}
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_647191460(Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_647191460__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1388938456(Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1388938456__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_2096387868(Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_2096387868__payload_skip: any)
{


;


}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_785127396(Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_785127396__payload_skip: any)
{


;


}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_818341975(Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_818341975__payload_skip: any)
{


;


}start  state Coordinator_Init
{entry (payload: int) {
Coordinator_Init_entry138(payload);
}
exit  {
Coordinator_Init_exit0_rand_1925906442();
}
}
 state Coordinator_DoRead
{entry (payload: (machine, int)) {
Coordinator_DoRead_entry156(payload);
}
exit  {
Coordinator_DoRead_exit0_rand_1608458499();
}
}
 state Coordinator_Loop
{entry (payload: any) {
Coordinator_Loop_entry0_rand_1396650256(payload);
}
exit  {
Coordinator_Loop_exit0_rand_1633666688();
}
}
 state Coordinator_CountVote
{entry (payload: any) {
Coordinator_CountVote_entry214(payload);
}
exit  {
Coordinator_CountVote_exit0_rand_397012003();
}
}
 state Coordinator_WaitForCancelTimerResponse
{entry (payload: any) {
Coordinator_WaitForCancelTimerResponse_entry0_rand_1038638752(payload);
}
exit  {
Coordinator_WaitForCancelTimerResponse_exit0_rand_1960959971();
}
}
 state Coordinator_WaitForTimeout
{entry (payload: any) {
Coordinator_WaitForTimeout_entry0_rand_2144848137(payload);
}
exit  {
Coordinator_WaitForTimeout_exit0_rand_249510860();
}
}
}

model Client
{
var Client_coordinator: machine;
var Client_mydata: int;
var Client_counter: int;

fun Client_Init_entry269(Client_Init_entry269_payload: (machine, int))
{


Client_coordinator = Client_Init_entry269_payload.0;
;
Client_mydata = Client_Init_entry269_payload.1;
;
Client_counter = 0;
;
raise Unit;


}
fun Client_Init_exit0_rand_2085762425()
{


;


}
fun Client_DoWrite_entry280(Client_DoWrite_entry280__payload_6: any)
{
var _tmp1232: bool;
var _tmp1233: (machine, int, int);


Client_mydata = (Client_mydata + 1);
;
Client_counter = (Client_counter + 1);
;
_tmp1232 = (Client_counter == 3);
;
if(_tmp1232)
{

raise goEnd;
;
raise goEnd;



}
else
{

;
;
;



}
;
_tmp1233 = (this, Client_mydata, Client_mydata);
;
send Client_coordinator, WRITE_REQ, _tmp1233;


}
fun Client_DoWrite_exit0_rand_473816574()
{


;


}
fun Client_DoRead_entry293(Client_DoRead_entry293__payload_7: any)
{
var _tmp1234: (machine, int);


_tmp1234 = (this, Client_mydata);
;
send Client_coordinator, READ_REQ, _tmp1234;


}
fun Client_DoRead_exit0_rand_521105919()
{


;


}
fun Client_End_entry0_rand_697198643(Client_End_entry0_rand_697198643__payload_skip: any)
{


;


}
fun Client_End_exit0_rand_448604460()
{


;


}
fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_1263571622(Client_Init_on_Unit_goto_Client_DoWrite0_rand_1263571622__payload_skip: any)
{


;


}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_1157162510(Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_1157162510__payload_skip: any)
{


;


}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1097262999(Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1097262999__payload_skip: any)
{


;


}
fun Client_DoWrite_on_goEnd_goto_Client_End0_rand_1638077244(Client_DoWrite_on_goEnd_goto_Client_End0_rand_1638077244__payload_skip: any)
{


;


}
fun Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_884987715(Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_884987715__payload_skip: any)
{


;


}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_816213320(Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_816213320__payload_skip: any)
{


;


}start  state Client_Init
{entry (payload: (machine, int)) {
Client_Init_entry269(payload);
}
exit  {
Client_Init_exit0_rand_2085762425();
}
}
 state Client_DoWrite
{entry (payload: any) {
Client_DoWrite_entry280(payload);
}
exit  {
Client_DoWrite_exit0_rand_473816574();
}
}
 state Client_DoRead
{entry (payload: any) {
Client_DoRead_entry293(payload);
}
exit  {
Client_DoRead_exit0_rand_521105919();
}
}
 state Client_End
{entry (payload: any) {
Client_End_entry0_rand_697198643(payload);
}
exit  {
Client_End_exit0_rand_448604460();
}
}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;

fun TwoPhaseCommit_Init_entry308(TwoPhaseCommit_Init_entry308__payload_8: any)
{
var _tmp1235: machine;
var _tmp1236: (machine, int);
var _tmp1237: (machine, int);


_tmp1235 = new Coordinator(2);
;
TwoPhaseCommit_coordinator = _tmp1235;
;
_tmp1236 = (TwoPhaseCommit_coordinator, 100);
;
new Client(_tmp1236);
;
_tmp1237 = (TwoPhaseCommit_coordinator, 200);
;
new Client(_tmp1237);


}
fun TwoPhaseCommit_Init_exit0_rand_773710558()
{


;


}start  state TwoPhaseCommit_Init
{entry (payload: any) {
TwoPhaseCommit_Init_entry308(payload);
}
exit  {
TwoPhaseCommit_Init_exit0_rand_773710558();
}
}
}

