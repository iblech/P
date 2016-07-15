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
var Tmp472: bool;
var Tmp473: (seq[machine], machine, int);
var Tmp474: machine;


PaxosNode_acceptors = PaxosNode_UpdateAcceptors_payload.0;
PaxosNode_majority = ((sizeof(PaxosNode_acceptors) / 2) + 1);
Tmp472 = (PaxosNode_majority == 2);
assert Tmp472;
Tmp473 = (PaxosNode_acceptors, this, PaxosNode_myRank);
Tmp474 = new LeaderElection(Tmp473);
PaxosNode_leaderElectionService = Tmp474;
raise local;
}
fun PaxosNode_CheckIfLeader(PaxosNode_CheckIfLeader_payload: (int, int))
{
var Tmp475: bool;


Tmp475 = (PaxosNode_currentLeader.0 == PaxosNode_myRank);
if(Tmp475)
{

PaxosNode_commitValue = PaxosNode_CheckIfLeader_payload.1;
PaxosNode_proposeVal = PaxosNode_commitValue;
raise goPropose;

}
else
{

send PaxosNode_currentLeader.1, update, PaxosNode_CheckIfLeader_payload;

}

}
fun PaxosNode_preparefun(PaxosNode_preparefun_receivedMess_2: (machine, int, (int, int)))
{
var Tmp476: bool;
var Tmp477: (int, int);
var Tmp478: (int, (int, int), int);
var Tmp479: ((int, int), int);
var Tmp480: ((int, int), int);
var Tmp481: ((int, int), int);
var Tmp482: (int, (int, int));
var Tmp483: ((int, int), int);
var Tmp484: ((int, int), int);
var Tmp485: (int, (int, int), int);
var Tmp486: ((int, int), int);


Tmp476 = (PaxosNode_preparefun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(!(Tmp476))
{

Tmp477 = (-(1), -(1));
Tmp478 = (PaxosNode_preparefun_receivedMess_2.1, Tmp477, -(1));
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp478;
Tmp479 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp479;
return;

}
else
{

;


}

Tmp480 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, Tmp480.0);
if(PaxosNode_returnVal)
{

Tmp481 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp482 = (PaxosNode_preparefun_receivedMess_2.1, Tmp481.0);
send PaxosNode_preparefun_receivedMess_2.0, reject, Tmp482;

}
else
{

Tmp483 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp484 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp485 = (PaxosNode_preparefun_receivedMess_2.1, Tmp483.0, Tmp484.1);
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp485;
Tmp486 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp486;

}

}
fun PaxosNode_acceptfun(PaxosNode_acceptfun_receivedMess_2: (machine, int, (int, int), int))
{
var Tmp487: bool;
var Tmp488: ((int, int), int);
var Tmp489: ((int, int), int);
var Tmp490: (int, (int, int));
var Tmp491: ((int, int), int);
var Tmp492: (int, (int, int), int);


Tmp487 = (PaxosNode_acceptfun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(Tmp487)
{

Tmp488 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, Tmp488.0);
if(!(PaxosNode_returnVal))
{

Tmp489 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
Tmp490 = (PaxosNode_acceptfun_receivedMess_2.1, Tmp489.0);
send PaxosNode_acceptfun_receivedMess_2.0, reject, Tmp490;

}
else
{

Tmp491 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = Tmp491;
Tmp492 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
send PaxosNode_acceptfun_receivedMess_2.0, accepted, Tmp492;

}


}
else
{

;


}

}
fun PaxosNode_GetNextProposal(PaxosNode_GetNextProposal_maxRound: int): (int, int)
{
var Tmp493: (int, int);


Tmp493 = ((PaxosNode_GetNextProposal_maxRound + 1), PaxosNode_myRank);
return (Tmp493);
}
fun PaxosNode_equal(PaxosNode_equal_p1: (int, int), PaxosNode_equal_p2: (int, int)): bool
{
var Tmp494: bool;
var Tmp495: bool;


Tmp494 = (PaxosNode_equal_p1.0 == PaxosNode_equal_p2.0);
Tmp495 = (PaxosNode_equal_p1.1 == PaxosNode_equal_p2.1);
if((Tmp494 && Tmp495))
{

return (true);

}
else
{

return (false);

}

}
fun PaxosNode_lessThan(PaxosNode_lessThan_p1: (int, int), PaxosNode_lessThan_p2: (int, int)): bool
{
var Tmp496: bool;


if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

return (true);

}
else
{

Tmp496 = (PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0);
if(Tmp496)
{

if((PaxosNode_lessThan_p1.1 < PaxosNode_lessThan_p2.1))
{

return (true);

}
else
{

return (false);

}


}
else
{

return (false);

}


}

}
fun PaxosNode_BroadCastAcceptors(PaxosNode_BroadCastAcceptors_mess: event, PaxosNode_BroadCastAcceptors_pay: any)
{
var Tmp497: machine;


PaxosNode_iter = 0;
while((PaxosNode_iter < sizeof(PaxosNode_acceptors)))
{

Tmp497 = PaxosNode_acceptors[PaxosNode_iter];
send Tmp497, PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
PaxosNode_iter = (PaxosNode_iter + 1);

}

}
fun PaxosNode_CountAccepted(PaxosNode_CountAccepted_receivedMess_1: (int, (int, int), int))
{
var Tmp498: bool;
var Tmp499: bool;


Tmp498 = (PaxosNode_CountAccepted_receivedMess_1.0 == PaxosNode_nextSlotForProposer);
if(Tmp498)
{

PaxosNode_returnVal = PaxosNode_equal(PaxosNode_CountAccepted_receivedMess_1.1, PaxosNode_nextProposal);
if(PaxosNode_returnVal)
{

PaxosNode_countAccept = (PaxosNode_countAccept + 1);

}
else
{

;


}

Tmp499 = (PaxosNode_countAccept == PaxosNode_majority);
if(Tmp499)
{

;

send PaxosNode_timer, cancelTimer;
;

PaxosNode_nextSlotForProposer = (PaxosNode_nextSlotForProposer + 1);
raise chosen, PaxosNode_CountAccepted_receivedMess_1;

}
else
{

;


}


}
else
{

;


}

}
fun PaxosNode_getHighestProposedValue(): int
{
var Tmp500: bool;


Tmp500 = (PaxosNode_receivedAgree.1 == -(1));
if(!(Tmp500))
{

PaxosNode_currCommitOperation = false;
return (PaxosNode_receivedAgree.1);

}
else
{

PaxosNode_currCommitOperation = true;
return (PaxosNode_commitValue);

}

}
fun PaxosNode_RunReplicatedMachine()
{
var Tmp501: bool;


while(true)
{

Tmp501 = ((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots);
if(Tmp501)
{

PaxosNode_lastExecutedSlot = (PaxosNode_lastExecutedSlot + 1);

}
else
{

return;

}


}

}
fun PaxosNode_Init_do_allNodes60(PaxosNode_Init_do_allNodes60_payload: (seq[machine]))
{


PaxosNode_UpdateAcceptors(PaxosNode_Init_do_allNodes60_payload);
}
fun PaxosNode_PerformOperation_do_update91(PaxosNode_PerformOperation_do_update91_payload: (int, int))
{


PaxosNode_CheckIfLeader(PaxosNode_PerformOperation_do_update91_payload);
}
fun PaxosNode_PerformOperation_do_prepare95(PaxosNode_PerformOperation_do_prepare95_payload: (machine, int, (int, int)))
{


PaxosNode_preparefun(PaxosNode_PerformOperation_do_prepare95_payload);
}
fun PaxosNode_PerformOperation_do_accept96(PaxosNode_PerformOperation_do_accept96_payload: (machine, int, (int, int), int))
{


PaxosNode_acceptfun(PaxosNode_PerformOperation_do_accept96_payload);
}
fun PaxosNode_PerformOperation_do_Ping102(PaxosNode_PerformOperation_do_Ping102_payload: (int, machine))
{


send PaxosNode_leaderElectionService, Ping, PaxosNode_PerformOperation_do_Ping102_payload;
}
fun PaxosNode_PerformOperation_do_newLeader103(PaxosNode_PerformOperation_do_newLeader103_payload: (int, machine))
{


PaxosNode_currentLeader = PaxosNode_PerformOperation_do_newLeader103_payload;
}
fun PaxosNode_ProposeValuePhase1_do_agree199(PaxosNode_ProposeValuePhase1_do_agree199_receivedMess: (int, (int, int), int))
{
var Tmp502: bool;
var Tmp503: bool;


Tmp502 = (PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.0 == PaxosNode_nextSlotForProposer);
if(Tmp502)
{

PaxosNode_countAgree = (PaxosNode_countAgree + 1);
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_receivedAgree.0, PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1);
if(PaxosNode_returnVal)
{

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1;
PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.2;

}
else
{

;


}

Tmp503 = (PaxosNode_countAgree == PaxosNode_majority);
if(Tmp503)
{

raise success;

}
else
{

;


}


}
else
{

;


}

}
fun PaxosNode_ProposeValuePhase2_do_accepted276(PaxosNode_ProposeValuePhase2_do_accepted276_payload: (int, (int, int), int))
{


PaxosNode_CountAccepted(PaxosNode_ProposeValuePhase2_do_accepted276_payload);
}
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_1339796726()
{


;

}
fun PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214(PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0;

}
else
{

;


}

