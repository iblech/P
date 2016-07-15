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

fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_1892318067()
{


;

}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_443076867()
{


;

}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_1919376283()
{


;

}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56()
{
var _tmp627: bool;


_tmp627 = $;
if(_tmp627)
{

send Timer_target, CancelTimerFailure;
send Timer_target, Timeout;

}
else
{

send Timer_target, CancelTimerSuccess;

}

}
fun Timer_Init_entry36(Timer_Init_entry36_payload: machine)
{


Timer_target = Timer_Init_entry36_payload;
raise Unit;
}
fun Timer_Init_exit0_rand_910759428()
{


;

}
fun Timer_Loop_entry0_rand_1034318326()
{


;

}
fun Timer_Loop_exit0_rand_1221922164()
{


;

}
fun Timer_TimerStarted_entry49()
{
var _tmp628: bool;


_tmp628 = $;
if(_tmp628)
{

send Timer_target, Timeout;
raise Unit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_796479820()
{


;

}start  state Timer_Init
{entry (payload: machine) {
Timer_Init_entry36(payload);
}
exit  {
Timer_Init_exit0_rand_910759428();
}
on Unit goto Timer_Loop with   {
Timer_Init_on_Unit_goto_Timer_Loop0_rand_1892318067();
}
}
 state Timer_Loop
{entry  {
Timer_Loop_entry0_rand_1034318326();
}
exit  {
Timer_Loop_exit0_rand_1221922164();
}
ignore CancelTimer;on StartTimer goto Timer_TimerStarted with  (payload: int) {
Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_443076867();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry49();
}
exit  {
Timer_TimerStarted_exit0_rand_796479820();
}
on Unit goto Timer_Loop with   {
Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_1919376283();
}

on CancelTimer goto Timer_Loop with   {
Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56();
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
var _tmp629: bool;


_tmp629 = $;
return (_tmp629);
}
fun Replica_Loop_do_GLOBAL_ABORT96(Replica_Loop_do_GLOBAL_ABORT96_payload: int)
{
var _tmp630: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT96_payload);
_tmp630 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT96_payload);
if(_tmp630)
{

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT96_payload;

}
else
{

;


}

}
fun Replica_Loop_do_GLOBAL_COMMIT102(Replica_Loop_do_GLOBAL_COMMIT102_payload: int)
{
var _tmp631: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT102_payload);
_tmp631 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT102_payload);
if(_tmp631)
{

Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT102_payload;

}
else
{

;


}

}
fun Replica_Loop_do_REQ_REPLICA109(Replica_Loop_do_REQ_REPLICA109_payload: (int, int, int))
{


Replica_HandleReqReplica(Replica_Loop_do_REQ_REPLICA109_payload);
}
fun Replica_Loop_do_READ_REQ_REPLICA111(Replica_Loop_do_READ_REQ_REPLICA111_payload: int)
{
var _tmp632: bool;
var _tmp633: int;


_tmp632 = (Replica_Loop_do_READ_REQ_REPLICA111_payload in Replica_data);
if(_tmp632)
{

_tmp633 = Replica_data[Replica_Loop_do_READ_REQ_REPLICA111_payload];
send Replica_coordinator, REP_READ_SUCCESS, _tmp633;

}
else
{

send Replica_coordinator, REP_READ_FAIL;

}

}
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_260483190()
{


;

}
fun Replica_Init_entry75(Replica_Init_entry75_payload: machine)
{


Replica_coordinator = Replica_Init_entry75_payload;
Replica_lastSeqNum = 0;
raise Unit;
}
fun Replica_Init_exit0_rand_1499181880()
{


;

}
fun Replica_Loop_entry0_rand_1514452563()
{


;

}
fun Replica_Loop_exit0_rand_1416101177()
{


;

}start  state Replica_Init
{entry (payload: machine) {
Replica_Init_entry75(payload);
}
exit  {
Replica_Init_exit0_rand_1499181880();
}
on Unit goto Replica_Loop with   {
Replica_Init_on_Unit_goto_Replica_Loop0_rand_260483190();
}
}
 state Replica_Loop
{entry  {
Replica_Loop_entry0_rand_1514452563();
}
exit  {
Replica_Loop_exit0_rand_1416101177();
}
on GLOBAL_ABORT do  (payload: int) {
Replica_Loop_do_GLOBAL_ABORT96(payload);
}

on GLOBAL_COMMIT do  (payload: int) {
Replica_Loop_do_GLOBAL_COMMIT102(payload);
}

on REQ_REPLICA do  (payload: (int, int, int)) {
Replica_Loop_do_REQ_REPLICA109(payload);
}

on READ_REQ_REPLICA do  (payload: int) {
Replica_Loop_do_READ_REQ_REPLICA111(payload);
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
var _tmp634: machine;
var _tmp635: (int, int, int);


Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp634 = Coordinator_replicas[Coordinator_i];
_tmp635 = (Coordinator_currSeqNum, Coordinator_DoWrite_pendingWriteReq.1, Coordinator_DoWrite_pendingWriteReq.2);
send _tmp634, REQ_REPLICA, _tmp635;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_timer, StartTimer, 100;
raise Unit;
}
fun Coordinator_DoGlobalAbort()
{
var _tmp636: machine;


Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp636 = Coordinator_replicas[Coordinator_i];
send _tmp636, GLOBAL_ABORT, Coordinator_currSeqNum;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_pendingWriteReq.0, WRITE_FAIL;
}
fun Coordinator_HandleAbort(Coordinator_HandleAbort_payload: int)
{
var _tmp637: bool;


_tmp637 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
if(_tmp637)
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
fun Coordinator_Loop_do_WRITE_REQ197(Coordinator_Loop_do_WRITE_REQ197_payload: (machine, int, int))
{


Coordinator_DoWrite(Coordinator_Loop_do_WRITE_REQ197_payload);
}
fun Coordinator_CountVote_do_RESP_REPLICA_ABORT232(Coordinator_CountVote_do_RESP_REPLICA_ABORT232_payload: int)
{


Coordinator_HandleAbort(Coordinator_CountVote_do_RESP_REPLICA_ABORT232_payload);
}
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_714864832()
{


;

}
fun Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175()
{


send Coordinator_client, READ_FAIL;
}
fun Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179(Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179_payload: int)
{


send Coordinator_client, READ_SUCCESS, Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179_payload;
}
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_525674621()
{


;

}
fun Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_513003028()
{


;

}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload: int)
{
var _tmp638: bool;


_tmp638 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload);
if(_tmp638)
{

Coordinator_i = (Coordinator_i - 1);

}
else
{

;


}

}
fun Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop234()
{


Coordinator_DoGlobalAbort();
}
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1602877925()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1722637533()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_544229727()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_1306212696()
{


;

}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_1615266248()
{


;

}
fun Coordinator_Init_entry138(Coordinator_Init_entry138_payload: int)
{
var _tmp639: machine;
var _tmp640: machine;


Coordinator_numReplicas = Coordinator_Init_entry138_payload;
assert (Coordinator_numReplicas > 0);
Coordinator_i = 0;
while((Coordinator_i < Coordinator_numReplicas))
{

_tmp639 = new Replica(this);
Coordinator_replica = _tmp639;
Coordinator_replicas += (Coordinator_i, Coordinator_replica);
Coordinator_i = (Coordinator_i + 1);

}

Coordinator_currSeqNum = 0;
_tmp640 = new Timer(this);
Coordinator_timer = _tmp640;
raise Unit;
}
fun Coordinator_Init_exit0_rand_91170709()
{


;

}
fun Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166(env: ((machine, int)), Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1: int): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var _tmp641: (bool, int);
var _tmp642: ((machine, int));


