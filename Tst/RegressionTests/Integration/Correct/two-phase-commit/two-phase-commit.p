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

machine Timer
{
var Timer_target: machine;

fun Timer_Init_on_Unit_goto_Timer_Loop0_rand_1402311736(Timer_Init_on_Unit_goto_Timer_Loop0_rand_1402311736__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_1179499349(Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_1179499349__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_981711295(Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_981711295__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47(Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47__payload_0: null)
{
var Tmp671: bool;


;

Tmp671 = $;
if(Tmp671)
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
fun Timer_Init_entry27(Timer_Init_entry27_payload: machine)
{


;

Timer_target = Timer_Init_entry27_payload;
;

raise Unit;
return;
}
fun Timer_Init_exit0_rand_1468749617(Timer_Init_exit0_rand_1468749617__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_entry0_rand_1761078165(Timer_Loop_entry0_rand_1761078165__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_exit0_rand_2137690109(Timer_Loop_exit0_rand_2137690109__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_entry40(Timer_TimerStarted_entry40_payload: int)
{
var Tmp672: bool;


;

Tmp672 = $;
if(Tmp672)
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
fun Timer_TimerStarted_exit0_rand_1706709349(Timer_TimerStarted_exit0_rand_1706709349__payload_skip: any)
{


;

;

return;
}start 
 state Timer_Init
{
entry (payload: machine) {
Timer_Init_entry27(payload);
}exit {
Timer_Init_exit0_rand_1468749617(null);
}on Unit goto Timer_Loop with (payload: null) {
Timer_Init_on_Unit_goto_Timer_Loop0_rand_1402311736(payload);
}}

 state Timer_Loop
{
entry (payload: any) {
Timer_Loop_entry0_rand_1761078165(payload);
}exit {
Timer_Loop_exit0_rand_2137690109(null);
}ignore CancelTimer;on StartTimer goto Timer_TimerStarted with (payload: int) {
Timer_Loop_on_StartTimer_goto_Timer_TimerStarted0_rand_1179499349(payload);
}}

 state Timer_TimerStarted
{
entry (payload: int) {
Timer_TimerStarted_entry40(payload);
}exit {
Timer_TimerStarted_exit0_rand_1706709349(null);
}on Unit goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_Unit_goto_Timer_Loop0_rand_981711295(payload);
}
on CancelTimer goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_CancelTimer_goto_Timer_Loop47(payload);
}}
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
var Tmp673: bool;


;

Tmp673 = $;
return (Tmp673);
}
fun Replica_Loop_do_GLOBAL_ABORT87(Replica_Loop_do_GLOBAL_ABORT87_payload: int)
{
var Tmp674: bool;


;

assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_ABORT87_payload);
;

Tmp674 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_ABORT87_payload);
if(Tmp674)
{

;

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_ABORT87_payload;

}
else
{

;

;


}

return;
}
fun Replica_Loop_do_GLOBAL_COMMIT93(Replica_Loop_do_GLOBAL_COMMIT93_payload: int)
{
var Tmp675: bool;


;

assert (Replica_pendingWriteReq.0 >= Replica_Loop_do_GLOBAL_COMMIT93_payload);
;

Tmp675 = (Replica_pendingWriteReq.0 == Replica_Loop_do_GLOBAL_COMMIT93_payload);
if(Tmp675)
{

;

Replica_data[Replica_pendingWriteReq.1] = Replica_pendingWriteReq.2;
;

Replica_lastSeqNum = Replica_Loop_do_GLOBAL_COMMIT93_payload;

}
else
{

;

;


}

return;
}
fun Replica_Loop_do_REQ_REPLICA100(Replica_Loop_do_REQ_REPLICA100_payload: (int, int, int))
{


;

Replica_HandleReqReplica(Replica_Loop_do_REQ_REPLICA100_payload);
return;
}
fun Replica_Init_on_Unit_goto_Replica_Loop0_rand_1804755751(Replica_Init_on_Unit_goto_Replica_Loop0_rand_1804755751__payload_skip: any)
{


;

;

return;
}
fun Replica_Init_entry66(Replica_Init_entry66_payload: machine)
{


;

Replica_coordinator = Replica_Init_entry66_payload;
;

Replica_lastSeqNum = 0;
;

raise Unit;
return;
}
fun Replica_Init_exit0_rand_1617071480(Replica_Init_exit0_rand_1617071480__payload_skip: any)
{


;

;

return;
}
fun Replica_Loop_entry0_rand_1327607777(Replica_Loop_entry0_rand_1327607777__payload_skip: any)
{


;

;

return;
}
fun Replica_Loop_exit0_rand_1112390554(Replica_Loop_exit0_rand_1112390554__payload_skip: any)
{


;

;

return;
}start 
 state Replica_Init
{
entry (payload: machine) {
Replica_Init_entry66(payload);
}exit {
Replica_Init_exit0_rand_1617071480(null);
}on Unit goto Replica_Loop with (payload: null) {
Replica_Init_on_Unit_goto_Replica_Loop0_rand_1804755751(payload);
}}

 state Replica_Loop
{
entry (payload: any) {
Replica_Loop_entry0_rand_1327607777(payload);
}exit {
Replica_Loop_exit0_rand_1112390554(null);
}on GLOBAL_ABORT do (payload: int) {
Replica_Loop_do_GLOBAL_ABORT87(payload);
}
on GLOBAL_COMMIT do (payload: int) {
Replica_Loop_do_GLOBAL_COMMIT93(payload);
}
on REQ_REPLICA do (payload: (int, int, int)) {
Replica_Loop_do_REQ_REPLICA100(payload);
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

fun Coordinator_DoRead(Coordinator_DoRead_payload: (machine, int))
{
var Tmp676: bool;
var Tmp677: int;
var Tmp678: (int, int);
var Tmp679: int;


;

Tmp676 = (Coordinator_DoRead_payload.1 in Coordinator_data);
if(Tmp676)
{

;

Tmp677 = Coordinator_data[Coordinator_DoRead_payload.1];
Tmp678 = (Coordinator_DoRead_payload.1, Tmp677);
monitor (MONITOR_READ_SUCCESS), (Tmp678);
;

Tmp679 = Coordinator_data[Coordinator_DoRead_payload.1];
send Coordinator_DoRead_payload.0, READ_SUCCESS, Tmp679;

}
else
{

;

monitor (MONITOR_READ_UNAVAILABLE), (Coordinator_DoRead_payload.1);
;

send Coordinator_DoRead_payload.0, READ_UNAVAILABLE;

}

}
fun Coordinator_DoWrite(Coordinator_DoWrite_payload: (machine, int, int))
{
var Tmp680: machine;
var Tmp681: (int, int, int);


;

Coordinator_pendingWriteReq = Coordinator_DoWrite_payload;
;

Coordinator_currSeqNum = (Coordinator_currSeqNum + 1);
;

Coordinator_i = 0;
;

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

;

Tmp680 = Coordinator_replicas[Coordinator_i];
Tmp681 = (Coordinator_currSeqNum, Coordinator_pendingWriteReq.1, Coordinator_pendingWriteReq.2);
send Tmp680, REQ_REPLICA, Tmp681;
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
var Tmp682: machine;


;

Coordinator_i = 0;
;

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

;

Tmp682 = Coordinator_replicas[Coordinator_i];
send Tmp682, GLOBAL_ABORT, Coordinator_currSeqNum;
;

Coordinator_i = (Coordinator_i + 1);

}

;

send Coordinator_pendingWriteReq.0, WRITE_FAIL;
}
fun Coordinator_HandleAbort(Coordinator_HandleAbort_payload: int)
{
var Tmp683: bool;


;

Tmp683 = (Coordinator_currSeqNum == Coordinator_HandleAbort_payload);
if(Tmp683)
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
fun Coordinator_Loop_do_WRITE_REQ159(Coordinator_Loop_do_WRITE_REQ159_payload: (machine, int, int))
{


;

Coordinator_DoWrite(Coordinator_Loop_do_WRITE_REQ159_payload);
return;
}
fun Coordinator_Loop_do_READ_REQ161(Coordinator_Loop_do_READ_REQ161_payload: (machine, int))
{


;

Coordinator_DoRead(Coordinator_Loop_do_READ_REQ161_payload);
return;
}
fun Coordinator_CountVote_do_READ_REQ189(Coordinator_CountVote_do_READ_REQ189_payload: (machine, int))
{


;

Coordinator_DoRead(Coordinator_CountVote_do_READ_REQ189_payload);
return;
}
fun Coordinator_CountVote_do_RESP_REPLICA_ABORT195(Coordinator_CountVote_do_RESP_REPLICA_ABORT195_payload: int)
{


;

Coordinator_HandleAbort(Coordinator_CountVote_do_RESP_REPLICA_ABORT195_payload);
return;
}
fun Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_19754011(Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_19754011__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1411337571(Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1411337571__payload_skip: any)
{


;

;

return;
}
fun Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191(Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload: int)
{
var Tmp684: bool;


;

Tmp684 = (Coordinator_currSeqNum == Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191_payload);
if(Tmp684)
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
fun Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop197(Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop197__payload_1: null)
{


;

Coordinator_DoGlobalAbort();
return;
}
fun Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_46779923(Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_46779923__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1561355194(Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1561355194__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_751294282(Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_751294282__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_2047991670(Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_2047991670__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_545092844(Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_545092844__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Init_entry121(Coordinator_Init_entry121_payload: int)
{
var Tmp685: machine;
var Tmp686: machine;


;

Coordinator_numReplicas = Coordinator_Init_entry121_payload;
;

assert (Coordinator_numReplicas > 0);
;

Coordinator_i = 0;
;

while((Coordinator_i < Coordinator_numReplicas))
{

;

Tmp685 = new Replica(this);
Coordinator_replica = Tmp685;
;

Coordinator_replicas += (Coordinator_i, Coordinator_replica);
;

Coordinator_i = (Coordinator_i + 1);

}

;

Coordinator_currSeqNum = 0;
;

Tmp686 = new Timer(this);
Coordinator_timer = Tmp686;
;

raise Unit;
return;
}
fun Coordinator_Init_exit0_rand_1485862045(Coordinator_Init_exit0_rand_1485862045__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Loop_entry0_rand_933416249(Coordinator_Loop_entry0_rand_933416249__payload_skip: any)
{


;

;

return;
}
fun Coordinator_Loop_exit0_rand_1027812229(Coordinator_Loop_exit0_rand_1027812229__payload_skip: any)
{


;

;

return;
}
fun Coordinator_CountVote_entry176(Coordinator_CountVote_entry176_payload: any)
{
var Tmp687: bool;
var Tmp688: machine;
var Tmp689: (int, int);


;

Tmp687 = (Coordinator_i == 0);
if(Tmp687)
{

;

while((Coordinator_i < sizeof(Coordinator_replicas)))
{

;

Tmp688 = Coordinator_replicas[Coordinator_i];
send Tmp688, GLOBAL_COMMIT, Coordinator_currSeqNum;
;

Coordinator_i = (Coordinator_i + 1);

}

;

Coordinator_data[Coordinator_pendingWriteReq.1] = Coordinator_pendingWriteReq.2;
;

Tmp689 = (Coordinator_pendingWriteReq.1, Coordinator_pendingWriteReq.2);
monitor (MONITOR_WRITE), (Tmp689);
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
fun Coordinator_CountVote_exit0_rand_74038459(Coordinator_CountVote_exit0_rand_74038459__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_entry0_rand_2115227642(Coordinator_WaitForCancelTimerResponse_entry0_rand_2115227642__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForCancelTimerResponse_exit0_rand_1779181186(Coordinator_WaitForCancelTimerResponse_exit0_rand_1779181186__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForTimeout_entry0_rand_1640490883(Coordinator_WaitForTimeout_entry0_rand_1640490883__payload_skip: any)
{


;

;

return;
}
fun Coordinator_WaitForTimeout_exit0_rand_1438686554(Coordinator_WaitForTimeout_exit0_rand_1438686554__payload_skip: any)
{


;

;

return;
}start 
 state Coordinator_Init
{
entry (payload: int) {
Coordinator_Init_entry121(payload);
}exit {
Coordinator_Init_exit0_rand_1485862045(null);
}on Unit goto Coordinator_Loop with (payload: null) {
Coordinator_Init_on_Unit_goto_Coordinator_Loop0_rand_19754011(payload);
}}

 state Coordinator_Loop
{
entry (payload: any) {
Coordinator_Loop_entry0_rand_933416249(payload);
}exit {
Coordinator_Loop_exit0_rand_1027812229(null);
}on WRITE_REQ do (payload: (machine, int, int)) {
Coordinator_Loop_do_WRITE_REQ159(payload);
}
on READ_REQ do (payload: (machine, int)) {
Coordinator_Loop_do_READ_REQ161(payload);
}
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Unit goto Coordinator_CountVote with (payload: null) {
Coordinator_Loop_on_Unit_goto_Coordinator_CountVote0_rand_1411337571(payload);
}}

 state Coordinator_CountVote
{
entry (payload: any) {
Coordinator_CountVote_entry176(payload);
}exit {
Coordinator_CountVote_exit0_rand_74038459(null);
}defer WRITE_REQ;
on READ_REQ do (payload: (machine, int)) {
Coordinator_CountVote_do_READ_REQ189(payload);
}
on RESP_REPLICA_ABORT do (payload: int) {
Coordinator_CountVote_do_RESP_REPLICA_ABORT195(payload);
}on RESP_REPLICA_COMMIT goto Coordinator_CountVote with (payload: int) {
Coordinator_CountVote_on_RESP_REPLICA_COMMIT_goto_Coordinator_CountVote191(payload);
}
on Timeout goto Coordinator_Loop with (payload: null) {
Coordinator_CountVote_on_Timeout_goto_Coordinator_Loop197(payload);
}
on Unit goto Coordinator_WaitForCancelTimerResponse with (payload: null) {
Coordinator_CountVote_on_Unit_goto_Coordinator_WaitForCancelTimerResponse0_rand_46779923(payload);
}}

 state Coordinator_WaitForCancelTimerResponse
{
entry (payload: any) {
Coordinator_WaitForCancelTimerResponse_entry0_rand_2115227642(payload);
}exit {
Coordinator_WaitForCancelTimerResponse_exit0_rand_1779181186(null);
}defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with (payload: null) {
Coordinator_WaitForCancelTimerResponse_on_Timeout_goto_Coordinator_Loop0_rand_1561355194(payload);
}
on CancelTimerSuccess goto Coordinator_Loop with (payload: null) {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerSuccess_goto_Coordinator_Loop0_rand_751294282(payload);
}
on CancelTimerFailure goto Coordinator_WaitForTimeout with (payload: null) {
Coordinator_WaitForCancelTimerResponse_on_CancelTimerFailure_goto_Coordinator_WaitForTimeout0_rand_2047991670(payload);
}}

 state Coordinator_WaitForTimeout
{
entry (payload: any) {
Coordinator_WaitForTimeout_entry0_rand_1640490883(payload);
}exit {
Coordinator_WaitForTimeout_exit0_rand_1438686554(null);
}defer WRITE_REQ;
defer READ_REQ;
ignore RESP_REPLICA_COMMIT;
ignore RESP_REPLICA_ABORT;on Timeout goto Coordinator_Loop with (payload: null) {
Coordinator_WaitForTimeout_on_Timeout_goto_Coordinator_Loop0_rand_545092844(payload);
}}
}

machine Client
{
var Client_coordinator: machine;
var Client_idx: int;
var Client_val: int;

fun Client_ChooseIndex(): int
{
var Tmp690: bool;


;

Tmp690 = $;
if(Tmp690)
{

;

return (0);

}
else
{

;

return (1);

}

}
fun Client_ChooseValue(): int
{
var Tmp691: bool;


;

Tmp691 = $;
if(Tmp691)
{

;

return (0);

}
else
{

;

return (1);

}

}
fun Client_Init_on_Unit_goto_Client_DoWrite0_rand_1640443311(Client_Init_on_Unit_goto_Client_DoWrite0_rand_1640443311__payload_skip: any)
{


;

;

return;
}
fun Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_1993670909(Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_1993670909__payload_skip: any)
{


;

;

return;
}
fun Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_705614704(Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_705614704__payload_skip: any)
{


;

;

return;
}
fun Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_1668137761(Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_1668137761__payload_skip: any)
{


;

;

return;
}
fun Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_1666028303(Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_1666028303__payload_skip: any)
{


;

;

return;
}
fun Client_Init_entry228(Client_Init_entry228_payload: machine)
{


;

Client_coordinator = Client_Init_entry228_payload;
;

raise Unit;
return;
}
fun Client_Init_exit0_rand_721349214(Client_Init_exit0_rand_721349214__payload_skip: any)
{


;

;

return;
}
fun Client_DoWrite_entry237(Client_DoWrite_entry237__payload_2: null)
{
var Tmp692: (machine, int, int);


;

Client_idx = Client_ChooseIndex();
;

Client_val = Client_ChooseValue();
;

Tmp692 = (this, Client_idx, Client_val);
send Client_coordinator, WRITE_REQ, Tmp692;
return;
}
fun Client_DoWrite_exit0_rand_1550044477(Client_DoWrite_exit0_rand_1550044477__payload_skip: any)
{


;

;

return;
}
fun Client_DoRead_entry247(Client_DoRead_entry247__payload_3: null)
{
var Tmp693: (machine, int);


;

Tmp693 = (this, Client_idx);
send Client_coordinator, READ_REQ, Tmp693;
return;
}
fun Client_DoRead_exit0_rand_1465472931(Client_DoRead_exit0_rand_1465472931__payload_skip: any)
{


;

;

return;
}
fun Client_End_entry0_rand_1780337371(Client_End_entry0_rand_1780337371__payload_skip: any)
{


;

;

return;
}
fun Client_End_exit0_rand_1538160459(Client_End_exit0_rand_1538160459__payload_skip: any)
{


;

;

return;
}start 
 state Client_Init
{
entry (payload: machine) {
Client_Init_entry228(payload);
}exit {
Client_Init_exit0_rand_721349214(null);
}on Unit goto Client_DoWrite with (payload: null) {
Client_Init_on_Unit_goto_Client_DoWrite0_rand_1640443311(payload);
}}

 state Client_DoWrite
{
entry (payload: null) {
Client_DoWrite_entry237(payload);
}exit {
Client_DoWrite_exit0_rand_1550044477(null);
}on WRITE_FAIL goto Client_End with (payload: null) {
Client_DoWrite_on_WRITE_FAIL_goto_Client_End0_rand_1993670909(payload);
}
on WRITE_SUCCESS goto Client_DoRead with (payload: null) {
Client_DoWrite_on_WRITE_SUCCESS_goto_Client_DoRead0_rand_705614704(payload);
}}

 state Client_DoRead
{
entry (payload: null) {
Client_DoRead_entry247(payload);
}exit {
Client_DoRead_exit0_rand_1465472931(null);
}on READ_FAIL goto Client_End with (payload: null) {
Client_DoRead_on_READ_FAIL_goto_Client_End0_rand_1668137761(payload);
}
on READ_SUCCESS goto Client_End with (payload: int) {
Client_DoRead_on_READ_SUCCESS_goto_Client_End0_rand_1666028303(payload);
}}

 state Client_End
{
entry (payload: any) {
Client_End_entry0_rand_1780337371(payload);
}exit {
Client_End_exit0_rand_1538160459(null);
}}
}

spec M monitors MONITOR_WRITE, MONITOR_READ_SUCCESS, MONITOR_READ_UNAVAILABLE 
{
var M_data: map[int, int];

fun M_Init_do_MONITOR_WRITE278(M_Init_do_MONITOR_WRITE278_payload: (int, int))
{


;

M_data[M_Init_do_MONITOR_WRITE278_payload.0] = M_Init_do_MONITOR_WRITE278_payload.1;
return;
}
fun M_Init_do_MONITOR_READ_SUCCESS280(M_Init_do_MONITOR_READ_SUCCESS280_payload: (int, int))
{
var Tmp694: bool;
var Tmp695: int;
var Tmp696: bool;


;

Tmp694 = (M_Init_do_MONITOR_READ_SUCCESS280_payload.0 in M_data);
assert Tmp694;
;

Tmp695 = M_data[M_Init_do_MONITOR_READ_SUCCESS280_payload.0];
Tmp696 = (Tmp695 == M_Init_do_MONITOR_READ_SUCCESS280_payload.1);
assert Tmp696;
return;
}
fun M_Init_do_MONITOR_READ_UNAVAILABLE284(M_Init_do_MONITOR_READ_UNAVAILABLE284_payload: int)
{
var Tmp697: bool;


;

Tmp697 = (M_Init_do_MONITOR_READ_UNAVAILABLE284_payload in M_data);
assert !(Tmp697);
return;
}
fun M_Init_entry0_rand_1100487386(M_Init_entry0_rand_1100487386__payload_skip: any)
{


;

;

return;
}
fun M_Init_exit0_rand_1096369491(M_Init_exit0_rand_1096369491__payload_skip: any)
{


;

;

return;
}start 
 state M_Init
{
entry (payload: any) {
M_Init_entry0_rand_1100487386(payload);
}exit {
M_Init_exit0_rand_1096369491(null);
}on MONITOR_WRITE do (payload: (int, int)) {
M_Init_do_MONITOR_WRITE278(payload);
}
on MONITOR_READ_SUCCESS do (payload: (int, int)) {
M_Init_do_MONITOR_READ_SUCCESS280(payload);
}
on MONITOR_READ_UNAVAILABLE do (payload: int) {
M_Init_do_MONITOR_READ_UNAVAILABLE284(payload);
}}
}

main machine TwoPhaseCommit
{
var TwoPhaseCommit_coordinator: machine;
var TwoPhaseCommit_client: machine;

fun TwoPhaseCommit_Init_entry294(TwoPhaseCommit_Init_entry294__payload_4: null)
{
var Tmp698: machine;
var Tmp699: machine;
var Tmp700: machine;


;

Tmp698 = new Coordinator(2);
TwoPhaseCommit_coordinator = Tmp698;
;

Tmp699 = new Client(TwoPhaseCommit_coordinator);
TwoPhaseCommit_client = Tmp699;
;

Tmp700 = new Client(TwoPhaseCommit_coordinator);
TwoPhaseCommit_client = Tmp700;
return;
}
fun TwoPhaseCommit_Init_exit0_rand_1447385563(TwoPhaseCommit_Init_exit0_rand_1447385563__payload_skip: any)
{


;

;

return;
}start 
 state TwoPhaseCommit_Init
{
entry (payload: null) {
TwoPhaseCommit_Init_entry294(payload);
}exit {
TwoPhaseCommit_Init_exit0_rand_1447385563(null);
}}
}