send PaxosNode_timer, cancelTimer;
}
fun PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221()
{


send PaxosNode_timer, cancelTimer;
}
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_897218726()
{


;

}
fun PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279(PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0;

}
else
{

;


}

send PaxosNode_timer, cancelTimer;
}
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_2069860882()
{


;

}
fun PaxosNode_Init_entry52(PaxosNode_Init_entry52_payload: (int))
{
var Tmp504: (int, machine);
var Tmp505: (machine, int);
var Tmp506: machine;


PaxosNode_myRank = PaxosNode_Init_entry52_payload.0;
Tmp504 = (PaxosNode_myRank, this);
PaxosNode_currentLeader = Tmp504;
PaxosNode_roundNum = 0;
PaxosNode_maxRound = 0;
Tmp505 = (this, 10);
Tmp506 = new Timer(Tmp505);
PaxosNode_timer = Tmp506;
PaxosNode_lastExecutedSlot = -(1);
PaxosNode_nextSlotForProposer = 0;
}
fun PaxosNode_Init_exit0_rand_1429506490()
{


;

}
fun PaxosNode_PerformOperation_entry0_rand_1421776579()
{


;

}
fun PaxosNode_PerformOperation_exit0_rand_651668900()
{


;

}
fun PaxosNode_ProposeValuePhase1_entry190()
{
var Tmp507: (int, int);
var Tmp508: ((int, int), int);
var Tmp509: (int, int);
var Tmp510: (machine, int, (int, int));


PaxosNode_countAgree = 0;
PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);
Tmp507 = (-(1), -(1));
Tmp508 = (Tmp507, -(1));
PaxosNode_receivedAgree = Tmp508;
Tmp509 = (PaxosNode_nextProposal.0, PaxosNode_myRank);
Tmp510 = (this, PaxosNode_nextSlotForProposer, Tmp509);
PaxosNode_BroadCastAcceptors(prepare, Tmp510);
;

