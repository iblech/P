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
var _tmp408: bool;
var _tmp409: (seq[machine], machine, int);
var _tmp410: machine;


PaxosNode_acceptors = PaxosNode_UpdateAcceptors_payload.0;
PaxosNode_majority = ((sizeof(PaxosNode_acceptors) / 2) + 1);
_tmp408 = (PaxosNode_majority == 2);
assert _tmp408;
_tmp409 = (PaxosNode_acceptors, this, PaxosNode_myRank);
_tmp410 = new LeaderElection(_tmp409);
PaxosNode_leaderElectionService = _tmp410;
raise local;
}
fun PaxosNode_CheckIfLeader(PaxosNode_CheckIfLeader_payload: (int, int))
{
var _tmp411: bool;


_tmp411 = (PaxosNode_currentLeader.0 == PaxosNode_myRank);
if(_tmp411)
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
var _tmp412: bool;
var _tmp413: (int, int);
var _tmp414: (int, (int, int), int);
var _tmp415: ((int, int), int);
var _tmp416: ((int, int), int);
var _tmp417: ((int, int), int);
var _tmp418: (int, (int, int));
var _tmp419: ((int, int), int);
var _tmp420: ((int, int), int);
var _tmp421: (int, (int, int), int);
var _tmp422: ((int, int), int);


_tmp412 = (PaxosNode_preparefun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(!(_tmp412))
{

_tmp413 = (~(1), ~(1));
_tmp414 = (PaxosNode_preparefun_receivedMess_2.1, _tmp413, ~(1));
send PaxosNode_preparefun_receivedMess_2.0, agree, _tmp414;
_tmp415 = (PaxosNode_preparefun_receivedMess_2.2, ~(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = _tmp415;

}
else
{

;


}

_tmp416 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, _tmp416.0);
if(PaxosNode_returnVal)
{

_tmp417 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
_tmp418 = (PaxosNode_preparefun_receivedMess_2.1, _tmp417.0);
send PaxosNode_preparefun_receivedMess_2.0, reject, _tmp418;

}
else
{

_tmp419 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
_tmp420 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
_tmp421 = (PaxosNode_preparefun_receivedMess_2.1, _tmp419.0, _tmp420.1);
send PaxosNode_preparefun_receivedMess_2.0, agree, _tmp421;
_tmp422 = (PaxosNode_preparefun_receivedMess_2.2, ~(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = _tmp422;

}

}
fun PaxosNode_acceptfun(PaxosNode_acceptfun_receivedMess_2: (machine, int, (int, int), int))
{
var _tmp423: bool;
var _tmp424: ((int, int), int);
var _tmp425: ((int, int), int);
var _tmp426: (int, (int, int));
var _tmp427: ((int, int), int);
var _tmp428: (int, (int, int), int);


_tmp423 = (PaxosNode_acceptfun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(_tmp423)
{

_tmp424 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, _tmp424.0);
if(!(PaxosNode_returnVal))
{

_tmp425 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
_tmp426 = (PaxosNode_acceptfun_receivedMess_2.1, _tmp425.0);
send PaxosNode_acceptfun_receivedMess_2.0, reject, _tmp426;

}
else
{

_tmp427 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = _tmp427;
_tmp428 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
send PaxosNode_acceptfun_receivedMess_2.0, accepted, _tmp428;

}


}
else
{

;


}

}
fun PaxosNode_GetNextProposal(PaxosNode_GetNextProposal_maxRound: int): (int, int)
{
var _tmp429: (int, int);


_tmp429 = ((PaxosNode_GetNextProposal_maxRound + 1), PaxosNode_myRank);
return (_tmp429);
}
fun PaxosNode_equal(PaxosNode_equal_p1: (int, int), PaxosNode_equal_p2: (int, int)): bool
{
var _tmp430: bool;
var _tmp431: bool;


_tmp430 = (PaxosNode_equal_p1.0 == PaxosNode_equal_p2.0);
_tmp431 = (PaxosNode_equal_p1.1 == PaxosNode_equal_p2.1);
if((_tmp430 && _tmp431))
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
var _tmp432: bool;


if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

return (true);

}
else
{

_tmp432 = (PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0);
if(_tmp432)
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
var _tmp433: machine;


PaxosNode_iter = 0;
while((PaxosNode_iter < sizeof(PaxosNode_acceptors)))
{

_tmp433 = PaxosNode_acceptors[PaxosNode_iter];
send _tmp433, PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
PaxosNode_iter = (PaxosNode_iter + 1);

}

}
fun PaxosNode_CountAccepted(PaxosNode_CountAccepted_receivedMess_1: (int, (int, int), int))
{
var _tmp434: bool;
var _tmp435: bool;


_tmp434 = (PaxosNode_CountAccepted_receivedMess_1.0 == PaxosNode_nextSlotForProposer);
if(_tmp434)
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

_tmp435 = (PaxosNode_countAccept == PaxosNode_majority);
if(_tmp435)
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
var _tmp436: bool;


_tmp436 = (PaxosNode_receivedAgree.1 == ~(1));
if(!(_tmp436))
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
var _tmp437: bool;


while(true)
{

_tmp437 = ((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots);
if(_tmp437)
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
var _tmp438: bool;
var _tmp439: bool;


_tmp438 = (PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.0 == PaxosNode_nextSlotForProposer);
if(_tmp438)
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

_tmp439 = (PaxosNode_countAgree == PaxosNode_majority);
if(_tmp439)
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
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_644634171()
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
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1666768781()
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
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_432278869()
{


;

}
fun PaxosNode_Init_entry50(PaxosNode_Init_entry50_payload: (int))
{
var _tmp440: (int, machine);
var _tmp441: (machine, int);
var _tmp442: machine;


PaxosNode_myRank = PaxosNode_Init_entry50_payload.0;
_tmp440 = (PaxosNode_myRank, this);
PaxosNode_currentLeader = _tmp440;
PaxosNode_roundNum = 0;
PaxosNode_maxRound = 0;
_tmp441 = (this, 10);
_tmp442 = new Timer(_tmp441);
PaxosNode_timer = _tmp442;
PaxosNode_lastExecutedSlot = ~(1);
PaxosNode_nextSlotForProposer = 0;
}
fun PaxosNode_Init_exit0_rand_1514055419()
{


;

}
fun PaxosNode_PerformOperation_entry0_rand_1470640658()
{


;

}
fun PaxosNode_PerformOperation_exit0_rand_1616212452()
{


;

}
fun PaxosNode_ProposeValuePhase1_entry186()
{
var _tmp443: (int, int);
var _tmp444: ((int, int), int);
var _tmp445: (int, int);
var _tmp446: (machine, int, (int, int));


PaxosNode_countAgree = 0;
PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);
_tmp443 = (~(1), ~(1));
_tmp444 = (_tmp443, ~(1));
PaxosNode_receivedAgree = _tmp444;
_tmp445 = (PaxosNode_nextProposal.0, PaxosNode_myRank);
_tmp446 = (this, PaxosNode_nextSlotForProposer, _tmp445);
PaxosNode_BroadCastAcceptors(prepare, _tmp446);
;

send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase1_exit0_rand_504602256()
{


;

}
fun PaxosNode_ProposeValuePhase2_entry260()
{
var _tmp447: (machine, int, (int, int), int);


PaxosNode_countAccept = 0;
PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();
;

;

_tmp447 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
PaxosNode_BroadCastAcceptors(accept, _tmp447);
send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase2_exit0_rand_221747396()
{


;

}
fun PaxosNode_RunLearner_entry306(PaxosNode_RunLearner_entry306_receivedMess_1: (int, (int, int), int))
{
var _tmp448: ((int, int), int);
var _tmp449: bool;


_tmp448 = (PaxosNode_RunLearner_entry306_receivedMess_1.1, PaxosNode_RunLearner_entry306_receivedMess_1.2);
PaxosNode_learnerSlots[PaxosNode_RunLearner_entry306_receivedMess_1.0] = _tmp448;
PaxosNode_RunReplicatedMachine();
_tmp449 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry306_receivedMess_1.2);
if((PaxosNode_currCommitOperation && _tmp449))
{

pop;

}
else
{

PaxosNode_proposeVal = PaxosNode_commitValue;
raise goPropose;

}

}
fun PaxosNode_RunLearner_exit0_rand_1257938425()
{


;

}start  state PaxosNode_Init
{entry (payload: (int)) {
PaxosNode_Init_entry50(payload);
}
exit  {
PaxosNode_Init_exit0_rand_1514055419();
}
defer Ping;
on allNodes do  (payload: (seq[machine])) {
PaxosNode_Init_do_allNodes58(payload);
}
on local goto PaxosNode_PerformOperation with   {
PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_644634171();
}
}
 state PaxosNode_PerformOperation
{entry  {
PaxosNode_PerformOperation_entry0_rand_1470640658();
}
exit  {
PaxosNode_PerformOperation_exit0_rand_1616212452();
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
{entry  {
PaxosNode_ProposeValuePhase1_entry186();
}
exit  {
PaxosNode_ProposeValuePhase1_exit0_rand_504602256();
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
PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1666768781();
}
}
 state PaxosNode_ProposeValuePhase2
{entry  {
PaxosNode_ProposeValuePhase2_entry260();
}
exit  {
PaxosNode_ProposeValuePhase2_exit0_rand_221747396();
}
ignore agree;
on accepted do  (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase2_do_accepted271(payload);
}
on reject goto PaxosNode_ProposeValuePhase1 with  (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275(payload);
}

on timeout goto PaxosNode_ProposeValuePhase1 with  (payload: (machine)) {
PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_432278869();
}
}
 state PaxosNode_RunLearner
{entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry306(payload);
}
exit  {
PaxosNode_RunLearner_exit0_rand_1257938425();
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
var _tmp450: machine;
var _tmp451: (int, machine);


_tmp450 = LeaderElection_servers[0];
_tmp451 = (1, _tmp450);
return (_tmp451);
}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1319315790()
{


;

}
fun LeaderElection_Init_entry440(LeaderElection_Init_entry440_payload: (seq[machine], machine, int))
{
var _tmp452: (int, machine);


LeaderElection_servers = LeaderElection_Init_entry440_payload.0;
LeaderElection_parentServer = LeaderElection_Init_entry440_payload.1;
LeaderElection_myRank = LeaderElection_Init_entry440_payload.2;
_tmp452 = (LeaderElection_myRank, this);
LeaderElection_currentLeader = _tmp452;
raise local;
}
fun LeaderElection_Init_exit0_rand_1612181067()
{


;

}
fun LeaderElection_SendLeader_entry452()
{


LeaderElection_currentLeader = LeaderElection_GetNewLeader();
assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);
send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;
}
fun LeaderElection_SendLeader_exit0_rand_1891067417()
{


;

}start  state LeaderElection_Init
{entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry440(payload);
}
exit  {
LeaderElection_Init_exit0_rand_1612181067();
}
on local goto LeaderElection_SendLeader with   {
LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1319315790();
}
}
 state LeaderElection_SendLeader
{entry  {
LeaderElection_SendLeader_entry452();
}
exit  {
LeaderElection_SendLeader_exit0_rand_1891067417();
}
}
}

model Timer
{
var Timer_target: machine;
var Timer_timeoutvalue: int;

fun Timer_Init_on_local_goto_Timer_Loop0_rand_423414758()
{


;

}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1909880156()
{


;

}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_919170497()
{


;

}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_684033376()
{


;

}
fun Timer_Init_entry483(Timer_Init_entry483_payload: (machine, int))
{


Timer_target = Timer_Init_entry483_payload.0;
Timer_timeoutvalue = Timer_Init_entry483_payload.1;
raise local;
}
fun Timer_Init_exit0_rand_236072307()
{


;

}
fun Timer_Loop_entry0_rand_624034828()
{


;

}
fun Timer_Loop_exit0_rand_1130062466()
{


;

}
fun Timer_TimerStarted_entry498()
{
var _tmp453: bool;


_tmp453 = $;
if(_tmp453)
{

raise local;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_1246749986()
{


;

}start  state Timer_Init
{entry (payload: (machine, int)) {
Timer_Init_entry483(payload);
}
exit  {
Timer_Init_exit0_rand_236072307();
}
on local goto Timer_Loop with   {
Timer_Init_on_local_goto_Timer_Loop0_rand_423414758();
}
}
 state Timer_Loop
{entry  {
Timer_Loop_entry0_rand_624034828();
}
exit  {
Timer_Loop_exit0_rand_1130062466();
}
ignore cancelTimer;on startTimer goto Timer_TimerStarted with   {
Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1909880156();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry498();
}
exit  {
Timer_TimerStarted_exit0_rand_1246749986();
}
ignore startTimer;on local goto Timer_Loop with   {
Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_919170497();
}

on cancelTimer goto Timer_Loop with   {
Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_684033376();
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
var _tmp454: (int);
var _tmp455: machine;
var _tmp456: (int);
var _tmp457: machine;
var _tmp458: (int);
var _tmp459: machine;
var _tmp460: machine;
var _tmp461: (seq[machine]);


_tmp454 = (3,);
_tmp455 = new PaxosNode(_tmp454);
GodMachine_temp = _tmp455;
GodMachine_paxosnodes += (0, GodMachine_temp);
_tmp456 = (2,);
_tmp457 = new PaxosNode(_tmp456);
GodMachine_temp = _tmp457;
GodMachine_paxosnodes += (0, GodMachine_temp);
_tmp458 = (1,);
_tmp459 = new PaxosNode(_tmp458);
GodMachine_temp = _tmp459;
GodMachine_paxosnodes += (0, GodMachine_temp);
GodMachine_iter = 0;
while((GodMachine_iter < sizeof(GodMachine_paxosnodes)))
{

_tmp460 = GodMachine_paxosnodes[GodMachine_iter];
_tmp461 = (GodMachine_paxosnodes,);
send _tmp460, allNodes, _tmp461;
GodMachine_iter = (GodMachine_iter + 1);

}

new Client(GodMachine_paxosnodes);
}
fun GodMachine_Init_exit0_rand_405067382()
{


;

}start  state GodMachine_Init
{entry  {
GodMachine_Init_entry516();
}
exit  {
GodMachine_Init_exit0_rand_405067382();
}
}
}

model Client
{
var Client_servers: seq[machine];

fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_1211463924()
{


;

}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1791713986()
{


;

}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_1193563649()
{


;

}
fun Client_Init_entry539(Client_Init_entry539_payload: seq[machine])
{


Client_servers = Client_Init_entry539_payload;
raise local;
}
fun Client_Init_exit0_rand_228437237()
{


;

}
fun Client_PumpRequestOne_entry0_rand_1445492()
{
var _tmp462: bool;
var _tmp463: machine;
var _tmp464: (int, int);
var _tmp465: machine;
var _tmp466: (int, int);


;

_tmp462 = $;
if(_tmp462)
{

_tmp463 = Client_servers[0];
_tmp464 = (0, 1);
send _tmp463, update, _tmp464;

}
else
{

_tmp465 = Client_servers[(sizeof(Client_servers) - 1)];
_tmp466 = (0, 1);
send _tmp465, update, _tmp466;

}

raise response;
}
fun Client_PumpRequestOne_exit0_rand_1568174590()
{


;

}
fun Client_PumpRequestTwo_entry0_rand_1492701509()
{
var _tmp467: bool;
var _tmp468: machine;
var _tmp469: (int, int);
var _tmp470: machine;
var _tmp471: (int, int);


;

_tmp467 = $;
if(_tmp467)
{

_tmp468 = Client_servers[0];
_tmp469 = (0, 2);
send _tmp468, update, _tmp469;

}
else
{

_tmp470 = Client_servers[(sizeof(Client_servers) - 1)];
_tmp471 = (0, 2);
send _tmp470, update, _tmp471;

}

raise response;
}
fun Client_PumpRequestTwo_exit0_rand_1226300464()
{


;

}
fun Client_Done_entry0_rand_1300481551()
{


;

}
fun Client_Done_exit0_rand_463268863()
{


;

}start  state Client_Init
{entry (payload: seq[machine]) {
Client_Init_entry539(payload);
}
exit  {
Client_Init_exit0_rand_228437237();
}
on local goto Client_PumpRequestOne with   {
Client_Init_on_local_goto_Client_PumpRequestOne0_rand_1211463924();
}
}
 state Client_PumpRequestOne
{entry  {
Client_PumpRequestOne_entry0_rand_1445492();
}
exit  {
Client_PumpRequestOne_exit0_rand_1568174590();
}
on response goto Client_PumpRequestTwo with   {
Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1791713986();
}
}
 state Client_PumpRequestTwo
{entry  {
Client_PumpRequestTwo_entry0_rand_1492701509();
}
exit  {
Client_PumpRequestTwo_exit0_rand_1226300464();
}
on response goto Client_Done with   {
Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_1193563649();
}
}
 state Client_Done
{entry  {
Client_Done_entry0_rand_1300481551();
}
exit  {
Client_Done_exit0_rand_463268863();
}
}
}

