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

fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_66887159()
{


;

}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_158627565()
{


;

}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_428811240()
{


;

}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56()
{
var Tmp627: bool;


Tmp627 = $;
if(Tmp627)
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
fun Timer_Init_exit0_rand_235481823()
{


;

}
fun Timer_Loop_entry0_rand_709764398()
{


;

}
fun Timer_Loop_exit0_rand_230124798()
{


;

}
fun Timer_TimerStarted_entry49()
{
var Tmp628: bool;


Tmp628 = $;
if(Tmp628)
{

send Timer_target, Timeout;
raise Unit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_1296012326()
{


;

}start 
 state Timer_Init
{
entry (payload: machine) {
Timer_Init_entry36(payload);
}
exit  {
Timer_Init_exit0_rand_235481823();
}
on Unit goto Timer_Loop with   {
Timer_Init_on_Unit_goto_Timer_Loop0_rand_66887159();
}
}

 state Timer_Loop
{
entry  {
Timer_Loop_entry0_rand_709764398();
}
exit  {
Timer_Loop_exit0_rand_230124798();
}
ignore CancelTimer;on StartTimer goto Timer_TimerStarted with  (payload: int) {
Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_158627565();
}
}

 state Timer_TimerStarted
{
entry  {
Timer_TimerStarted_entry49();
}
exit  {
Timer_TimerStarted_exit0_rand_1296012326();
}
on Unit goto Timer_Loop with   {
Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_428811240();
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
var Tmp629: bool;


Tmp629 = $;
return (Tmp629);
}
fun Replica_Loop_do_GLOBAL_ABORT96(Replica_Loop_do_GLOBAL_ABORT96_payload: int)
{
var Tmp630: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT96_payload);
Tmp630 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT96_payload);
if(Tmp630)
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
var Tmp631: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT102_payload);
Tmp631 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT102_payload);
if(Tmp631)
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
var Tmp632: bool;
var Tmp633: int;


Tmp632 = (Replica_Loop_do_READ_REQ_REPLICA111_payload in Replica_data);
if(Tmp632)
{

Tmp633 = Replica_data[Replica_Loop_do_READ_REQ_REPLICA111_payload];
send Replica_coordinator, REP_READ_SUCCESS, Tmp633;

}
else
{

send Replica_coordinator, REP_READ_FAIL;

}

}
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_342306602()
{


;

}
fun Replica_Init_entry75(Replica_Init_entry75_payload: machine)
{


Replica_coordinator = Replica_Init_entry75_payload;
Replica_lastSeqNum = 0;
raise Unit;
}
fun Replica_Init_exit0_rand_1750609609()
{


;

}
fun Replica_Loop_entry0_rand_2113660145()
{


;

}
fun Replica_Loop_exit0_rand_674213171()
{


;

}start 
 state Replica_Init
{
entry (payload: machine) {
Replica_Init_entry75(payload);
}
exit  {
Replica_Init_exit0_rand_1750609609();
}
on Unit goto Replica_Loop with   {
Replica_Init_on_Unit_goto_Replica_Loop0_rand_342306602();
}
}

 state Replica_Loop
{
entry  {
Replica_Loop_entry0_rand_2113660145();
}
exit  {
Replica_Loop_exit0_rand_674213171();
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
var Tmp634: machine;
var Tmp635: (int, int, int);


Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

Tmp634 = Coordinator_replicas[Coordinator_i];
Tmp635 = (Coordinator_currSeqNum, Coordinator_DoWrite_pendingWriteReq.1, Coordinator_DoWrite_pendingWriteReq.2);
send Tmp634, REQ_REPLICA, Tmp635;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_timer, StartTimer, 100;
raise Unit;
}
fun Coordinator_DoGlobalAbort()
{
var Tmp636: machine;


Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

Tmp636 = Coordinator_replicas[Coordinator_i];
send Tmp636, GLOBAL_ABORT, Coordinator_currSeqNum;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_pendingWriteReq.0, WRITE_FAIL;
}
fun Coordinator_HandleAbort(Coordinator_HandleAbort_payload: int)
{
var Tmp637: bool;


Tmp637 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
if(Tmp637)
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
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1225269460()
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
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_532565332()
{


;

}
fun Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_2122579787()
{


;

}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload: int)
{
var Tmp638: bool;


Tmp638 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload);
if(Tmp638)
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
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_356764479()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1827992310()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_345536141()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_637901070()
{


;

}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_566918183()
{


;

}
fun Coordinator_Init_entry138(Coordinator_Init_entry138_payload: int)
{
var Tmp639: machine;
var Tmp640: machine;


Coordinator_numReplicas = Coordinator_Init_entry138_payload;
assert (Coordinator_numReplicas > 0);
Coordinator_i = 0;
while((Coordinator_i < Coordinator_numReplicas))
{

Tmp639 = new Replica(this);
Coordinator_replica = Tmp639;
Coordinator_replicas += (Coordinator_i, Coordinator_replica);
Coordinator_i = (Coordinator_i + 1);

}

Coordinator_currSeqNum = 0;
Tmp640 = new Timer(this);
Coordinator_timer = Tmp640;
raise Unit;
}
fun Coordinator_Init_exit0_rand_768327756()
{


;

}
fun Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166(env: ((machine, int)), Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1: int): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var Tmp641: (bool, int);
var Tmp642: ((machine, int));


Coordinator_DoRead_entry156_payload = env.0;
Tmp641 = (false, Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1);
Coordinator_readResult = Tmp641;
Tmp642 = (Coordinator_DoRead_entry156_payload,);
return (Tmp642);
}
fun Coordinator_DoRead_entry156_case_REP_READ_FAIL165(env: ((machine, int))): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var Tmp643: (bool, int);
var Tmp644: ((machine, int));