send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase1_exit0_rand_568787480()
{


;

}
fun PaxosNode_ProposeValuePhase2_entry265()
{
var Tmp511: (machine, int, (int, int), int);


PaxosNode_countAccept = 0;
PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();
;

;

Tmp511 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
PaxosNode_BroadCastAcceptors(accept, Tmp511);
send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase2_exit0_rand_442745310()
{


;

}
fun PaxosNode_RunLearner_entry310(PaxosNode_RunLearner_entry310_receivedMess_1: (int, (int, int), int))
{
var Tmp512: ((int, int), int);
var Tmp513: bool;


Tmp512 = (PaxosNode_RunLearner_entry310_receivedMess_1.1, PaxosNode_RunLearner_entry310_receivedMess_1.2);
PaxosNode_learnerSlots[PaxosNode_RunLearner_entry310_receivedMess_1.0] = Tmp512;
PaxosNode_RunReplicatedMachine();
Tmp513 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry310_receivedMess_1.2);
if((PaxosNode_currCommitOperation && Tmp513))
{

pop;

}
else
{

PaxosNode_proposeVal = PaxosNode_commitValue;
raise goPropose;

}

}
fun PaxosNode_RunLearner_exit0_rand_1116009846()
{


;

}start 
 state PaxosNode_Init
{
entry (payload: (int)) {
PaxosNode_Init_entry52(payload);
}
exit  {
PaxosNode_Init_exit0_rand_1429506490();
}
defer Ping;
on allNodes do  (payload: (seq[machine])) {
PaxosNode_Init_do_allNodes60(payload);
}
on local goto PaxosNode_PerformOperation with   {
PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_1339796726();
}
}

 state PaxosNode_PerformOperation
{
entry  {
PaxosNode_PerformOperation_entry0_rand_1421776579();
}
exit  {
PaxosNode_PerformOperation_exit0_rand_651668900();
}
ignore agree;
ignore accepted;
ignore timeout;
on update do  (payload: (int, int)) {
PaxosNode_PerformOperation_do_update91(payload);
}

on prepare do  (payload: (machine, int, (int, int))) {
PaxosNode_PerformOperation_do_prepare95(payload);
}

on accept do  (payload: (machine, int, (int, int), int)) {
PaxosNode_PerformOperation_do_accept96(payload);
}

on Ping do  (payload: (int, machine)) {
PaxosNode_PerformOperation_do_Ping102(payload);
}

on newLeader do  (payload: (int, machine)) {
PaxosNode_PerformOperation_do_newLeader103(payload);
}
on goPropose push PaxosNode_ProposeValuePhase1;
on chosen push PaxosNode_RunLearner;}

 state PaxosNode_ProposeValuePhase1
{
entry  {
PaxosNode_ProposeValuePhase1_entry190();
}
exit  {
PaxosNode_ProposeValuePhase1_exit0_rand_568787480();
}
ignore accepted;
on agree do  (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase1_do_agree199(payload);
}
on reject goto PaxosNode_ProposeValuePhase1 with  (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214(payload);
}

on success goto PaxosNode_ProposeValuePhase2 with   {
PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221();
}

on timeout goto PaxosNode_ProposeValuePhase1 with  (payload: (machine)) {
PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_897218726();
}
}

 state PaxosNode_ProposeValuePhase2
{
entry  {
PaxosNode_ProposeValuePhase2_entry265();
}
exit  {
PaxosNode_ProposeValuePhase2_exit0_rand_442745310();
}
ignore agree;
on accepted do  (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase2_do_accepted276(payload);
}
on reject goto PaxosNode_ProposeValuePhase1 with  (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279(payload);
}

on timeout goto PaxosNode_ProposeValuePhase1 with  (payload: (machine)) {
PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_2069860882();
}
}

 state PaxosNode_RunLearner
{
entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry310(payload);
}
exit  {
PaxosNode_RunLearner_exit0_rand_1116009846();
}
ignore agree;
ignore accepted;
ignore timeout;
ignore prepare;
ignore reject;
ignore accept;
defer newLeader;}
}

