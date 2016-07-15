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
var Tmp408: bool;
var Tmp409: (seq[machine], machine, int);
var Tmp410: machine;


PaxosNode_acceptors = PaxosNode_UpdateAcceptors_payload.0;
PaxosNode_majority = ((sizeof(PaxosNode_acceptors) / 2) + 1);
Tmp408 = (PaxosNode_majority == 2);
assert Tmp408;
Tmp409 = (PaxosNode_acceptors, this, PaxosNode_myRank);
Tmp410 = new LeaderElection(Tmp409);
PaxosNode_leaderElectionService = Tmp410;
raise local;
}
fun PaxosNode_CheckIfLeader(PaxosNode_CheckIfLeader_payload: (int, int))
{
var Tmp411: bool;


Tmp411 = (PaxosNode_currentLeader.0 == PaxosNode_myRank);
if(Tmp411)
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
var Tmp412: bool;
var Tmp413: (int, int);
var Tmp414: (int, (int, int), int);
var Tmp415: ((int, int), int);
var Tmp416: ((int, int), int);
var Tmp417: ((int, int), int);
var Tmp418: (int, (int, int));
var Tmp419: ((int, int), int);
var Tmp420: ((int, int), int);
var Tmp421: (int, (int, int), int);
var Tmp422: ((int, int), int);


Tmp412 = (PaxosNode_preparefun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(!(Tmp412))
{

Tmp413 = (-(1), -(1));
Tmp414 = (PaxosNode_preparefun_receivedMess_2.1, Tmp413, -(1));
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp414;
Tmp415 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp415;

}
else
{

;


}

Tmp416 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, Tmp416.0);
if(PaxosNode_returnVal)
{

Tmp417 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp418 = (PaxosNode_preparefun_receivedMess_2.1, Tmp417.0);
send PaxosNode_preparefun_receivedMess_2.0, reject, Tmp418;

}
else
{

Tmp419 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp420 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp421 = (PaxosNode_preparefun_receivedMess_2.1, Tmp419.0, Tmp420.1);
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp421;
Tmp422 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp422;

}

}
fun PaxosNode_acceptfun(PaxosNode_acceptfun_receivedMess_2: (machine, int, (int, int), int))
{
var Tmp423: bool;
var Tmp424: ((int, int), int);
var Tmp425: ((int, int), int);
var Tmp426: (int, (int, int));
var Tmp427: ((int, int), int);
var Tmp428: (int, (int, int), int);


Tmp423 = (PaxosNode_acceptfun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(Tmp423)
{

Tmp424 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, Tmp424.0);
if(!(PaxosNode_returnVal))
{

Tmp425 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
Tmp426 = (PaxosNode_acceptfun_receivedMess_2.1, Tmp425.0);
send PaxosNode_acceptfun_receivedMess_2.0, reject, Tmp426;

}
else
{

Tmp427 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = Tmp427;
Tmp428 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
send PaxosNode_acceptfun_receivedMess_2.0, accepted, Tmp428;

}


}
else
{

;


}

}
fun PaxosNode_GetNextProposal(PaxosNode_GetNextProposal_maxRound: int): (int, int)
{
var Tmp429: (int, int);


Tmp429 = ((PaxosNode_GetNextProposal_maxRound + 1), PaxosNode_myRank);
return (Tmp429);
}
fun PaxosNode_equal(PaxosNode_equal_p1: (int, int), PaxosNode_equal_p2: (int, int)): bool
{
var Tmp430: bool;
var Tmp431: bool;


Tmp430 = (PaxosNode_equal_p1.0 == PaxosNode_equal_p2.0);
Tmp431 = (PaxosNode_equal_p1.1 == PaxosNode_equal_p2.1);
if((Tmp430 && Tmp431))
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
var Tmp432: bool;


if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

return (true);

}
else
{

Tmp432 = (PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0);
if(Tmp432)
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
var Tmp433: machine;


PaxosNode_iter = 0;
while((PaxosNode_iter < sizeof(PaxosNode_acceptors)))
{

Tmp433 = PaxosNode_acceptors[PaxosNode_iter];
send Tmp433, PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
PaxosNode_iter = (PaxosNode_iter + 1);

}

}
fun PaxosNode_CountAccepted(PaxosNode_CountAccepted_receivedMess_1: (int, (int, int), int))
{
var Tmp434: bool;
var Tmp435: bool;


Tmp434 = (PaxosNode_CountAccepted_receivedMess_1.0 == PaxosNode_nextSlotForProposer);
if(Tmp434)
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

Tmp435 = (PaxosNode_countAccept == PaxosNode_majority);
if(Tmp435)
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
var Tmp436: bool;


Tmp436 = (PaxosNode_receivedAgree.1 == -(1));
if(!(Tmp436))
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
var Tmp437: bool;


while(true)
{

Tmp437 = ((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots);
if(Tmp437)
{

PaxosNode_lastExecutedSlot = (PaxosNode_lastExecutedSlot + 1);

}
else
{

return;

}


}

}
fun PaxosNode_Init_do_allNodes58(PaxosNode_Init_do_allNodes58_payload: (seq[machine]))
{


PaxosNode_UpdateAcceptors(PaxosNode_Init_do_allNodes58_payload);
}
fun PaxosNode_PerformOperation_do_update89(PaxosNode_PerformOperation_do_update89_payload: (int, int))
{


PaxosNode_CheckIfLeader(PaxosNode_PerformOperation_do_update89_payload);
}
fun PaxosNode_PerformOperation_do_prepare93(PaxosNode_PerformOperation_do_prepare93_payload: (machine, int, (int, int)))
{


PaxosNode_preparefun(PaxosNode_PerformOperation_do_prepare93_payload);
}
fun PaxosNode_PerformOperation_do_accept94(PaxosNode_PerformOperation_do_accept94_payload: (machine, int, (int, int), int))
{


PaxosNode_acceptfun(PaxosNode_PerformOperation_do_accept94_payload);
}
fun PaxosNode_PerformOperation_do_Ping100(PaxosNode_PerformOperation_do_Ping100_payload: (int, machine))
{


send PaxosNode_leaderElectionService, Ping, PaxosNode_PerformOperation_do_Ping100_payload;
}
fun PaxosNode_PerformOperation_do_newLeader101(PaxosNode_PerformOperation_do_newLeader101_payload: (int, machine))
{


PaxosNode_currentLeader = PaxosNode_PerformOperation_do_newLeader101_payload;
}
fun PaxosNode_ProposeValuePhase1_do_agree195(PaxosNode_ProposeValuePhase1_do_agree195_receivedMess: (int, (int, int), int))
{
var Tmp438: bool;
var Tmp439: bool;


Tmp438 = (PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.0 == PaxosNode_nextSlotForProposer);
if(Tmp438)
{

PaxosNode_countAgree = (PaxosNode_countAgree + 1);
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_receivedAgree.0, PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.1);
if(PaxosNode_returnVal)
{

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.1;
PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.2;

}
else
{

;


}

Tmp439 = (PaxosNode_countAgree == PaxosNode_majority);
if(Tmp439)
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
fun PaxosNode_ProposeValuePhase2_do_accepted271(PaxosNode_ProposeValuePhase2_do_accepted271_payload: (int, (int, int), int))
{


PaxosNode_CountAccepted(PaxosNode_ProposeValuePhase2_do_accepted271_payload);
}
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_418767562()
{


;

}
fun PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209(PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209_payload.1.0;

}
else
{

;


}

send PaxosNode_timer, cancelTimer;
}
fun PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2216()
{


send PaxosNode_timer, cancelTimer;
}
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_777081038()
{


;

}
fun PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275(PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275_payload.1.0;

}
else
{

;


}

send PaxosNode_timer, cancelTimer;
}
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_314902845()
{


;

}
fun PaxosNode_Init_entry50(PaxosNode_Init_entry50_payload: (int))
{
var Tmp440: (int, machine);
var Tmp441: (machine, int);
var Tmp442: machine;


PaxosNode_myRank = PaxosNode_Init_entry50_payload.0;
Tmp440 = (PaxosNode_myRank, this);
PaxosNode_currentLeader = Tmp440;
PaxosNode_roundNum = 0;
PaxosNode_maxRound = 0;
Tmp441 = (this, 10);
Tmp442 = new Timer(Tmp441);
PaxosNode_timer = Tmp442;
PaxosNode_lastExecutedSlot = -(1);
PaxosNode_nextSlotForProposer = 0;
}
fun PaxosNode_Init_exit0_rand_377699695()
{


;

}
fun PaxosNode_PerformOperation_entry0_rand_409318471()
{


;

}
fun PaxosNode_PerformOperation_exit0_rand_1910890725()
{


;

}
fun PaxosNode_ProposeValuePhase1_entry186()
{
var Tmp443: (int, int);
var Tmp444: ((int, int), int);
var Tmp445: (int, int);
var Tmp446: (machine, int, (int, int));


PaxosNode_countAgree = 0;
PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);
Tmp443 = (-(1), -(1));
Tmp444 = (Tmp443, -(1));
PaxosNode_receivedAgree = Tmp444;
Tmp445 = (PaxosNode_nextProposal.0, PaxosNode_myRank);
Tmp446 = (this, PaxosNode_nextSlotForProposer, Tmp445);
PaxosNode_BroadCastAcceptors(prepare, Tmp446);
;

