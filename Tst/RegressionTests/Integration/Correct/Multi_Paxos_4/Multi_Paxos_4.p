event prepare  assume 3: (machine, int, (int, int));
event accept  assume 3: (machine, int, (int, int), int);
event agree  assume 6: (int, (int, int), int);
event reject  assume 6: (int, (int, int));
event accepted  assume 6: (int, (int, int), int);
event local;
event success;
event allNodes: (seq[machine]);
event goPropose;
event chosen: (int, (int, int), int);
event update: (int, int);
event monitor_valueChosen: (machine, int, (int, int), int);
event monitor_valueProposed: (machine, int, (int, int), int);
event monitor_client_sent: int;
event monitor_proposer_sent: int;
event monitor_proposer_chosen: int;
event Ping  assume 4: (int, machine);
event newLeader: (int, machine);
event timeout: (machine);
event startTimer;
event cancelTimer;
event cancelTimerSuccess;
event response;

machine PaxosNode
{
var PaxosNode_currentLeader: (int, machine);
var PaxosNode_leaderElectionService: machine;
var PaxosNode_acceptors: seq[machine];
var PaxosNode_commitValue: int;
var PaxosNode_proposeVal: int;
var PaxosNode_majority: int;
var PaxosNode_roundNum: int;
var PaxosNode_myRank: int;
var PaxosNode_nextProposal: (int, int);
var PaxosNode_receivedAgree: ((int, int), int);
var PaxosNode_iter: int;
var PaxosNode_maxRound: int;
var PaxosNode_countAccept: int;
var PaxosNode_countAgree: int;
var PaxosNode_tempVal: int;
var PaxosNode_returnVal: bool;
var PaxosNode_timer: machine;
var PaxosNode_receivedMess_1: (int, (int, int), int);
var PaxosNode_nextSlotForProposer: int;
var PaxosNode_currCommitOperation: bool;
var PaxosNode_acceptorSlots: map[int, ((int, int), int)];
var PaxosNode_receivedMess_2: (machine, int, (int, int), int);
var PaxosNode_learnerSlots: map[int, ((int, int), int)];
var PaxosNode_lastExecutedSlot: int;

fun PaxosNode_UpdateAcceptors(PaxosNode_UpdateAcceptors_payload: (seq[machine]))
{
var Tmp528: bool;
var Tmp529: (seq[machine], machine, int);
var Tmp530: machine;


;

PaxosNode_acceptors = PaxosNode_UpdateAcceptors_payload.0;
;

PaxosNode_majority = ((sizeof(PaxosNode_acceptors) / 2) + 1);
;

Tmp528 = (PaxosNode_majority == 2);
assert Tmp528;
;

Tmp529 = (PaxosNode_acceptors, this, PaxosNode_myRank);
Tmp530 = new LeaderElection(Tmp529);
PaxosNode_leaderElectionService = Tmp530;
;

raise local;
}
fun PaxosNode_CheckIfLeader(PaxosNode_CheckIfLeader_payload: (int, int))
{
var Tmp531: bool;


;

Tmp531 = (PaxosNode_currentLeader.0 == PaxosNode_myRank);
if(Tmp531)
{

;

PaxosNode_commitValue = PaxosNode_CheckIfLeader_payload.1;
;

PaxosNode_proposeVal = PaxosNode_commitValue;
;

raise goPropose;

}
else
{

;

send PaxosNode_currentLeader.1, update, PaxosNode_CheckIfLeader_payload;

}

}
fun PaxosNode_preparefun(PaxosNode_preparefun_receivedMess_2: (machine, int, (int, int)))
{
var Tmp532: bool;
var Tmp533: (int, int);
var Tmp534: (int, (int, int), int);
var Tmp535: ((int, int), int);
var Tmp536: ((int, int), int);
var Tmp537: ((int, int), int);
var Tmp538: (int, (int, int));
var Tmp539: ((int, int), int);
var Tmp540: ((int, int), int);
var Tmp541: (int, (int, int), int);
var Tmp542: ((int, int), int);


;

Tmp532 = (PaxosNode_preparefun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(!(Tmp532))
{

;

Tmp533 = (-(1), -(1));
Tmp534 = (PaxosNode_preparefun_receivedMess_2.1, Tmp533, -(1));
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp534;
;

Tmp535 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp535;
;

return;

}
else
{

;

;


}

;

Tmp536 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, Tmp536.0);
;

if(PaxosNode_returnVal)
{

;

Tmp537 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp538 = (PaxosNode_preparefun_receivedMess_2.1, Tmp537.0);
send PaxosNode_preparefun_receivedMess_2.0, reject, Tmp538;

}
else
{

;

Tmp539 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp540 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp541 = (PaxosNode_preparefun_receivedMess_2.1, Tmp539.0, Tmp540.1);
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp541;
;

Tmp542 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp542;

}

}
fun PaxosNode_acceptfun(PaxosNode_acceptfun_receivedMess_2: (machine, int, (int, int), int))
{
var Tmp543: bool;
var Tmp544: ((int, int), int);
var Tmp545: ((int, int), int);
var Tmp546: (int, (int, int));
var Tmp547: ((int, int), int);
var Tmp548: (int, (int, int), int);


;

Tmp543 = (PaxosNode_acceptfun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(Tmp543)
{

;

Tmp544 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, Tmp544.0);
;

if(!(PaxosNode_returnVal))
{

;

Tmp545 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
Tmp546 = (PaxosNode_acceptfun_receivedMess_2.1, Tmp545.0);
send PaxosNode_acceptfun_receivedMess_2.0, reject, Tmp546;

}
else
{

;

Tmp547 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = Tmp547;
;

Tmp548 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
send PaxosNode_acceptfun_receivedMess_2.0, accepted, Tmp548;

}


}
else
{

;

;


}

}
fun PaxosNode_GetNextProposal(PaxosNode_GetNextProposal_maxRound: int): (int, int)
{
var Tmp549: (int, int);


;

Tmp549 = ((PaxosNode_GetNextProposal_maxRound + 1), PaxosNode_myRank);
return (Tmp549);
}
fun PaxosNode_equal(PaxosNode_equal_p1: (int, int), PaxosNode_equal_p2: (int, int)): bool
{
var Tmp550: bool;
var Tmp551: bool;


;

Tmp550 = (PaxosNode_equal_p1.0 == PaxosNode_equal_p2.0);
Tmp551 = (PaxosNode_equal_p1.1 == PaxosNode_equal_p2.1);
if((Tmp550 && Tmp551))
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
fun PaxosNode_lessThan(PaxosNode_lessThan_p1: (int, int), PaxosNode_lessThan_p2: (int, int)): bool
{
var Tmp552: bool;


;

if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

;

return (true);

}
else
{

;

Tmp552 = (PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0);
if(Tmp552)
{

;

if((PaxosNode_lessThan_p1.1 < PaxosNode_lessThan_p2.1))
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
else
{

;

return (false);

}


}

}
fun PaxosNode_BroadCastAcceptors(PaxosNode_BroadCastAcceptors_mess: event, PaxosNode_BroadCastAcceptors_pay: any)
{
var Tmp553: machine;


;

PaxosNode_iter = 0;
;

while((PaxosNode_iter < sizeof(PaxosNode_acceptors)))
{

;

Tmp553 = PaxosNode_acceptors[PaxosNode_iter];
send Tmp553, PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
;

PaxosNode_iter = (PaxosNode_iter + 1);

}

}
fun PaxosNode_CountAccepted(PaxosNode_CountAccepted_receivedMess_1: (int, (int, int), int))
{
var Tmp554: bool;
var Tmp555: bool;
var Tmp556: (machine, int, (int, int), int);


;

Tmp554 = (PaxosNode_CountAccepted_receivedMess_1.0 == PaxosNode_nextSlotForProposer);
if(Tmp554)
{

;

PaxosNode_returnVal = PaxosNode_equal(PaxosNode_CountAccepted_receivedMess_1.1, PaxosNode_nextProposal);
;

if(PaxosNode_returnVal)
{

;

PaxosNode_countAccept = (PaxosNode_countAccept + 1);

}
else
{

;

;


}

;

Tmp555 = (PaxosNode_countAccept == PaxosNode_majority);
if(Tmp555)
{

;

Tmp556 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
monitor (monitor_valueChosen), (Tmp556);
;

send PaxosNode_timer, cancelTimer;
;

monitor (monitor_proposer_chosen), (PaxosNode_proposeVal);
;

PaxosNode_nextSlotForProposer = (PaxosNode_nextSlotForProposer + 1);
;

raise chosen, PaxosNode_CountAccepted_receivedMess_1;

}
else
{

;

;


}


}
else
{

;

;


}

}
fun PaxosNode_getHighestProposedValue(): int
{
var Tmp557: bool;


;

Tmp557 = (PaxosNode_receivedAgree.1 == -(1));
if(!(Tmp557))
{

;

PaxosNode_currCommitOperation = false;
;

return (PaxosNode_receivedAgree.1);

}
else
{

;

PaxosNode_currCommitOperation = true;
;

return (PaxosNode_commitValue);

}

}
fun PaxosNode_RunReplicatedMachine()
{
var Tmp558: bool;


;

while(true)
{

;

Tmp558 = ((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots);
if(Tmp558)
{

;

PaxosNode_lastExecutedSlot = (PaxosNode_lastExecutedSlot + 1);

}
else
{

;

return;

}


}

}
fun PaxosNode_Init_do_allNodes60(PaxosNode_Init_do_allNodes60_payload: (seq[machine]))
{


;

PaxosNode_UpdateAcceptors(PaxosNode_Init_do_allNodes60_payload);
return;
}
fun PaxosNode_PerformOperation_do_update91(PaxosNode_PerformOperation_do_update91_payload: (int, int))
{


;

PaxosNode_CheckIfLeader(PaxosNode_PerformOperation_do_update91_payload);
return;
}
fun PaxosNode_PerformOperation_do_prepare95(PaxosNode_PerformOperation_do_prepare95_payload: (machine, int, (int, int)))
{


;

PaxosNode_preparefun(PaxosNode_PerformOperation_do_prepare95_payload);
return;
}
fun PaxosNode_PerformOperation_do_accept96(PaxosNode_PerformOperation_do_accept96_payload: (machine, int, (int, int), int))
{


;

PaxosNode_acceptfun(PaxosNode_PerformOperation_do_accept96_payload);
return;
}
fun PaxosNode_PerformOperation_do_Ping102(PaxosNode_PerformOperation_do_Ping102_payload: (int, machine))
{


;

send PaxosNode_leaderElectionService, Ping, PaxosNode_PerformOperation_do_Ping102_payload;
return;
}
fun PaxosNode_PerformOperation_do_newLeader103(PaxosNode_PerformOperation_do_newLeader103_payload: (int, machine))
{


;

PaxosNode_currentLeader = PaxosNode_PerformOperation_do_newLeader103_payload;
return;
}
fun PaxosNode_ProposeValuePhase1_do_agree199(PaxosNode_ProposeValuePhase1_do_agree199_receivedMess: (int, (int, int), int))
{
var Tmp559: bool;
var Tmp560: bool;


;

Tmp559 = (PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.0 == PaxosNode_nextSlotForProposer);
if(Tmp559)
{

;

PaxosNode_countAgree = (PaxosNode_countAgree + 1);
;

PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_receivedAgree.0, PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1);
;

if(PaxosNode_returnVal)
{

;

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1;
;

PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.2;

}
else
{

;

;


}

;

Tmp560 = (PaxosNode_countAgree == PaxosNode_majority);
if(Tmp560)
{

;

raise success;

}
else
{

;

;


}


}
else
{

;

;


}

return;
}
fun PaxosNode_ProposeValuePhase2_do_accepted276(PaxosNode_ProposeValuePhase2_do_accepted276_payload: (int, (int, int), int))
{


;

PaxosNode_CountAccepted(PaxosNode_ProposeValuePhase2_do_accepted276_payload);
return;
}
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_1271102244(PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_1271102244__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214(PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload: (int, (int, int)))
{


;

if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0))
{

;

PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0;

}
else
{

;

;


}

;

send PaxosNode_timer, cancelTimer;
return;
}
fun PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221(PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221__payload_0: null)
{


;

send PaxosNode_timer, cancelTimer;
return;
}
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1519126984(PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1519126984__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279(PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload: (int, (int, int)))
{


;

if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0))
{

;

PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0;

}
else
{

;

;


}

;

send PaxosNode_timer, cancelTimer;
return;
}
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_764665599(PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_764665599__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_Init_entry52(PaxosNode_Init_entry52_payload: (int))
{
var Tmp561: (int, machine);
var Tmp562: (machine, int);
var Tmp563: machine;


;

PaxosNode_myRank = PaxosNode_Init_entry52_payload.0;
;

Tmp561 = (PaxosNode_myRank, this);
PaxosNode_currentLeader = Tmp561;
;

PaxosNode_roundNum = 0;
;

PaxosNode_maxRound = 0;
;

Tmp562 = (this, 10);
Tmp563 = new Timer(Tmp562);
PaxosNode_timer = Tmp563;
;

PaxosNode_lastExecutedSlot = -(1);
;

PaxosNode_nextSlotForProposer = 0;
return;
}
fun PaxosNode_Init_exit0_rand_264540619(PaxosNode_Init_exit0_rand_264540619__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_PerformOperation_entry0_rand_1411446349(PaxosNode_PerformOperation_entry0_rand_1411446349__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_PerformOperation_exit0_rand_1037595866(PaxosNode_PerformOperation_exit0_rand_1037595866__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase1_entry190(PaxosNode_ProposeValuePhase1_entry190_payload: any)
{
var Tmp564: (int, int);
var Tmp565: ((int, int), int);
var Tmp566: (int, int);
var Tmp567: (machine, int, (int, int));


;

PaxosNode_countAgree = 0;
;

PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);
;

Tmp564 = (-(1), -(1));
Tmp565 = (Tmp564, -(1));
PaxosNode_receivedAgree = Tmp565;
;

Tmp566 = (PaxosNode_nextProposal.0, PaxosNode_myRank);
Tmp567 = (this, PaxosNode_nextSlotForProposer, Tmp566);
PaxosNode_BroadCastAcceptors(prepare, Tmp567);
;

monitor (monitor_proposer_sent), (PaxosNode_proposeVal);
;

send PaxosNode_timer, startTimer;
return;
}
fun PaxosNode_ProposeValuePhase1_exit0_rand_183735713(PaxosNode_ProposeValuePhase1_exit0_rand_183735713__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase2_entry265(PaxosNode_ProposeValuePhase2_entry265__payload_1: null)
{
var Tmp568: (machine, int, (int, int), int);
var Tmp569: (machine, int, (int, int), int);


;

PaxosNode_countAccept = 0;
;

PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();
;

Tmp568 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
monitor (monitor_valueProposed), (Tmp568);
;

monitor (monitor_proposer_sent), (PaxosNode_proposeVal);
;

Tmp569 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
PaxosNode_BroadCastAcceptors(accept, Tmp569);
;

send PaxosNode_timer, startTimer;
return;
}
fun PaxosNode_ProposeValuePhase2_exit0_rand_1978577841(PaxosNode_ProposeValuePhase2_exit0_rand_1978577841__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_RunLearner_entry310(PaxosNode_RunLearner_entry310_receivedMess_1: (int, (int, int), int))
{
var Tmp570: ((int, int), int);
var Tmp571: bool;


;

Tmp570 = (PaxosNode_RunLearner_entry310_receivedMess_1.1, PaxosNode_RunLearner_entry310_receivedMess_1.2);
PaxosNode_learnerSlots[PaxosNode_RunLearner_entry310_receivedMess_1.0] = Tmp570;
;

PaxosNode_RunReplicatedMachine();
;

Tmp571 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry310_receivedMess_1.2);
if((PaxosNode_currCommitOperation && Tmp571))
{

;

pop;

}
else
{

;

PaxosNode_proposeVal = PaxosNode_commitValue;
;

raise goPropose;

}

return;
}
fun PaxosNode_RunLearner_exit0_rand_1075127006(PaxosNode_RunLearner_exit0_rand_1075127006__payload_skip: any)
{


;

;

return;
}start 
 state PaxosNode_Init
{
entry (payload: (int)) {
PaxosNode_Init_entry52(payload);
}exit {
PaxosNode_Init_exit0_rand_264540619(null);
}defer Ping;
on allNodes do (payload: (seq[machine])) {
PaxosNode_Init_do_allNodes60(payload);
}on local goto PaxosNode_PerformOperation with (payload: null) {
PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_1271102244(payload);
}}

 state PaxosNode_PerformOperation
{
entry (payload: any) {
PaxosNode_PerformOperation_entry0_rand_1411446349(payload);
}exit {
PaxosNode_PerformOperation_exit0_rand_1037595866(null);
}ignore agree;
ignore accepted;
ignore timeout;
on update do (payload: (int, int)) {
PaxosNode_PerformOperation_do_update91(payload);
}
on prepare do (payload: (machine, int, (int, int))) {
PaxosNode_PerformOperation_do_prepare95(payload);
}
on accept do (payload: (machine, int, (int, int), int)) {
PaxosNode_PerformOperation_do_accept96(payload);
}
on Ping do (payload: (int, machine)) {
PaxosNode_PerformOperation_do_Ping102(payload);
}
on newLeader do (payload: (int, machine)) {
PaxosNode_PerformOperation_do_newLeader103(payload);
}on goPropose push PaxosNode_ProposeValuePhase1;
on chosen push PaxosNode_RunLearner;}

 state PaxosNode_ProposeValuePhase1
{
entry (payload: any) {
PaxosNode_ProposeValuePhase1_entry190(payload);
}exit {
PaxosNode_ProposeValuePhase1_exit0_rand_183735713(null);
}ignore accepted;
on agree do (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase1_do_agree199(payload);
}on reject goto PaxosNode_ProposeValuePhase1 with (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214(payload);
}
on success goto PaxosNode_ProposeValuePhase2 with (payload: null) {
PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221(payload);
}
on timeout goto PaxosNode_ProposeValuePhase1 with (payload: (machine)) {
PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1519126984(payload);
}}

 state PaxosNode_ProposeValuePhase2
{
entry (payload: null) {
PaxosNode_ProposeValuePhase2_entry265(payload);
}exit {
PaxosNode_ProposeValuePhase2_exit0_rand_1978577841(null);
}ignore agree;
on accepted do (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase2_do_accepted276(payload);
}on reject goto PaxosNode_ProposeValuePhase1 with (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279(payload);
}
on timeout goto PaxosNode_ProposeValuePhase1 with (payload: (machine)) {
PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_764665599(payload);
}}

 state PaxosNode_RunLearner
{
entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry310(payload);
}exit {
PaxosNode_RunLearner_exit0_rand_1075127006(null);
}ignore agree;
ignore accepted;
ignore timeout;
ignore prepare;
ignore reject;
ignore accept;
defer newLeader;}
}

spec BasicPaxosInvariant_P2b monitors monitor_valueChosen, monitor_valueProposed 
{
var BasicPaxosInvariant_P2b_lastValueChosen: map[int, ((int, int), int)];
var BasicPaxosInvariant_P2b_returnVal: bool;
var BasicPaxosInvariant_P2b_receivedValue: (machine, int, (int, int), int);

fun BasicPaxosInvariant_P2b_lessThan(BasicPaxosInvariant_P2b_lessThan_p1: (int, int), BasicPaxosInvariant_P2b_lessThan_p2: (int, int)): bool
{
var Tmp572: bool;


;

if((BasicPaxosInvariant_P2b_lessThan_p1.0 < BasicPaxosInvariant_P2b_lessThan_p2.0))
{

;

return (true);

}
else
{

;

Tmp572 = (BasicPaxosInvariant_P2b_lessThan_p1.0 == BasicPaxosInvariant_P2b_lessThan_p2.0);
if(Tmp572)
{

;

if((BasicPaxosInvariant_P2b_lessThan_p1.1 < BasicPaxosInvariant_P2b_lessThan_p2.1))
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
else
{

;

return (false);

}


}

}
fun BasicPaxosInvariant_P2b_Init_on_local_goto_BasicPaxosInvariant_P2b_WaitForValueChosen0_rand_1538517793(BasicPaxosInvariant_P2b_Init_on_local_goto_BasicPaxosInvariant_P2b_WaitForValueChosen0_rand_1538517793__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed356(BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed356_receivedValue: (machine, int, (int, int), int))
{
var Tmp573: ((int, int), int);


;

Tmp573 = (BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed356_receivedValue.2, BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed356_receivedValue.3);
BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed356_receivedValue.1] = Tmp573;
return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed381(BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue: (machine, int, (int, int), int))
{
var Tmp574: ((int, int), int);
var Tmp575: bool;


;

Tmp574 = BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue.1];
Tmp575 = (Tmp574.1 == BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue.3);
assert Tmp575;
return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed385(BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed385_receivedValue: (machine, int, (int, int), int))
{
var Tmp576: ((int, int), int);
var Tmp577: ((int, int), int);
var Tmp578: bool;


;

Tmp576 = BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed385_receivedValue.1];
BasicPaxosInvariant_P2b_returnVal = BasicPaxosInvariant_P2b_lessThan(Tmp576.0, BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed385_receivedValue.2);
;

if(BasicPaxosInvariant_P2b_returnVal)
{

;

Tmp577 = BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed385_receivedValue.1];
Tmp578 = (Tmp577.1 == BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed385_receivedValue.3);
assert Tmp578;

}
else
{

;

;


}

return;
}
fun BasicPaxosInvariant_P2b_Init_entry343(BasicPaxosInvariant_P2b_Init_entry343__payload_2: null)
{


;

raise local;
return;
}
fun BasicPaxosInvariant_P2b_Init_exit0_rand_1843069024(BasicPaxosInvariant_P2b_Init_exit0_rand_1843069024__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_WaitForValueChosen_entry0_rand_1868758770(BasicPaxosInvariant_P2b_WaitForValueChosen_entry0_rand_1868758770__payload_3: null)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_WaitForValueChosen_exit0_rand_1721538537(BasicPaxosInvariant_P2b_WaitForValueChosen_exit0_rand_1721538537__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_entry0_rand_1755696974(BasicPaxosInvariant_P2b_CheckValueProposed_entry0_rand_1755696974__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_exit0_rand_973136988(BasicPaxosInvariant_P2b_CheckValueProposed_exit0_rand_973136988__payload_skip: any)
{


;

;

return;
}start 
 state BasicPaxosInvariant_P2b_Init
{
entry (payload: null) {
BasicPaxosInvariant_P2b_Init_entry343(payload);
}exit {
BasicPaxosInvariant_P2b_Init_exit0_rand_1843069024(null);
}on local goto BasicPaxosInvariant_P2b_WaitForValueChosen with (payload: null) {
BasicPaxosInvariant_P2b_Init_on_local_goto_BasicPaxosInvariant_P2b_WaitForValueChosen0_rand_1538517793(payload);
}}

 state BasicPaxosInvariant_P2b_WaitForValueChosen
{
entry (payload: null) {
BasicPaxosInvariant_P2b_WaitForValueChosen_entry0_rand_1868758770(payload);
}exit {
BasicPaxosInvariant_P2b_WaitForValueChosen_exit0_rand_1721538537(null);
}ignore monitor_valueProposed;on monitor_valueChosen goto BasicPaxosInvariant_P2b_CheckValueProposed with (payload: (machine, int, (int, int), int)) {
BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed356(payload);
}}

 state BasicPaxosInvariant_P2b_CheckValueProposed
{
entry (payload: any) {
BasicPaxosInvariant_P2b_CheckValueProposed_entry0_rand_1755696974(payload);
}exit {
BasicPaxosInvariant_P2b_CheckValueProposed_exit0_rand_973136988(null);
}on monitor_valueChosen goto BasicPaxosInvariant_P2b_CheckValueProposed with (payload: (machine, int, (int, int), int)) {
BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed381(payload);
}
on monitor_valueProposed goto BasicPaxosInvariant_P2b_CheckValueProposed with (payload: (machine, int, (int, int), int)) {
BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed385(payload);
}}
}

spec ValmachineityCheck monitors monitor_client_sent, monitor_proposer_sent, monitor_proposer_chosen 
{
var ValmachineityCheck_clientSet: map[int, int];
var ValmachineityCheck_ProposedSet: map[int, int];

fun ValmachineityCheck_Wait_do_monitor_client_sent415(ValmachineityCheck_Wait_do_monitor_client_sent415_payload: int)
{


;

ValmachineityCheck_clientSet[ValmachineityCheck_Wait_do_monitor_client_sent415_payload] = 0;
return;
}
fun ValmachineityCheck_Wait_do_monitor_proposer_sent416(ValmachineityCheck_Wait_do_monitor_proposer_sent416_payload: int)
{
var Tmp579: bool;


;

Tmp579 = (ValmachineityCheck_Wait_do_monitor_proposer_sent416_payload in ValmachineityCheck_clientSet);
assert Tmp579;
;

ValmachineityCheck_ProposedSet[ValmachineityCheck_Wait_do_monitor_proposer_sent416_payload] = 0;
return;
}
fun ValmachineityCheck_Wait_do_monitor_proposer_chosen418(ValmachineityCheck_Wait_do_monitor_proposer_chosen418_payload: int)
{
var Tmp580: bool;


;

Tmp580 = (ValmachineityCheck_Wait_do_monitor_proposer_chosen418_payload in ValmachineityCheck_ProposedSet);
assert Tmp580;
return;
}
fun ValmachineityCheck_Init_on_local_goto_ValmachineityCheck_Wait0_rand_856043150(ValmachineityCheck_Init_on_local_goto_ValmachineityCheck_Wait0_rand_856043150__payload_skip: any)
{


;

;

return;
}
fun ValmachineityCheck_Init_entry409(ValmachineityCheck_Init_entry409__payload_4: null)
{


;

raise local;
return;
}
fun ValmachineityCheck_Init_exit0_rand_457609724(ValmachineityCheck_Init_exit0_rand_457609724__payload_skip: any)
{


;

;

return;
}
fun ValmachineityCheck_Wait_entry0_rand_19050990(ValmachineityCheck_Wait_entry0_rand_19050990__payload_skip: any)
{


;

;

return;
}
fun ValmachineityCheck_Wait_exit0_rand_646661370(ValmachineityCheck_Wait_exit0_rand_646661370__payload_skip: any)
{


;

;

return;
}start 
 state ValmachineityCheck_Init
{
entry (payload: null) {
ValmachineityCheck_Init_entry409(payload);
}exit {
ValmachineityCheck_Init_exit0_rand_457609724(null);
}on local goto ValmachineityCheck_Wait with (payload: null) {
ValmachineityCheck_Init_on_local_goto_ValmachineityCheck_Wait0_rand_856043150(payload);
}}

 state ValmachineityCheck_Wait
{
entry (payload: any) {
ValmachineityCheck_Wait_entry0_rand_19050990(payload);
}exit {
ValmachineityCheck_Wait_exit0_rand_646661370(null);
}on monitor_client_sent do (payload: int) {
ValmachineityCheck_Wait_do_monitor_client_sent415(payload);
}
on monitor_proposer_sent do (payload: int) {
ValmachineityCheck_Wait_do_monitor_proposer_sent416(payload);
}
on monitor_proposer_chosen do (payload: int) {
ValmachineityCheck_Wait_do_monitor_proposer_chosen418(payload);
}}
}

machine LeaderElection
{
var LeaderElection_servers: seq[machine];
var LeaderElection_parentServer: machine;
var LeaderElection_currentLeader: (int, machine);
var LeaderElection_myRank: int;
var LeaderElection_iter: int;

fun LeaderElection_GetNewLeader(): (int, machine)
{
var Tmp581: machine;
var Tmp582: (int, machine);


;

Tmp581 = LeaderElection_servers[0];
Tmp582 = (1, Tmp581);
return (Tmp582);
}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_2064042745(LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_2064042745__payload_skip: any)
{


;

;

return;
}
fun LeaderElection_Init_entry444(LeaderElection_Init_entry444_payload: (seq[machine], machine, int))
{
var Tmp583: (int, machine);


;

LeaderElection_servers = LeaderElection_Init_entry444_payload.0;
;

LeaderElection_parentServer = LeaderElection_Init_entry444_payload.1;
;

LeaderElection_myRank = LeaderElection_Init_entry444_payload.2;
;

Tmp583 = (LeaderElection_myRank, this);
LeaderElection_currentLeader = Tmp583;
;

raise local;
return;
}
fun LeaderElection_Init_exit0_rand_1975544890(LeaderElection_Init_exit0_rand_1975544890__payload_skip: any)
{


;

;

return;
}
fun LeaderElection_SendLeader_entry456(LeaderElection_SendLeader_entry456__payload_5: null)
{


;

LeaderElection_currentLeader = LeaderElection_GetNewLeader();
;

assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);
;

send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;
return;
}
fun LeaderElection_SendLeader_exit0_rand_1998458005(LeaderElection_SendLeader_exit0_rand_1998458005__payload_skip: any)
{


;

;

return;
}start 
 state LeaderElection_Init
{
entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry444(payload);
}exit {
LeaderElection_Init_exit0_rand_1975544890(null);
}on local goto LeaderElection_SendLeader with (payload: null) {
LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_2064042745(payload);
}}

 state LeaderElection_SendLeader
{
entry (payload: null) {
LeaderElection_SendLeader_entry456(payload);
}exit {
LeaderElection_SendLeader_exit0_rand_1998458005(null);
}}
}

machine Timer
{
var Timer_target: machine;
var Timer_timeoutvalue: int;

fun Timer_Init_on_local_goto_Timer_Loop0_rand_542711477(Timer_Init_on_local_goto_Timer_Loop0_rand_542711477__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_643377661(Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_643377661__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_2076742464(Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_2076742464__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_58352118(Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_58352118__payload_skip: any)
{


;

;

return;
}
fun Timer_Init_entry486(Timer_Init_entry486_payload: (machine, int))
{


;

Timer_target = Timer_Init_entry486_payload.0;
;

Timer_timeoutvalue = Timer_Init_entry486_payload.1;
;

raise local;
return;
}
fun Timer_Init_exit0_rand_104183047(Timer_Init_exit0_rand_104183047__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_entry0_rand_1269143486(Timer_Loop_entry0_rand_1269143486__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_exit0_rand_311900162(Timer_Loop_exit0_rand_311900162__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_entry501(Timer_TimerStarted_entry501__payload_6: null)
{
var Tmp584: bool;


;

Tmp584 = $;
if(Tmp584)
{

;

raise local;

}
else
{

;

;


}

return;
}
fun Timer_TimerStarted_exit0_rand_309873717(Timer_TimerStarted_exit0_rand_309873717__payload_skip: any)
{


;

;

return;
}start 
 state Timer_Init
{
entry (payload: (machine, int)) {
Timer_Init_entry486(payload);
}exit {
Timer_Init_exit0_rand_104183047(null);
}on local goto Timer_Loop with (payload: null) {
Timer_Init_on_local_goto_Timer_Loop0_rand_542711477(payload);
}}

 state Timer_Loop
{
entry (payload: any) {
Timer_Loop_entry0_rand_1269143486(payload);
}exit {
Timer_Loop_exit0_rand_311900162(null);
}ignore cancelTimer;on startTimer goto Timer_TimerStarted with (payload: null) {
Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_643377661(payload);
}}

 state Timer_TimerStarted
{
entry (payload: null) {
Timer_TimerStarted_entry501(payload);
}exit {
Timer_TimerStarted_exit0_rand_309873717(null);
}ignore startTimer;on local goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_2076742464(payload);
}
on cancelTimer goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_58352118(payload);
}}
}

main machine GodMachine
{
var GodMachine_paxosnodes: seq[machine];
var GodMachine_temp: machine;
var GodMachine_iter: int;

fun GodMachine_Init_entry519(GodMachine_Init_entry519__payload_7: null)
{
var Tmp585: (int);
var Tmp586: machine;
var Tmp587: (int);
var Tmp588: machine;
var Tmp589: (int);
var Tmp590: machine;
var Tmp591: machine;
var Tmp592: (seq[machine]);


;

Tmp585 = (3,);
Tmp586 = new PaxosNode(Tmp585);
GodMachine_temp = Tmp586;
;

GodMachine_paxosnodes += (0, GodMachine_temp);
;

Tmp587 = (2,);
Tmp588 = new PaxosNode(Tmp587);
GodMachine_temp = Tmp588;
;

GodMachine_paxosnodes += (0, GodMachine_temp);
;

Tmp589 = (1,);
Tmp590 = new PaxosNode(Tmp589);
GodMachine_temp = Tmp590;
;

GodMachine_paxosnodes += (0, GodMachine_temp);
;

GodMachine_iter = 0;
;

while((GodMachine_iter < sizeof(GodMachine_paxosnodes)))
{

;

Tmp591 = GodMachine_paxosnodes[GodMachine_iter];
Tmp592 = (GodMachine_paxosnodes,);
send Tmp591, allNodes, Tmp592;
;

GodMachine_iter = (GodMachine_iter + 1);

}

;

new Client(GodMachine_paxosnodes);
return;
}
fun GodMachine_Init_exit0_rand_1955655524(GodMachine_Init_exit0_rand_1955655524__payload_skip: any)
{


;

;

return;
}start 
 state GodMachine_Init
{
entry (payload: null) {
GodMachine_Init_entry519(payload);
}exit {
GodMachine_Init_exit0_rand_1955655524(null);
}}
}

machine Client
{
var Client_servers: seq[machine];

fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_387515293(Client_Init_on_local_goto_Client_PumpRequestOne0_rand_387515293__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_455434188(Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_455434188__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_213002997(Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_213002997__payload_skip: any)
{


;

;

return;
}
fun Client_Init_entry542(Client_Init_entry542_payload: seq[machine])
{


;

Client_servers = Client_Init_entry542_payload;
;

raise local;
return;
}
fun Client_Init_exit0_rand_680177788(Client_Init_exit0_rand_680177788__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestOne_entry551(Client_PumpRequestOne_entry551__payload_8: null)
{
var Tmp593: bool;
var Tmp594: machine;
var Tmp595: (int, int);
var Tmp596: machine;
var Tmp597: (int, int);


;

monitor (monitor_client_sent), (1);
;

Tmp593 = $;
if(Tmp593)
{

;

Tmp594 = Client_servers[0];
Tmp595 = (0, 1);
send Tmp594, update, Tmp595;

}
else
{

;

Tmp596 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp597 = (0, 1);
send Tmp596, update, Tmp597;

}

;

raise response;
return;
}
fun Client_PumpRequestOne_exit0_rand_877869650(Client_PumpRequestOne_exit0_rand_877869650__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestTwo_entry565(Client_PumpRequestTwo_entry565__payload_9: null)
{
var Tmp598: bool;
var Tmp599: machine;
var Tmp600: (int, int);
var Tmp601: machine;
var Tmp602: (int, int);


;

monitor (monitor_client_sent), (2);
;

Tmp598 = $;
if(Tmp598)
{

;

Tmp599 = Client_servers[0];
Tmp600 = (0, 2);
send Tmp599, update, Tmp600;

}
else
{

;

Tmp601 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp602 = (0, 2);
send Tmp601, update, Tmp602;

}

;

raise response;
return;
}
fun Client_PumpRequestTwo_exit0_rand_1233399801(Client_PumpRequestTwo_exit0_rand_1233399801__payload_skip: any)
{


;

;

return;
}
fun Client_Done_entry0_rand_664055849(Client_Done_entry0_rand_664055849__payload_skip: any)
{


;

;

return;
}
fun Client_Done_exit0_rand_1866053176(Client_Done_exit0_rand_1866053176__payload_skip: any)
{


;

;

return;
}start 
 state Client_Init
{
entry (payload: seq[machine]) {
Client_Init_entry542(payload);
}exit {
Client_Init_exit0_rand_680177788(null);
}on local goto Client_PumpRequestOne with (payload: null) {
Client_Init_on_local_goto_Client_PumpRequestOne0_rand_387515293(payload);
}}

 state Client_PumpRequestOne
{
entry (payload: null) {
Client_PumpRequestOne_entry551(payload);
}exit {
Client_PumpRequestOne_exit0_rand_877869650(null);
}on response goto Client_PumpRequestTwo with (payload: null) {
Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_455434188(payload);
}}

 state Client_PumpRequestTwo
{
entry (payload: null) {
Client_PumpRequestTwo_entry565(payload);
}exit {
Client_PumpRequestTwo_exit0_rand_1233399801(null);
}on response goto Client_Done with (payload: null) {
Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_213002997(payload);
}}

 state Client_Done
{
entry (payload: any) {
Client_Done_entry0_rand_664055849(payload);
}exit {
Client_Done_exit0_rand_1866053176(null);
}}
}