Coordinator_DoRead_entry156_payload = env.0;
Tmp643 = (true, -(1));
Coordinator_readResult = Tmp643;
Tmp644 = (Coordinator_DoRead_entry156_payload,);
return (Tmp644);
}
fun Coordinator_DoRead_entry156(Coordinator_DoRead_entry156_payload: (machine, int))
{
var Tmp645: bool;
var Tmp646: machine;
var Tmp647: machine;


Coordinator_client = Coordinator_DoRead_entry156_payload.0;
Coordinator_key = Coordinator_DoRead_entry156_payload.1;
Tmp645 = $;
if(Tmp645)
{

Tmp646 = Coordinator_replicas[0];
send Tmp646, READ_REQ_REPLICA, Coordinator_key;

}
else
{

Tmp647 = Coordinator_replicas[(sizeof(Coordinator_replicas) - 1)];
send Tmp647, READ_REQ_REPLICA, Coordinator_key;

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
fun Coordinator_DoRead_exit0_rand_803002495()
{


;

}
fun Coordinator_Loop_entry0_rand_211082762()
{


;

}
fun Coordinator_Loop_exit0_rand_737184102()
{


;

}
fun Coordinator_CountVote_entry214()
{
var Tmp648: bool;
var Tmp649: machine;


Tmp648 = (Coordinator_i == 0);
if(Tmp648)
{

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

Tmp649 = Coordinator_replicas[Coordinator_i];
send Tmp649, GLOBAL_COMMIT, Coordinator_currSeqNum;
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
fun Coordinator_CountVote_exit0_rand_328285278()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_1372334967()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_573745962()
{


;

}
fun Coordinator_WaitForTimeout_entry0_rand_2069046015()
{


;

}
fun Coordinator_WaitForTimeout_exit0_rand_856296009()
{


;

}start 
 state Coordinator_Init
{
entry (payload: int) {
Coordinator_Init_entry138(payload);
}
exit  {
Coordinator_Init_exit0_rand_768327756();
}
on Unit goto Coordinator_Loop with   {
Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1225269460();
}
}

 state Coordinator_DoRead
{
entry (payload: (machine, int)) {
Coordinator_DoRead_entry156(payload);
}
exit  {
Coordinator_DoRead_exit0_rand_803002495();
}
on READ_FAIL goto Coordinator_Loop with   {
Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175();
}

on READ_SUCCESS goto Coordinator_Loop with  (payload: int) {
Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179(payload);
}
}

 state Coordinator_Loop
{
entry  {
Coordinator_Loop_entry0_rand_211082762();
}
exit  {
Coordinator_Loop_exit0_rand_737184102();
}
on WRITE_REQ do  (payload: (machine, int, int)) {
Coordinator_Loop_do_WRITE_REQ197(payload);
}

ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Unit goto Coordinator_CountVote with   {
Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_532565332();
}

on READ_REQ goto Coordinator_DoRead with  (payload: (machine, int)) {
Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_2122579787();
}
}

 state Coordinator_CountVote
{
entry  {
Coordinator_CountVote_entry214();
}
exit  {
Coordinator_CountVote_exit0_rand_328285278();
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
Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_356764479();
}
}

 state Coordinator_WaitForCancelTimerResponse
{
entry  {
Coordinator_WaitForCancelTimerResponse_entry0_rand_1372334967();
}
exit  {
Coordinator_WaitForCancelTimerResponse_exit0_rand_573745962();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1827992310();
}

on CancelTimerSuccess goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_345536141();
}

on CancelTimerFailure goto Coordinator_WaitForTimeout with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_637901070();
}
}

 state Coordinator_WaitForTimeout
{
entry  {
Coordinator_WaitForTimeout_entry0_rand_2069046015();
}
exit  {
Coordinator_WaitForTimeout_exit0_rand_856296009();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_566918183();
}
}
}

model Client
{
var Client_coordinator: machine;
var Client_mydata: int;
var Client_counter: int;

fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_509414862()
{


;

}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_36567315()
{


;

}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_276933516()
{


;

}
fun Client_DoWrite_on_goEnd_goto_Client_End0_rand_1621371651()
{


;

}
fun Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_1849117052()
{


;

}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_1106483435()
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
fun Client_Init_exit0_rand_1957140980()
{


;

}
fun Client_DoWrite_entry280()
{
var Tmp650: bool;
var Tmp651: (machine, int, int);


Client_mydata = (Client_mydata + 1);
Client_counter = (Client_counter + 1);
Tmp650 = (Client_counter == 3);
if(Tmp650)
{

raise goEnd;

}
else
{

;


}

Tmp651 = (this, Client_mydata, Client_mydata);
send Client_coordinator, WRITE_REQ, Tmp651;
}
fun Client_DoWrite_exit0_rand_1976288413()
{


;

}
fun Client_DoRead_entry293()
{
var Tmp652: (machine, int);


Tmp652 = (this, Client_mydata);
send Client_coordinator, READ_REQ, Tmp652;
}
fun Client_DoRead_exit0_rand_1217775297()
{


;

}
fun Client_End_entry0_rand_696842213()
{


;

}
fun Client_End_exit0_rand_382164095()
{


;

}start 
 state Client_Init
{
entry (payload: (machine, int)) {
Client_Init_entry269(payload);
}
exit  {
Client_Init_exit0_rand_1957140980();
}
on Unit goto Client_DoWrite with   {
Client_Init_on_Unit_goto_Client_DoWrite0_rand_509414862();
}
}

 state Client_DoWrite
{
entry  {
Client_DoWrite_entry280();
}
exit  {
Client_DoWrite_exit0_rand_1976288413();
}
on WRITE_FAIL goto Client_DoRead with   {
Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_36567315();
}

on WRITE_SUCCESS goto Client_DoRead with   {
Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_276933516();
}

on goEnd goto Client_End with   {
Client_DoWrite_on_goEnd_goto_Client_End0_rand_1621371651();
}
}

 state Client_DoRead
{
entry  {
Client_DoRead_entry293();
}
exit  {
Client_DoRead_exit0_rand_1217775297();
}
on READ_FAIL goto Client_DoWrite with   {
Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_1849117052();
}

on READ_SUCCESS goto Client_DoWrite with  (payload: int) {
Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_1106483435();
}
}

 state Client_End
{
entry  {
Client_End_entry0_rand_696842213();
}
exit  {
Client_End_exit0_rand_382164095();
}
}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;

fun TwoPhaseCommit_Init_entry308()
{
var Tmp653: machine;
var Tmp654: (machine, int);
var Tmp655: (machine, int);


Tmp653 = new Coordinator(2);
TwoPhaseCommit_coordinator = Tmp653;
Tmp654 = (TwoPhaseCommit_coordinator, 100);
new Client(Tmp654);
Tmp655 = (TwoPhaseCommit_coordinator, 200);
new Client(Tmp655);
}
fun TwoPhaseCommit_Init_exit0_rand_834918458()
{


;

}start 
 state TwoPhaseCommit_Init
{
entry  {
TwoPhaseCommit_Init_entry308();
}
exit  {
TwoPhaseCommit_Init_exit0_rand_834918458();
}
}
}