send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase1_exit0_rand_1946991105()
{


;

}
fun PaxosNode_ProposeValuePhase2_entry260()
{
var Tmp447: (machine, int, (int, int), int);


PaxosNode_countAccept = 0;
PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();
;

;

Tmp447 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
PaxosNode_BroadCastAcceptors(accept, Tmp447);
send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase2_exit0_rand_817452832()
{


;

}
fun PaxosNode_RunLearner_entry306(PaxosNode_RunLearner_entry306_receivedMess_1: (int, (int, int), int))
{
var Tmp448: ((int, int), int);
var Tmp449: bool;


Tmp448 = (PaxosNode_RunLearner_entry306_receivedMess_1.1, PaxosNode_RunLearner_entry306_receivedMess_1.2);
PaxosNode_learnerSlots[PaxosNode_RunLearner_entry306_receivedMess_1.0] = Tmp448;
PaxosNode_RunReplicatedMachine();
Tmp449 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry306_receivedMess_1.2);
if((PaxosNode_currCommitOperation && Tmp449))
{

pop;

}
else
{

PaxosNode_proposeVal = PaxosNode_commitValue;
raise goPropose;

}

}
fun PaxosNode_RunLearner_exit0_rand_1388544546()
{


;

}start 
 state PaxosNode_Init
{
entry (payload: (int)) {
PaxosNode_Init_entry50(payload);
}
exit  {
PaxosNode_Init_exit0_rand_377699695();
}
defer Ping;
on allNodes do  (payload: (seq[machine])) {
PaxosNode_Init_do_allNodes58(payload);
}
on local goto PaxosNode_PerformOperation with   {
PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_418767562();
}
}

 state PaxosNode_PerformOperation
{
entry  {
PaxosNode_PerformOperation_entry0_rand_409318471();
}
exit  {
PaxosNode_PerformOperation_exit0_rand_1910890725();
}
ignore agree;
ignore accepted;
ignore timeout;
on update do  (payload: (int, int)) {
PaxosNode_PerformOperation_do_update89(payload);
}

on prepare do  (payload: (machine, int, (int, int))) {
PaxosNode_PerformOperation_do_prepare93(payload);
}

on accept do  (payload: (machine, int, (int, int), int)) {
PaxosNode_PerformOperation_do_accept94(payload);
}

on Ping do  (payload: (int, machine)) {
PaxosNode_PerformOperation_do_Ping100(payload);
}

on newLeader do  (payload: (int, machine)) {
PaxosNode_PerformOperation_do_newLeader101(payload);
}
on goPropose push PaxosNode_ProposeValuePhase1;
on chosen push PaxosNode_RunLearner;}

 state PaxosNode_ProposeValuePhase1
{
entry  {
PaxosNode_ProposeValuePhase1_entry186();
}
exit  {
PaxosNode_ProposeValuePhase1_exit0_rand_1946991105();
}
ignore accepted;
on agree do  (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase1_do_agree195(payload);
}
on reject goto PaxosNode_ProposeValuePhase1 with  (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209(payload);
}

on success goto PaxosNode_ProposeValuePhase2 with   {
PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2216();
}

on timeout goto PaxosNode_ProposeValuePhase1 with  (payload: (machine)) {
PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_777081038();
}
}

 state PaxosNode_ProposeValuePhase2
{
entry  {
PaxosNode_ProposeValuePhase2_entry260();
}
exit  {
PaxosNode_ProposeValuePhase2_exit0_rand_817452832();
}
ignore agree;
on accepted do  (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase2_do_accepted271(payload);
}
on reject goto PaxosNode_ProposeValuePhase1 with  (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275(payload);
}

on timeout goto PaxosNode_ProposeValuePhase1 with  (payload: (machine)) {
PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_314902845();
}
}

 state PaxosNode_RunLearner
{
entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry306(payload);
}
exit  {
PaxosNode_RunLearner_exit0_rand_1388544546();
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
var Tmp450: machine;
var Tmp451: (int, machine);


Tmp450 = LeaderElection_servers[0];
Tmp451 = (1, Tmp450);
return (Tmp451);
}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1365023554()
{


;

}
fun LeaderElection_Init_entry440(LeaderElection_Init_entry440_payload: (seq[machine], machine, int))
{
var Tmp452: (int, machine);


LeaderElection_servers = LeaderElection_Init_entry440_payload.0;
LeaderElection_parentServer = LeaderElection_Init_entry440_payload.1;
LeaderElection_myRank = LeaderElection_Init_entry440_payload.2;
Tmp452 = (LeaderElection_myRank, this);
LeaderElection_currentLeader = Tmp452;
raise local;
}
fun LeaderElection_Init_exit0_rand_1492278706()
{


;

}
fun LeaderElection_SendLeader_entry452()
{


LeaderElection_currentLeader = LeaderElection_GetNewLeader();
assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);
send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;
}
fun LeaderElection_SendLeader_exit0_rand_1195252329()
{


;

}start 
 state LeaderElection_Init
{
entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry440(payload);
}
exit  {
LeaderElection_Init_exit0_rand_1492278706();
}
on local goto LeaderElection_SendLeader with   {
LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1365023554();
}
}

 state LeaderElection_SendLeader
{
entry  {
LeaderElection_SendLeader_entry452();
}
exit  {
LeaderElection_SendLeader_exit0_rand_1195252329();
}
}
}