machine LeaderElection
{
var LeaderElection_servers: seq[machine];
var LeaderElection_parentServer: machine;
var LeaderElection_currentLeader: (int, machine);
var LeaderElection_myRank: int;
var LeaderElection_iter: int;

model fun LeaderElection_GetNewLeader(): (int, machine)
{
var Tmp514: machine;
var Tmp515: (int, machine);


Tmp514 = LeaderElection_servers[0];
Tmp515 = (1, Tmp514);
return (Tmp515);
}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1301877585()
{


;

}
fun LeaderElection_Init_entry444(LeaderElection_Init_entry444_payload: (seq[machine], machine, int))
{
var Tmp516: (int, machine);


LeaderElection_servers = LeaderElection_Init_entry444_payload.0;
LeaderElection_parentServer = LeaderElection_Init_entry444_payload.1;
LeaderElection_myRank = LeaderElection_Init_entry444_payload.2;
Tmp516 = (LeaderElection_myRank, this);
LeaderElection_currentLeader = Tmp516;
raise local;
}
fun LeaderElection_Init_exit0_rand_1182581029()
{


;

}
fun LeaderElection_SendLeader_entry456()
{


LeaderElection_currentLeader = LeaderElection_GetNewLeader();
assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);
send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;
}
fun LeaderElection_SendLeader_exit0_rand_1935142070()
{


;

}start 
 state LeaderElection_Init
{
entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry444(payload);
}
exit  {
LeaderElection_Init_exit0_rand_1182581029();
}
on local goto LeaderElection_SendLeader with   {
LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1301877585();
}
}

 state LeaderElection_SendLeader
{
entry  {
LeaderElection_SendLeader_entry456();
}
exit  {
LeaderElection_SendLeader_exit0_rand_1935142070();
}
}
}