Coordinator_DoRead_entry156_payload = env.0;
_tmp641 = (false, Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1);
Coordinator_readResult = _tmp641;
_tmp642 = (Coordinator_DoRead_entry156_payload,);
return (_tmp642);
}
fun Coordinator_DoRead_entry156_case_REP_READ_FAIL165(env: ((machine, int))): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var _tmp643: (bool, int);
var _tmp644: ((machine, int));


Coordinator_DoRead_entry156_payload = env.0;
_tmp643 = (true, ~(1));
Coordinator_readResult = _tmp643;
_tmp644 = (Coordinator_DoRead_entry156_payload,);
return (_tmp644);
}
fun Coordinator_DoRead_entry156(Coordinator_DoRead_entry156_payload: (machine, int))
{
var _tmp645: bool;
var _tmp646: machine;
var _tmp647: machine;


Coordinator_client = Coordinator_DoRead_entry156_payload.0;
Coordinator_key = Coordinator_DoRead_entry156_payload.1;
_tmp645 = $;
if(_tmp645)
{

_tmp646 = Coordinator_replicas[0];
send _tmp646, READ_REQ_REPLICA, Coordinator_key;

}
else
{

_tmp647 = Coordinator_replicas[(sizeof(Coordinator_replicas) - 1)];
send _tmp647, READ_REQ_REPLICA, Coordinator_key;

}

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

if(Coordinator_readResult.0)
{

raise READ_FAIL;

}
else
{

raise READ_SUCCESS, Coordinator_readResult.1;

}

}
fun Coordinator_DoRead_exit0_rand_1438436337()
{


;

}
fun Coordinator_Loop_entry0_rand_2118528489()
{


;

}
fun Coordinator_Loop_exit0_rand_1419169463()
{


;

}
fun Coordinator_CountVote_entry214()
{
var _tmp648: bool;
var _tmp649: machine;


_tmp648 = (Coordinator_i == 0);
if(_tmp648)
{

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

_tmp649 = Coordinator_replicas[Coordinator_i];
send _tmp649, GLOBAL_COMMIT, Coordinator_currSeqNum;
Coordinator_i = (Coordinator_i + 1);

}

Coordinator_data[Coordinator_pendingWriteReq.1] = Coordinator_pendingWriteReq.2;
send Coordinator_pendingWriteReq.0, WRITE_SUCCESS;
send Coordinator_timer, CancelTimer;
raise Unit;

}
else
{

;


}

}
fun Coordinator_CountVote_exit0_rand_695024862()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_690497277()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_1849884998()
{


;

}
fun Coordinator_WaitForTimeout_entry0_rand_1510103625()
{


;

}
fun Coordinator_WaitForTimeout_exit0_rand_1276659322()
{


;

}start  state Coordinator_Init
{entry (payload: int) {
Coordinator_Init_entry138(payload);
}
exit  {
Coordinator_Init_exit0_rand_91170709();
}
on Unit goto Coordinator_Loop with   {
Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_714864832();
}
}
 state Coordinator_DoRead
{entry (payload: (machine, int)) {
Coordinator_DoRead_entry156(payload);
}
exit  {
Coordinator_DoRead_exit0_rand_1438436337();
}
on READ_FAIL goto Coordinator_Loop with   {
Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175();
}

on READ_SUCCESS goto Coordinator_Loop with  (payload: int) {
Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179(payload);
}
}
 state Coordinator_Loop
{entry  {
Coordinator_Loop_entry0_rand_2118528489();
}
exit  {
Coordinator_Loop_exit0_rand_1419169463();
}
on WRITE_REQ do  (payload: (machine, int, int)) {
Coordinator_Loop_do_WRITE_REQ197(payload);
}

ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Unit goto Coordinator_CountVote with   {
Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_525674621();
}

on READ_REQ goto Coordinator_DoRead with  (payload: (machine, int)) {
Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_513003028();
}
}
 state Coordinator_CountVote
{entry  {
Coordinator_CountVote_entry214();
}
exit  {
Coordinator_CountVote_exit0_rand_695024862();
}
defer WRITE_REQ;
defer READ_REQ;
on RESP_REPLICA_ABORT do  (payload: int) {
Coordinator_CountVote_do_RESP_REPLICA_ABORT232(payload);
}
on RESP_REPLICA_COMMIT goto Coordinator_CountVote with  (payload: int) {
Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228(payload);
}

on Timeout goto Coordinator_Loop with   {
Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop234();
}

on Unit goto Coordinator_WaitForCancelTimerResponse with   {
Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1602877925();
}
}
 state Coordinator_WaitForCancelTimerResponse
{entry  {
Coordinator_WaitForCancelTimerResponse_entry0_rand_690497277();
}
exit  {
Coordinator_WaitForCancelTimerResponse_exit0_rand_1849884998();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1722637533();
}

on CancelTimerSuccess goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_544229727();
}