model Timer
{
var Timer_target: machine;
var Timer_timeoutvalue: int;

fun Timer_Init_on_local_goto_Timer_Loop0_rand_162244880()
{


;

}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_480419704()
{


;

}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_1335438817()
{


;

}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_153464734()
{


;

}
fun Timer_Init_entry483(Timer_Init_entry483_payload: (machine, int))
{


Timer_target = Timer_Init_entry483_payload.0;
Timer_timeoutvalue = Timer_Init_entry483_payload.1;
raise local;
}
fun Timer_Init_exit0_rand_616961048()
{


;

}
fun Timer_Loop_entry0_rand_1967254408()
{


;

}
fun Timer_Loop_exit0_rand_1765975432()
{


;

}
fun Timer_TimerStarted_entry498()
{
var Tmp453: bool;


Tmp453 = $;
if(Tmp453)
{

raise local;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_1562990335()
{


;

}start 
 state Timer_Init
{
entry (payload: (machine, int)) {
Timer_Init_entry483(payload);
}
exit  {
Timer_Init_exit0_rand_616961048();
}
on local goto Timer_Loop with   {
Timer_Init_on_local_goto_Timer_Loop0_rand_162244880();
}
}

 state Timer_Loop
{
entry  {
Timer_Loop_entry0_rand_1967254408();
}
exit  {
Timer_Loop_exit0_rand_1765975432();
}
ignore cancelTimer;on startTimer goto Timer_TimerStarted with   {
Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_480419704();
}
}

 state Timer_TimerStarted
{
entry  {
Timer_TimerStarted_entry498();
}
exit  {
Timer_TimerStarted_exit0_rand_1562990335();
}
ignore startTimer;on local goto Timer_Loop with   {
Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_1335438817();
}

on cancelTimer goto Timer_Loop with   {
Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_153464734();
}
}
}

main machine GodMachine
{
var GodMachine_paxosnodes: seq[machine];
var GodMachine_temp: machine;
var GodMachine_iter: int;

fun GodMachine_Init_entry516()
{
var Tmp454: (int);
var Tmp455: machine;
var Tmp456: (int);
var Tmp457: machine;
var Tmp458: (int);
var Tmp459: machine;
var Tmp460: machine;
var Tmp461: (seq[machine]);


Tmp454 = (3,);
Tmp455 = new PaxosNode(Tmp454);
GodMachine_temp = Tmp455;
GodMachine_paxosnodes += (0, GodMachine_temp);
Tmp456 = (2,);
Tmp457 = new PaxosNode(Tmp456);
GodMachine_temp = Tmp457;
GodMachine_paxosnodes += (0, GodMachine_temp);
Tmp458 = (1,);
Tmp459 = new PaxosNode(Tmp458);
GodMachine_temp = Tmp459;
GodMachine_paxosnodes += (0, GodMachine_temp);
GodMachine_iter = 0;
while((GodMachine_iter < sizeof(GodMachine_paxosnodes)))
{

Tmp460 = GodMachine_paxosnodes[GodMachine_iter];
Tmp461 = (GodMachine_paxosnodes,);
send Tmp460, allNodes, Tmp461;
GodMachine_iter = (GodMachine_iter + 1);

}

new Client(GodMachine_paxosnodes);
}
fun GodMachine_Init_exit0_rand_1596020082()
{


;

}start 
 state GodMachine_Init
{
entry  {
GodMachine_Init_entry516();
}
exit  {
GodMachine_Init_exit0_rand_1596020082();
}
}
}

model Client
{
var Client_servers: seq[machine];

fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_720379262()
{


;

}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1742790143()
{


;

}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_337922979()
{


;

}
fun Client_Init_entry539(Client_Init_entry539_payload: seq[machine])
{


Client_servers = Client_Init_entry539_payload;
raise local;
}
fun Client_Init_exit0_rand_733089316()
{


;

}
fun Client_PumpRequestOne_entry0_rand_213544006()
{
var Tmp462: bool;
var Tmp463: machine;
var Tmp464: (int, int);
var Tmp465: machine;
var Tmp466: (int, int);


;

Tmp462 = $;
if(Tmp462)
{

Tmp463 = Client_servers[0];
Tmp464 = (0, 1);
send Tmp463, update, Tmp464;

}
else
{

Tmp465 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp466 = (0, 1);
send Tmp465, update, Tmp466;

}

raise response;
}
fun Client_PumpRequestOne_exit0_rand_1644628047()
{


;

}
fun Client_PumpRequestTwo_entry0_rand_821928492()
{
var Tmp467: bool;
var Tmp468: machine;
var Tmp469: (int, int);
var Tmp470: machine;
var Tmp471: (int, int);


;

Tmp467 = $;
if(Tmp467)
{

Tmp468 = Client_servers[0];
Tmp469 = (0, 2);
send Tmp468, update, Tmp469;

}
else
{

Tmp470 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp471 = (0, 2);
send Tmp470, update, Tmp471;

}

raise response;
}
fun Client_PumpRequestTwo_exit0_rand_2041126027()
{


;

}
fun Client_Done_entry0_rand_1179132921()
{


;

}
fun Client_Done_exit0_rand_743412703()
{


;

}start 
 state Client_Init
{
entry (payload: seq[machine]) {
Client_Init_entry539(payload);
}
exit  {
Client_Init_exit0_rand_733089316();
}
on local goto Client_PumpRequestOne with   {
Client_Init_on_local_goto_Client_PumpRequestOne0_rand_720379262();
}
}

 state Client_PumpRequestOne
{
entry  {
Client_PumpRequestOne_entry0_rand_213544006();
}
exit  {
Client_PumpRequestOne_exit0_rand_1644628047();
}
on response goto Client_PumpRequestTwo with   {
Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1742790143();
}
}

 state Client_PumpRequestTwo
{
entry  {
Client_PumpRequestTwo_entry0_rand_821928492();
}
exit  {
Client_PumpRequestTwo_exit0_rand_2041126027();
}
on response goto Client_Done with   {
Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_337922979();
}
}

 state Client_Done
{
entry  {
Client_Done_entry0_rand_1179132921();
}
exit  {
Client_Done_exit0_rand_743412703();
}
}
}

