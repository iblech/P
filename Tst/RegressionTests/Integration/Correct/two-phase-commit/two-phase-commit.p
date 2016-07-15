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

fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_1602965613()
{


;

}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_485294088()
{


;

}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_276811724()
{


;

}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47()
{
var Tmp604: bool;


Tmp604 = $;
if(Tmp604)
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
fun Timer_Init_exit0_rand_2024028139()
{


;

}
fun Timer_Loop_entry0_rand_2134915978()
{


;

}
fun Timer_Loop_exit0_rand_1646586537()
{


;

}
fun Timer_TimerStarted_entry40()
{
var Tmp605: bool;


Tmp605 = $;
if(Tmp605)
{

send Timer_target, Timeout;
raise Unit;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_1039148815()
{


;

}start 
 state Timer_Init
{
entry (payload: machine) {
Timer_Init_entry27(payload);
}
exit  {
Timer_Init_exit0_rand_2024028139();
}
on Unit goto Timer_Loop with   {
Timer_Init_on_Unit_goto_Timer_Loop0_rand_1602965613();
}
}

 state Timer_Loop
{
entry  {
Timer_Loop_entry0_rand_2134915978();
}
exit  {
Timer_Loop_exit0_rand_1646586537();
}
ignore CancelTimer;on StartTimer goto Timer_TimerStarted with  (payload: int) {
Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_485294088();
}
}

 state Timer_TimerStarted
{
entry  {
Timer_TimerStarted_entry40();
}
exit  {
Timer_TimerStarted_exit0_rand_1039148815();
}
on Unit goto Timer_Loop with   {
Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_276811724();
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
var Tmp606: bool;


Tmp606 = $;
return (Tmp606);
}
fun Replica_Loop_do_GLOBAL_ABORT87(Replica_Loop_do_GLOBAL_ABORT87_payload: int)
{
var Tmp607: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT87_payload);
Tmp607 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT87_payload);
if(Tmp607)
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
var Tmp608: bool;


assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT93_payload);
Tmp608 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT93_payload);
if(Tmp608)
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
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_1541183764()
{


;

}
fun Replica_Init_entry66(Replica_Init_entry66_payload: machine)
{


Replica_coordinator = Replica_Init_entry66_payload;
Replica_lastSeqNum = 0;
raise Unit;
}
fun Replica_Init_exit0_rand_1607433555()
{


;

}
fun Replica_Loop_entry0_rand_1367483790()
{


;

}
fun Replica_Loop_exit0_rand_1923013337()
{


;

}start 
 state Replica_Init
{
entry (payload: machine) {
Replica_Init_entry66(payload);
}
exit  {
Replica_Init_exit0_rand_1607433555();
}
on Unit goto Replica_Loop with   {
Replica_Init_on_Unit_goto_Replica_Loop0_rand_1541183764();
}
}

 state Replica_Loop
{
entry  {
Replica_Loop_entry0_rand_1367483790();
}
exit  {
Replica_Loop_exit0_rand_1923013337();
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
var Tmp609: bool;
var Tmp610: int;


Tmp609 = (Coordinator_DoRead_payload.1 in Coordinator_data);
if(Tmp609)
{

;

Tmp610 = Coordinator_data[Coordinator_DoRead_payload.1];
send Coordinator_DoRead_payload.0, READ_SUCCESS, Tmp610;

}
else
{

;

send Coordinator_DoRead_payload.0, READ_UNAVAILABLE;

}

}
fun Coordinator_DoWrite(Coordinator_DoWrite_payload: (machine, int, int))
{
var Tmp611: machine;
var Tmp612: (int, int, int);


Coordinator_pendingWriteReq = Coordinator_DoWrite_payload;
Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

Tmp611 = Coordinator_replicas[Coordinator_i];
Tmp612 = (Coordinator_currSeqNum, Coordinator_pendingWriteReq.1, Coordinator_pendingWriteReq.2);
send Tmp611, REQ_REPLICA, Tmp612;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_timer, StartTimer, 100;
raise Unit;
}
fun Coordinator_DoGlobalAbort()
{
var Tmp613: machine;


Coordinator_i = 0;
while((Coordinator_i < sizeof(Coordinator_replicas)))
{

Tmp613 = Coordinator_replicas[Coordinator_i];
send Tmp613, GLOBAL_ABORT, Coordinator_currSeqNum;
Coordinator_i = (Coordinator_i + 1);

}

send Coordinator_pendingWriteReq.0, WRITE_FAIL;
}
fun Coordinator_HandleAbort(Coordinator_HandleAbort_payload: int)
{
var Tmp614: bool;


Tmp614 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
if(Tmp614)
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
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_900199496()
{


;

}
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1995054016()
{


;

}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload: int)
{
var Tmp615: bool;


Tmp615 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload);
if(Tmp615)
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
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_2134348842()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1364400683()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_1694897751()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_981483781()
{


;

}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_1367156299()
{


;

}
fun Coordinator_Init_entry121(Coordinator_Init_entry121_payload: int)
{
var Tmp616: machine;
var Tmp617: machine;


Coordinator_numReplicas = Coordinator_Init_entry121_payload;
assert (Coordinator_numReplicas > 0);
Coordinator_i = 0;
while((Coordinator_i < Coordinator_numReplicas))
{

Tmp616 = new Replica(this);
Coordinator_replica = Tmp616;
Coordinator_replicas += (Coordinator_i, Coordinator_replica);
Coordinator_i = (Coordinator_i + 1);

}

Coordinator_currSeqNum = 0;
Tmp617 = new Timer(this);
Coordinator_timer = Tmp617;
raise Unit;
}
fun Coordinator_Init_exit0_rand_46686926()
{


;

}
fun Coordinator_Loop_entry0_rand_245171438()
{


;

}
fun Coordinator_Loop_exit0_rand_1297073534()
{


;

}
fun Coordinator_CountVote_entry176()
{
var Tmp618: bool;
var Tmp619: machine;


Tmp618 = (Coordinator_i == 0);
if(Tmp618)
{

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

Tmp619 = Coordinator_replicas[Coordinator_i];
send Tmp619, GLOBAL_COMMIT, Coordinator_currSeqNum;
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
fun Coordinator_CountVote_exit0_rand_2028877518()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_1460135671()
{


;

}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_596072927()
{


;

}
fun Coordinator_WaitForTimeout_entry0_rand_891895256()
{


;

}
fun Coordinator_WaitForTimeout_exit0_rand_770401019()
{


;

}start 
 state Coordinator_Init
{
entry (payload: int) {
Coordinator_Init_entry121(payload);
}
exit  {
Coordinator_Init_exit0_rand_46686926();
}
on Unit goto Coordinator_Loop with   {
Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_900199496();
}
}

 state Coordinator_Loop
{
entry  {
Coordinator_Loop_entry0_rand_245171438();
}
exit  {
Coordinator_Loop_exit0_rand_1297073534();
}
on WRITE_REQ do  (payload: (machine, int, int)) {
Coordinator_Loop_do_WRITE_REQ159(payload);
}

on READ_REQ do  (payload: (machine, int)) {
Coordinator_Loop_do_READ_REQ161(payload);
}

ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Unit goto Coordinator_CountVote with   {
Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1995054016();
}
}

 state Coordinator_CountVote
{
entry  {
Coordinator_CountVote_entry176();
}
exit  {
Coordinator_CountVote_exit0_rand_2028877518();
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
Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_2134348842();
}
}

 state Coordinator_WaitForCancelTimerResponse
{
entry  {
Coordinator_WaitForCancelTimerResponse_entry0_rand_1460135671();
}
exit  {
Coordinator_WaitForCancelTimerResponse_exit0_rand_596072927();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1364400683();
}

on CancelTimerSuccess goto Coordinator_Loop with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_1694897751();
}

on CancelTimerFailure goto Coordinator_WaitForTimeout with   {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_981483781();
}
}

 state Coordinator_WaitForTimeout
{
entry  {
Coordinator_WaitForTimeout_entry0_rand_891895256();
}
exit  {
Coordinator_WaitForTimeout_exit0_rand_770401019();
}
defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with   {
Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_1367156299();
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
var Tmp620: bool;


Tmp620 = $;
if(Tmp620)
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
var Tmp621: bool;


Tmp621 = $;
if(Tmp621)
{

return (0);

}
else
{

return (1);

}

}
fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_1177396374()
{


;

}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_730381554()
{


;

}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1608005624()
{


;

}
fun Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_912887517()
{


;

}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_1009517519()
{


;

}
fun Client_Init_entry228(Client_Init_entry228_payload: machine)
{


Client_coordinator = Client_Init_entry228_payload;
raise Unit;
}
fun Client_Init_exit0_rand_629972197()
{


;

}
fun Client_DoWrite_entry237()
{
var Tmp622: (machine, int, int);


Client_idx = Client_ChooseIndex();
Client_val = Client_ChooseValue();
Tmp622 = (this, Client_idx, Client_val);
send Client_coordinator, WRITE_REQ, Tmp622;
}
fun Client_DoWrite_exit0_rand_849111096()
{


;

}
fun Client_DoRead_entry247()
{
var Tmp623: (machine, int);


Tmp623 = (this, Client_idx);
send Client_coordinator, READ_REQ, Tmp623;
}
fun Client_DoRead_exit0_rand_1505530234()
{


;

}
fun Client_End_entry0_rand_1034259662()
{


;

}
fun Client_End_exit0_rand_991325149()
{


;

}start 
 state Client_Init
{
entry (payload: machine) {
Client_Init_entry228(payload);
}
exit  {
Client_Init_exit0_rand_629972197();
}
on Unit goto Client_DoWrite with   {
Client_Init_on_Unit_goto_Client_DoWrite0_rand_1177396374();
}
}

 state Client_DoWrite
{
entry  {
Client_DoWrite_entry237();
}
exit  {
Client_DoWrite_exit0_rand_849111096();
}
on WRITE_FAIL goto Client_End with   {
Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_730381554();
}

on WRITE_SUCCESS goto Client_DoRead with   {
Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_1608005624();
}
}

 state Client_DoRead
{
entry  {
Client_DoRead_entry247();
}
exit  {
Client_DoRead_exit0_rand_1505530234();
}
on READ_FAIL goto Client_End with   {
Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_912887517();
}

on READ_SUCCESS goto Client_End with  (payload: int) {
Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_1009517519();
}
}

 state Client_End
{
entry  {
Client_End_entry0_rand_1034259662();
}
exit  {
Client_End_exit0_rand_991325149();
}
}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;
var TwoPhaseCommit_client: machine;

fun TwoPhaseCommit_Init_entry294()
{
var Tmp624: machine;
var Tmp625: machine;
var Tmp626: machine;


Tmp624 = new Coordinator(2);
TwoPhaseCommit_coordinator = Tmp624;
Tmp625 = new Client(TwoPhaseCommit_coordinator);
TwoPhaseCommit_client = Tmp625;
Tmp626 = new Client(TwoPhaseCommit_coordinator);
TwoPhaseCommit_client = Tmp626;
}
fun TwoPhaseCommit_Init_exit0_rand_153221510()
{


;

}start 
 state TwoPhaseCommit_Init
{
entry  {
TwoPhaseCommit_Init_entry294();
}
exit  {
TwoPhaseCommit_Init_exit0_rand_153221510();
}
}
}

