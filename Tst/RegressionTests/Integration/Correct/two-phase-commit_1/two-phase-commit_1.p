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

machine Timer
{
var Timer_target: machine;

fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_1051641250(Timer_Init_on_Unit_goto_Timer_Loop0_rand_1051641250__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_521356721(Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_521356721__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_669790192(Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_669790192__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56(Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56__payload_0: null)
{
var Tmp701: bool;


;

Tmp701 = $;
if(Tmp701)
{

;

send Timer_target, CancelTimerFailure;
;

send Timer_target, Timeout;

}
else
{

;

send Timer_target, CancelTimerSuccess;

}

return;
}
fun Timer_Init_entry36(Timer_Init_entry36_payload: machine)
{


;

Timer_target = Timer_Init_entry36_payload;
;

raise Unit;
return;
}
fun Timer_Init_exit0_rand_1643332897(Timer_Init_exit0_rand_1643332897__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_entry0_rand_871339502(Timer_Loop_entry0_rand_871339502__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_exit0_rand_1139425429(Timer_Loop_exit0_rand_1139425429__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_entry49(Timer_TimerStarted_entry49_payload: int)
{
var Tmp702: bool;


;

Tmp702 = $;
if(Tmp702)
{

;

send Timer_target, Timeout;
;

raise Unit;

}
else
{

;

;


}

return;
}
fun Timer_TimerStarted_exit0_rand_1337299112(Timer_TimerStarted_exit0_rand_1337299112__payload_skip: any)
{


;

;

return;
}start 
 state Timer_Init
{
entry (payload: machine) {
Timer_Init_entry36(payload);
}exit {
Timer_Init_exit0_rand_1643332897(null);
}on Unit goto Timer_Loop with (payload: null) {
Timer_Init_on_Unit_goto_Timer_Loop0_rand_1051641250(payload);
}}

 state Timer_Loop
{
entry (payload: any) {
Timer_Loop_entry0_rand_871339502(payload);
}exit {
Timer_Loop_exit0_rand_1139425429(null);
}ignore CancelTimer;on StartTimer goto Timer_TimerStarted with (payload: int) {
Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_521356721(payload);
}}

 state Timer_TimerStarted
{
entry (payload: int) {
Timer_TimerStarted_entry49(payload);
}exit {
Timer_TimerStarted_exit0_rand_1337299112(null);
}on Unit goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_669790192(payload);
}
on CancelTimer goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop56(payload);
}}
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


;

Replica_pendingWriteReq = Replica_HandleReqReplica_payload;
;

assert (Replica_pendingWriteReq.0 > Replica_lastSeqNum);
;

Replica_shouldCommit = Replica_ShouldCommitWrite();
;

if(Replica_shouldCommit)
{

;

send Replica_coordinator, RESP_REPLICA_COMMIT, Replica_pendingWriteReq.0;

}
else
{

;

send Replica_coordinator, RESP_REPLICA_ABORT, Replica_pendingWriteReq.0;

}

}
fun Replica_ShouldCommitWrite(): bool
{
var Tmp703: bool;


;

Tmp703 = $;
return (Tmp703);
}
fun Replica_Loop_do_GLOBAL_ABORT96(Replica_Loop_do_GLOBAL_ABORT96_payload: int)
{
var Tmp704: bool;


;

assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT96_payload);
;

Tmp704 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT96_payload);
if(Tmp704)
{

;

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT96_payload;

}
else
{

;

;


}

return;
}
fun Replica_Loop_do_GLOBAL_COMMIT102(Replica_Loop_do_GLOBAL_COMMIT102_payload: int)
{
var Tmp705: bool;


;

assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT102_payload);
;

Tmp705 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT102_payload);
if(Tmp705)
{

;

Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
;

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT102_payload;

}
else
{

;

;


}

return;
}
fun Replica_Loop_do_REQ_REPLICA109(Replica_Loop_do_REQ_REPLICA109_payload: (int, int, int))
{


;

Replica_HandleReqReplica(Replica_Loop_do_REQ_REPLICA109_payload);
return;
}
fun Replica_Loop_do_READ_REQ_REPLICA111(Replica_Loop_do_READ_REQ_REPLICA111_payload: int)
{
var Tmp706: bool;
var Tmp707: int;


;

Tmp706 = (Replica_Loop_do_READ_REQ_REPLICA111_payload in Replica_data);
if(Tmp706)
{

;

Tmp707 = Replica_data[Replica_Loop_do_READ_REQ_REPLICA111_payload];
send Replica_coordinator, REP_READ_SUCCESS, Tmp707;

}
else
{

;

send Replica_coordinator, REP_READ_FAIL;

}

return;
}
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_1683398370(Replica_Init_on_Unit_goto_Replica_Loop0_rand_1683398370__payload_skip: any)
{


;

;

return;
}
fun Replica_Init_entry75(Replica_Init_entry75_payload: machine)
{


;

Replica_coordinator = Replica_Init_entry75_payload;
;

Replica_lastSeqNum = 0;
;

raise Unit;
return;
}
fun Replica_Init_exit0_rand_79035928(Replica_Init_exit0_rand_79035928__payload_skip: any)
{


;

;

return;
}
fun Replica_Loop_entry0_rand_1929657655(Replica_Loop_entry0_rand_1929657655__payload_skip: any)
{


;

;

return;
}
fun Replica_Loop_exit0_rand_1258287046(Replica_Loop_exit0_rand_1258287046__payload_skip: any)
{


;

;

return;
}start 
 state Replica_Init
{
entry (payload: machine) {
Replica_Init_entry75(payload);
}exit {
Replica_Init_exit0_rand_79035928(null);
}on Unit goto Replica_Loop with (payload: null) {
Replica_Init_on_Unit_goto_Replica_Loop0_rand_1683398370(payload);
}}

 state Replica_Loop
{
entry (payload: any) {
Replica_Loop_entry0_rand_1929657655(payload);
}exit {
Replica_Loop_exit0_rand_1258287046(null);
}on GLOBAL_ABORT do (payload: int) {
Replica_Loop_do_GLOBAL_ABORT96(payload);
}
on GLOBAL_COMMIT do (payload: int) {
Replica_Loop_do_GLOBAL_COMMIT102(payload);
}
on REQ_REPLICA do (payload: (int, int, int)) {
Replica_Loop_do_REQ_REPLICA109(payload);
}
on READ_REQ_REPLICA do (payload: int) {
Replica_Loop_do_READ_REQ_REPLICA111(payload);
}}
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
var Tmp708: machine;
var Tmp709: (int, int, int);