model Timer
{
var Timer_target: machine;
var Timer_timeoutvalue: int;

fun Timer_Init_on_local_goto_Timer_Loop0_rand_221817535()
{


;

}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1228391445()
{


;

}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_372223640()
{


;

}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_856313492()
{


;

}
fun Timer_Init_entry486(Timer_Init_entry486_payload: (machine, int))
{


Timer_target = Timer_Init_entry486_payload.0;
Timer_timeoutvalue = Timer_Init_entry486_payload.1;
raise local;
}
fun Timer_Init_exit0_rand_104528516()
{


;

}
fun Timer_Loop_entry0_rand_471454682()
{


;

}
fun Timer_Loop_exit0_rand_1457348452()
{


;

}
fun Timer_TimerStarted_entry501()
{
var Tmp517: bool;


Tmp517 = $;
if(Tmp517)
{

raise local;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_477032074()
{


;

}start 
 state Timer_Init
{
entry (payload: (machine, int)) {
Timer_Init_entry486(payload);
}
exit  {
Timer_Init_exit0_rand_104528516();
}
on local goto Timer_Loop with   {
Timer_Init_on_local_goto_Timer_Loop0_rand_221817535();
}
}

 state Timer_Loop
{
entry  {
Timer_Loop_entry0_rand_471454682();
}
exit  {
Timer_Loop_exit0_rand_1457348452();
}
ignore cancelTimer;on startTimer goto Timer_TimerStarted with   {
Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1228391445();
}
}

 state Timer_TimerStarted
{
entry  {
Timer_TimerStarted_entry501();
}
exit  {
Timer_TimerStarted_exit0_rand_477032074();
}
ignore startTimer;on local goto Timer_Loop with   {
Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_372223640();
}

on cancelTimer goto Timer_Loop with   {
Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_856313492();
}
}
}

main machine GodMachine
{
var GodMachine_paxosnodes: seq[machine];
var GodMachine_temp: machine;
var GodMachine_iter: int;

fun GodMachine_Init_entry519()
{
var Tmp518: (int);
var Tmp519: machine;
var Tmp520: (int);
var Tmp521: machine;
var Tmp522: (int);
var Tmp523: machine;
var Tmp524: machine;
var Tmp525: (seq[machine]);


Tmp518 = (3,);
Tmp519 = new PaxosNode(Tmp518);
GodMachine_temp = Tmp519;
GodMachine_paxosnodes += (0, GodMachine_temp);
Tmp520 = (2,);
Tmp521 = new PaxosNode(Tmp520);
GodMachine_temp = Tmp521;
GodMachine_paxosnodes += (0, GodMachine_temp);
Tmp522 = (1,);
Tmp523 = new PaxosNode(Tmp522);
GodMachine_temp = Tmp523;
GodMachine_paxosnodes += (0, GodMachine_temp);
GodMachine_iter = 0;
while((GodMachine_iter < sizeof(GodMachine_paxosnodes)))
{

Tmp524 = GodMachine_paxosnodes[GodMachine_iter];
Tmp525 = (GodMachine_paxosnodes,);
send Tmp524, allNodes, Tmp525;
GodMachine_iter = (GodMachine_iter + 1);

}

new Client(GodMachine_paxosnodes);
}
fun GodMachine_Init_exit0_rand_364807847()
{


;

}start 
 state GodMachine_Init
{
entry  {
GodMachine_Init_entry519();
}
exit  {
GodMachine_Init_exit0_rand_364807847();
}
}
}

model Client
{
var Client_servers: seq[machine];

fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_502005516()
{


;

}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_2135146683()
{


;

}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_858020685()
{


;

}
fun Client_Init_entry542(Client_Init_entry542_payload: seq[machine])
{


Client_servers = Client_Init_entry542_payload;
raise local;
}
fun Client_Init_exit0_rand_800275777()
{


;

}
fun Client_PumpRequestOne_entry0_rand_1361574350()
{
var Tmp526: bool;
var Tmp527: machine;
var Tmp528: (int, int);
var Tmp529: machine;
var Tmp530: (int, int);


;

Tmp526 = $;
if(Tmp526)
{

Tmp527 = Client_servers[0];
Tmp528 = (0, 1);
send Tmp527, update, Tmp528;

}
else
{

Tmp529 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp530 = (0, 1);
send Tmp529, update, Tmp530;

}

raise response;
}
fun Client_PumpRequestOne_exit0_rand_866366410()
{


;

}
fun Client_PumpRequestTwo_entry0_rand_631934238()
{
var Tmp531: bool;
var Tmp532: machine;
var Tmp533: (int, int);
var Tmp534: machine;
var Tmp535: (int, int);


;

Tmp531 = $;
if(Tmp531)
{

Tmp532 = Client_servers[0];
Tmp533 = (0, 2);
send Tmp532, update, Tmp533;

}
else
{

Tmp534 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp535 = (0, 2);
send Tmp534, update, Tmp535;

}

raise response;
}
fun Client_PumpRequestTwo_exit0_rand_2096184521()
{


;

}
fun Client_Done_entry0_rand_983275304()
{


;

}
fun Client_Done_exit0_rand_513510325()
{


;

}start 
 state Client_Init
{
entry (payload: seq[machine]) {
Client_Init_entry542(payload);
}
exit  {
Client_Init_exit0_rand_800275777();
}
on local goto Client_PumpRequestOne with   {
Client_Init_on_local_goto_Client_PumpRequestOne0_rand_502005516();
}
}

 state Client_PumpRequestOne
{
entry  {
Client_PumpRequestOne_entry0_rand_1361574350();
}
exit  {
Client_PumpRequestOne_exit0_rand_866366410();
}
on response goto Client_PumpRequestTwo with   {
Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_2135146683();
}
}

 state Client_PumpRequestTwo
{
entry  {
Client_PumpRequestTwo_entry0_rand_631934238();
}
exit  {
Client_PumpRequestTwo_exit0_rand_2096184521();
}
on response goto Client_Done with   {
Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_858020685();
}
}

 state Client_Done
{
entry  {
Client_Done_entry0_rand_983275304();
}
exit  {
Client_Done_exit0_rand_513510325();
}
}
}