on CancelTimerFailure goto Coordinator_WaitForTimeout with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_1306212696();
}
}
 state Coordinator_WaitForTimeout
{entry  {
Coordinator_WaitForTimeout_entry0_rand_1510103625();
}
exit  {
Coordinator_WaitForTimeout_exit0_rand_1276659322();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_1615266248();
}
}
}

model Client
{
var Client_coordinator: machine;
var Client_mydata: int;
var Client_counter: int;

fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_570688751()
{


;

}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_1333161717()
{


;

}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1274296081()
{


;

}
fun Client_DoWrite_on_goEnd_goto_Client_End0_rand_1916266649()
{


;

}
fun Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_1735072760()
{


;

}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_1725293258()
{


;

}
fun Client_Init_entry269(Client_Init_entry269_payload: (machine, int))
{


Client_coordinator = Client_Init_entry269_payload.0;
Client_mydata = Client_Init_entry269_payload.1;
Client_counter = 0;
raise Unit;
}
fun Client_Init_exit0_rand_1383100680()
{


;

}
fun Client_DoWrite_entry280()
{
var _tmp650: bool;
var _tmp651: (machine, int, int);


Client_mydata = (Client_mydata + 1);
Client_counter = (Client_counter + 1);
_tmp650 = (Client_counter == 3);
if(_tmp650)
{

raise goEnd;

}
else
{

;


}

_tmp651 = (this, Client_mydata, Client_mydata);
send Client_coordinator, WRITE_REQ, _tmp651;
}
fun Client_DoWrite_exit0_rand_555581937()
{


;

}
fun Client_DoRead_entry293()
{
var _tmp652: (machine, int);


_tmp652 = (this, Client_mydata);
send Client_coordinator, READ_REQ, _tmp652;
}
fun Client_DoRead_exit0_rand_1700427338()
{


;

}
fun Client_End_entry0_rand_128188198()
{


;

}
fun Client_End_exit0_rand_54594412()
{


;

}start  state Client_Init
{entry (payload: (machine, int)) {
Client_Init_entry269(payload);
}
exit  {
Client_Init_exit0_rand_1383100680();
}
on Unit goto Client_DoWrite with   {
Client_Init_on_Unit_goto_Client_DoWrite0_rand_570688751();
}
}
 state Client_DoWrite
{entry  {
Client_DoWrite_entry280();
}
exit  {
Client_DoWrite_exit0_rand_555581937();
}
on WRITE_FAIL goto Client_DoRead with   {
Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_1333161717();
}

on WRITE_SUCCESS goto Client_DoRead with   {
Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1274296081();
}

on goEnd goto Client_End with   {
Client_DoWrite_on_goEnd_goto_Client_End0_rand_1916266649();
}
}
 state Client_DoRead
{entry  {
Client_DoRead_entry293();
}
exit  {
Client_DoRead_exit0_rand_1700427338();
}
on READ_FAIL goto Client_DoWrite with   {
Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_1735072760();
}

on READ_SUCCESS goto Client_DoWrite with  (payload: int) {
Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_1725293258();
}
}
 state Client_End
{entry  {
Client_End_entry0_rand_128188198();
}
exit  {
Client_End_exit0_rand_54594412();
}
}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;

fun TwoPhaseCommit_Init_entry308()
{
var _tmp653: machine;
var _tmp654: (machine, int);
var _tmp655: (machine, int);


_tmp653 = new Coordinator(2);
TwoPhaseCommit_coordinator = _tmp653;
_tmp654 = (TwoPhaseCommit_coordinator, 100);
new Client(_tmp654);
_tmp655 = (TwoPhaseCommit_coordinator, 200);
new Client(_tmp655);
}
fun TwoPhaseCommit_Init_exit0_rand_1424249956()
{


;

}start  state TwoPhaseCommit_Init
{entry  {
TwoPhaseCommit_Init_entry308();
}
exit  {
TwoPhaseCommit_Init_exit0_rand_1424249956();
}
}
}