;

Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
;

Coordinator_i = 0;
;

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

;

Tmp708 = Coordinator_replicas[Coordinator_i];
Tmp709 = (Coordinator_currSeqNum, Coordinator_DoWrite_pendingWriteReq.1, Coordinator_DoWrite_pendingWriteReq.2);
send Tmp708, REQ_REPLICA, Tmp709;
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
var Tmp710: machine;


;

Coordinator_i = 0;
;

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

;

Tmp710 = Coordinator_replicas[Coordinator_i];
send Tmp710, GLOBAL_ABORT, Coordinator_currSeqNum;
;

Coordinator_i = (Coordinator_i + 1);

}

;

send Coordinator_pendingWriteReq.0, WRITE_FAIL;
}
fun Coordinator_HandleAbort(Coordinator_HandleAbort_payload: int)
{
var Tmp711: bool;


;

Tmp711 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
if(Tmp711)
{

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


}

}
fun Coordinator_Loop_do_WRITE_REQ197(Coordinator_Loop_do_WRITE_REQ197_payload: (machine, int, int))
{


;

Coordinator_DoWrite(Coordinator_Loop_do_WRITE_REQ197_payload);
return;
}
fun Coordinator_CountVote_do_RESP_REPLICA_ABORT232(Coordinator_CountVote_do_RESP_REPLICA_ABORT232_payload: int)
{


;

Coordinator_HandleAbort(Coordinator_CountVote_do_RESP_REPLICA_ABORT232_payload);
return;
}
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1075530405(Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1075530405__payload_skip: any)
{


;

;

return;
}
fun Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175(Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175__payload_2: null)
{


;

send Coordinator_client, READ_FAIL;
return;
}
fun Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179(Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179_payload: int)
{


;

send Coordinator_client, READ_SUCCESS, Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179_payload;
return;
}
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_2126466608(Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_2126466608__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_396432442(Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_396432442__payload_skip: any)
{


;

;

return;
}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload: int)
{
var Tmp712: bool;


;

Tmp712 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228_payload);
if(Tmp712)
{

;

Coordinator_i = (Coordinator_i - 1);

}
else
{

;

;


}

return;
}
fun Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop234(Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop234__payload_3: null)
{


;

Coordinator_DoGlobalAbort();
return;
}
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1643375038(Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1643375038__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1666172036(Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1666172036__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_1614926222(Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_1614926222__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_747338519(Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_747338519__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_282684905(Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_282684905__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Init_entry138(Coordinator_Init_entry138_payload: int)
{
var Tmp713: machine;
var Tmp714: machine;


;

Coordinator_numReplicas = Coordinator_Init_entry138_payload;
;

assert (Coordinator_numReplicas > 0);
;

Coordinator_i = 0;
;

while((Coordinator_i < Coordinator_numReplicas))
{

;

Tmp713 = new Replica(this);
Coordinator_replica = Tmp713;
;

Coordinator_replicas += (Coordinator_i, Coordinator_replica);
;

Coordinator_i = (Coordinator_i + 1);

}

;

Coordinator_currSeqNum = 0;
;

Tmp714 = new Timer(this);
Coordinator_timer = Tmp714;
;

raise Unit;
return;
}
fun Coordinator_Init_exit0_rand_609305116(Coordinator_Init_exit0_rand_609305116__payload_skip: any)
{


;

;

return;
}
fun Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166(Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1: int, Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_env: ((machine, int))): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var Tmp715: (bool, int);
var Tmp716: ((machine, int));


Coordinator_DoRead_entry156_payload = Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_env.0;
;

Tmp715 = (false, Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_payload1);
Coordinator_readResult = Tmp715;
Tmp716 = (Coordinator_DoRead_entry156_payload,);
return (Tmp716);
}
fun Coordinator_DoRead_entry156_case_REP_READ_FAIL165(Coordinator_DoRead_entry156_case_REP_READ_FAIL165__payload_1: null, Coordinator_DoRead_entry156_case_REP_READ_FAIL165_env: ((machine, int))): ((machine, int))
{
var Coordinator_DoRead_entry156_payload: (machine, int);
var Tmp717: (bool, int);
var Tmp718: ((machine, int));


Coordinator_DoRead_entry156_payload = Coordinator_DoRead_entry156_case_REP_READ_FAIL165_env.0;
;

Tmp717 = (true, -(1));
Coordinator_readResult = Tmp717;
Tmp718 = (Coordinator_DoRead_entry156_payload,);
return (Tmp718);
}
fun Coordinator_DoRead_entry156(Coordinator_DoRead_entry156_payload: (machine, int))
{
var Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_env: ((machine, int));
var Coordinator_DoRead_entry156_case_REP_READ_FAIL165_env: ((machine, int));
var Tmp719: bool;
var Tmp720: machine;
var Tmp721: machine;


;

Coordinator_client = Coordinator_DoRead_entry156_payload.0;
;

Coordinator_key = Coordinator_DoRead_entry156_payload.1;
;

Tmp719 = $;
if(Tmp719)
{

;

Tmp720 = Coordinator_replicas[0];
send Tmp720, READ_REQ_REPLICA, Coordinator_key;

}
else
{

;

Tmp721 = Coordinator_replicas[(sizeof(Coordinator_replicas) - 1)];
send Tmp721, READ_REQ_REPLICA, Coordinator_key;

}

;

receive
{
case REP_READ_SUCCESS: (payload: int) {

Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_env = Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166(payload, (Coordinator_DoRead_entry156_payload,));
Coordinator_DoRead_entry156_payload = Coordinator_DoRead_entry156_case_REP_READ_SUCCESS166_env.0;

}
case REP_READ_FAIL: (payload: null) {

Coordinator_DoRead_entry156_case_REP_READ_FAIL165_env = Coordinator_DoRead_entry156_case_REP_READ_FAIL165(payload, (Coordinator_DoRead_entry156_payload,));
Coordinator_DoRead_entry156_payload = Coordinator_DoRead_entry156_case_REP_READ_FAIL165_env.0;

}
}

;

if(Coordinator_readResult.0)
{

;

raise READ_FAIL;

}
else
{

;

raise READ_SUCCESS, Coordinator_readResult.1;

}

return;
}
fun Coordinator_DoRead_exit0_rand_1971227277(Coordinator_DoRead_exit0_rand_1971227277__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Loop_entry0_rand_90398834(Coordinator_Loop_entry0_rand_90398834__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Loop_exit0_rand_528197978(Coordinator_Loop_exit0_rand_528197978__payload_skip: any)
{


;

;

return;
}
fun Coordinator_CountVote_entry214(Coordinator_CountVote_entry214_payload: any)
{
var Tmp722: bool;
var Tmp723: machine;


;

Tmp722 = (Coordinator_i == 0);
if(Tmp722)
{

;

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

;

Tmp723 = Coordinator_replicas[Coordinator_i];
send Tmp723, GLOBAL_COMMIT, Coordinator_currSeqNum;
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


}

return;
}
fun Coordinator_CountVote_exit0_rand_1072760980(Coordinator_CountVote_exit0_rand_1072760980__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_129977302(Coordinator_WaitForCancelTimerResponse_entry0_rand_129977302__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_565540917(Coordinator_WaitForCancelTimerResponse_exit0_rand_565540917__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForTimeout_entry0_rand_372380126(Coordinator_WaitForTimeout_entry0_rand_372380126__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForTimeout_exit0_rand_313692602(Coordinator_WaitForTimeout_exit0_rand_313692602__payload_skip: any)
{


;

;

return;
}start 
 state Coordinator_Init
{
entry (payload: int) {
Coordinator_Init_entry138(payload);
}exit {
Coordinator_Init_exit0_rand_609305116(null);
}on Unit goto Coordinator_Loop with (payload: null) {
Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_1075530405(payload);
}}

 state Coordinator_DoRead
{
entry (payload: (machine, int)) {
Coordinator_DoRead_entry156(payload);
}exit {
Coordinator_DoRead_exit0_rand_1971227277(null);
}on READ_FAIL goto Coordinator_Loop with (payload: null) {
Coordinator_DoRead_on_READ_FAIL_goto_Coordinator_Loop175(payload);
}
on READ_SUCCESS goto Coordinator_Loop with (payload: int) {
Coordinator_DoRead_on_READ_SUCCESS_goto_Coordinator_Loop179(payload);
}}

 state Coordinator_Loop
{
entry (payload: any) {
Coordinator_Loop_entry0_rand_90398834(payload);
}exit {
Coordinator_Loop_exit0_rand_528197978(null);
}on WRITE_REQ do (payload: (machine, int, int)) {
Coordinator_Loop_do_WRITE_REQ197(payload);
}
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Unit goto Coordinator_CountVote with (payload: null) {
Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_2126466608(payload);
}
on READ_REQ goto Coordinator_DoRead with (payload: (machine, int)) {
Coordinator_Loop_on_READ_REQ_goto_Coordinator_DoRead0_rand_396432442(payload);
}}

 state Coordinator_CountVote
{
entry (payload: any) {
Coordinator_CountVote_entry214(payload);
}exit {
Coordinator_CountVote_exit0_rand_1072760980(null);
}defer WRITE_REQ;
defer READ_REQ;
on RESP_REPLICA_ABORT do (payload: int) {
Coordinator_CountVote_do_RESP_REPLICA_ABORT232(payload);
}on RESP_REPLICA_COMMIT goto Coordinator_CountVote with (payload: int) {
Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote228(payload);
}
on Timeout goto Coordinator_Loop with (payload: null) {
Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop234(payload);
}
on Unit goto Coordinator_WaitForCancelTimerResponse with (payload: null) {
Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_1643375038(payload);
}}

 state Coordinator_WaitForCancelTimerResponse
{
entry (payload: any) {
Coordinator_WaitForCancelTimerResponse_entry0_rand_129977302(payload);
}exit {
Coordinator_WaitForCancelTimerResponse_exit0_rand_565540917(null);
}defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with (payload: null) {
Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1666172036(payload);
}
on CancelTimerSuccess goto Coordinator_Loop with (payload: null) {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_1614926222(payload);
}
on CancelTimerFailure goto Coordinator_WaitForTimeout with (payload: null) {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_747338519(payload);
}}

 state Coordinator_WaitForTimeout
{
entry (payload: any) {
Coordinator_WaitForTimeout_entry0_rand_372380126(payload);
}exit {
Coordinator_WaitForTimeout_exit0_rand_313692602(null);
}defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with (payload: null) {
Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_282684905(payload);
}}
}

machine Client
{
var Client_coordinator: machine;
var Client_mydata: int;
var Client_counter: int;

fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_1694183691(Client_Init_on_Unit_goto_Client_DoWrite0_rand_1694183691__payload_skip: any)
{


;

;

return;
}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_397076618(Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_397076618__payload_skip: any)
{


;

;

return;
}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_611467246(Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_611467246__payload_skip: any)
{


;

;

return;
}
fun Client_DoWrite_on_goEnd_goto_Client_End0_rand_28451677(Client_DoWrite_on_goEnd_goto_Client_End0_rand_28451677__payload_skip: any)
{


;

;

return;
}
fun Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_74703959(Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_74703959__payload_skip: any)
{


;

;

return;
}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_67108795(Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_67108795__payload_skip: any)
{


;

;

return;
}
fun Client_Init_entry269(Client_Init_entry269_payload: (machine, int))
{


;

Client_coordinator = Client_Init_entry269_payload.0;
;

Client_mydata = Client_Init_entry269_payload.1;
;

Client_counter = 0;
;

raise Unit;
return;
}
fun Client_Init_exit0_rand_1086048859(Client_Init_exit0_rand_1086048859__payload_skip: any)
{


;

;

return;
}
fun Client_DoWrite_entry280(Client_DoWrite_entry280_payload: any)
{
var Tmp724: bool;
var Tmp725: (machine, int, int);


;

Client_mydata = (Client_mydata + 1);
;

Client_counter = (Client_counter + 1);
;

Tmp724 = (Client_counter == 3);
if(Tmp724)
{

;

raise goEnd;

}
else
{

;

;


}

;

Tmp725 = (this, Client_mydata, Client_mydata);
send Client_coordinator, WRITE_REQ, Tmp725;
return;
}
fun Client_DoWrite_exit0_rand_1185352628(Client_DoWrite_exit0_rand_1185352628__payload_skip: any)
{


;

;

return;
}
fun Client_DoRead_entry293(Client_DoRead_entry293__payload_4: null)
{
var Tmp726: (machine, int);


;

Tmp726 = (this, Client_mydata);
send Client_coordinator, READ_REQ, Tmp726;
return;
}
fun Client_DoRead_exit0_rand_947281288(Client_DoRead_exit0_rand_947281288__payload_skip: any)
{


;

;

return;
}
fun Client_End_entry0_rand_1791693054(Client_End_entry0_rand_1791693054__payload_skip: any)
{


;

;

return;
}
fun Client_End_exit0_rand_36860149(Client_End_exit0_rand_36860149__payload_skip: any)
{


;

;

return;
}start 
 state Client_Init
{
entry (payload: (machine, int)) {
Client_Init_entry269(payload);
}exit {
Client_Init_exit0_rand_1086048859(null);
}on Unit goto Client_DoWrite with (payload: null) {
Client_Init_on_Unit_goto_Client_DoWrite0_rand_1694183691(payload);
}}

 state Client_DoWrite
{
entry (payload: any) {
Client_DoWrite_entry280(payload);
}exit {
Client_DoWrite_exit0_rand_1185352628(null);
}on WRITE_FAIL goto Client_DoRead with (payload: null) {
Client_DoWrite_on_WRITE_FAIL_goto_Client_DoRead0_rand_397076618(payload);
}
on WRITE_SUCCESS goto Client_DoRead with (payload: null) {
Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_611467246(payload);
}
on goEnd goto Client_End with (payload: null) {
Client_DoWrite_on_goEnd_goto_Client_End0_rand_28451677(payload);
}}

 state Client_DoRead
{
entry (payload: null) {
Client_DoRead_entry293(payload);
}exit {
Client_DoRead_exit0_rand_947281288(null);
}on READ_FAIL goto Client_DoWrite with (payload: null) {
Client_DoRead_on_READ_FAIL_goto_Client_DoWrite0_rand_74703959(payload);
}
on READ_SUCCESS goto Client_DoWrite with (payload: int) {
Client_DoRead_on_READ_SUCCESS_goto_Client_DoWrite0_rand_67108795(payload);
}}

 state Client_End
{
entry (payload: any) {
Client_End_entry0_rand_1791693054(payload);
}exit {
Client_End_exit0_rand_36860149(null);
}}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;

fun TwoPhaseCommit_Init_entry308(TwoPhaseCommit_Init_entry308__payload_5: null)
{
var Tmp727: machine;
var Tmp728: (machine, int);
var Tmp729: (machine, int);


;

Tmp727 = new Coordinator(2);
TwoPhaseCommit_coordinator = Tmp727;
;

Tmp728 = (TwoPhaseCommit_coordinator, 100);
new Client(Tmp728);
;

Tmp729 = (TwoPhaseCommit_coordinator, 200);
new Client(Tmp729);
return;
}
fun TwoPhaseCommit_Init_exit0_rand_1506879084(TwoPhaseCommit_Init_exit0_rand_1506879084__payload_skip: any)
{


;

;

return;
}start 
 state TwoPhaseCommit_Init
{
entry (payload: null) {
TwoPhaseCommit_Init_entry308(payload);
}exit {
TwoPhaseCommit_Init_exit0_rand_1506879084(null);
}}
}

