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
var _tmp472: bool;
var _tmp473: (seq[machine], machine, int);
var _tmp474: machine;


PaxosNode_acceptors = PaxosNode_UpdateAcceptors_payload.0;
PaxosNode_majority = ((sizeof(PaxosNode_acceptors) / 2) + 1);
_tmp472 = (PaxosNode_majority == 2);
assert _tmp472;
_tmp473 = (PaxosNode_acceptors, this, PaxosNode_myRank);
_tmp474 = new LeaderElection(_tmp473);
PaxosNode_leaderElectionService = _tmp474;
raise local;
}
fun PaxosNode_CheckIfLeader(PaxosNode_CheckIfLeader_payload: (int, int))
{
var _tmp475: bool;


_tmp475 = (PaxosNode_currentLeader.0 == PaxosNode_myRank);
if(_tmp475)
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
var _tmp476: bool;
var _tmp477: (int, int);
var _tmp478: (int, (int, int), int);
var _tmp479: ((int, int), int);
var _tmp480: ((int, int), int);
var _tmp481: ((int, int), int);
var _tmp482: (int, (int, int));
var _tmp483: ((int, int), int);
var _tmp484: ((int, int), int);
var _tmp485: (int, (int, int), int);
var _tmp486: ((int, int), int);


_tmp476 = (PaxosNode_preparefun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(!(_tmp476))
{

_tmp477 = (~(1), ~(1));
_tmp478 = (PaxosNode_preparefun_receivedMess_2.1, _tmp477, ~(1));
send PaxosNode_preparefun_receivedMess_2.0, agree, _tmp478;
_tmp479 = (PaxosNode_preparefun_receivedMess_2.2, ~(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = _tmp479;
return;

}
else
{

;


}

_tmp480 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, _tmp480.0);
if(PaxosNode_returnVal)
{

_tmp481 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
_tmp482 = (PaxosNode_preparefun_receivedMess_2.1, _tmp481.0);
send PaxosNode_preparefun_receivedMess_2.0, reject, _tmp482;

}
else
{

_tmp483 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
_tmp484 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
_tmp485 = (PaxosNode_preparefun_receivedMess_2.1, _tmp483.0, _tmp484.1);
send PaxosNode_preparefun_receivedMess_2.0, agree, _tmp485;
_tmp486 = (PaxosNode_preparefun_receivedMess_2.2, ~(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = _tmp486;

}

}
fun PaxosNode_acceptfun(PaxosNode_acceptfun_receivedMess_2: (machine, int, (int, int), int))
{
var _tmp487: bool;
var _tmp488: ((int, int), int);
var _tmp489: ((int, int), int);
var _tmp490: (int, (int, int));
var _tmp491: ((int, int), int);
var _tmp492: (int, (int, int), int);


_tmp487 = (PaxosNode_acceptfun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(_tmp487)
{

_tmp488 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, _tmp488.0);
if(!(PaxosNode_returnVal))
{

_tmp489 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
_tmp490 = (PaxosNode_acceptfun_receivedMess_2.1, _tmp489.0);
send PaxosNode_acceptfun_receivedMess_2.0, reject, _tmp490;

}
else
{

_tmp491 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = _tmp491;
_tmp492 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
send PaxosNode_acceptfun_receivedMess_2.0, accepted, _tmp492;

}


}
else
{

;


}

}
fun PaxosNode_GetNextProposal(PaxosNode_GetNextProposal_maxRound: int): (int, int)
{
var _tmp493: (int, int);


_tmp493 = ((PaxosNode_GetNextProposal_maxRound + 1), PaxosNode_myRank);
return (_tmp493);
}
fun PaxosNode_equal(PaxosNode_equal_p1: (int, int), PaxosNode_equal_p2: (int, int)): bool
{
var _tmp494: bool;
var _tmp495: bool;


_tmp494 = (PaxosNode_equal_p1.0 == PaxosNode_equal_p2.0);
_tmp495 = (PaxosNode_equal_p1.1 == PaxosNode_equal_p2.1);
if((_tmp494 && _tmp495))
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
var _tmp496: bool;


if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

return (true);

}
else
{

_tmp496 = (PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0);
if(_tmp496)
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
var _tmp497: machine;


PaxosNode_iter = 0;
while((PaxosNode_iter < sizeof(PaxosNode_acceptors)))
{

_tmp497 = PaxosNode_acceptors[PaxosNode_iter];
send _tmp497, PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
PaxosNode_iter = (PaxosNode_iter + 1);

}

}
fun PaxosNode_CountAccepted(PaxosNode_CountAccepted_receivedMess_1: (int, (int, int), int))
{
var _tmp498: bool;
var _tmp499: bool;


_tmp498 = (PaxosNode_CountAccepted_receivedMess_1.0 == PaxosNode_nextSlotForProposer);
if(_tmp498)
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

_tmp499 = (PaxosNode_countAccept == PaxosNode_majority);
if(_tmp499)
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
var _tmp500: bool;


_tmp500 = (PaxosNode_receivedAgree.1 == ~(1));
if(!(_tmp500))
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
var _tmp501: bool;


while(true)
{

_tmp501 = ((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots);
if(_tmp501)
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
var _tmp502: bool;
var _tmp503: bool;


_tmp502 = (PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.0 == PaxosNode_nextSlotForProposer);
if(_tmp502)
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

_tmp503 = (PaxosNode_countAgree == PaxosNode_majority);
if(_tmp503)
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
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_1614480353()
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
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1007677960()
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
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1287382366()
{


;

}
fun PaxosNode_Init_entry52(PaxosNode_Init_entry52_payload: (int))
{
var _tmp504: (int, machine);
var _tmp505: (machine, int);
var _tmp506: machine;


PaxosNode_myRank = PaxosNode_Init_entry52_payload.0;
_tmp504 = (PaxosNode_myRank, this);
PaxosNode_currentLeader = _tmp504;
PaxosNode_roundNum = 0;
PaxosNode_maxRound = 0;
_tmp505 = (this, 10);
_tmp506 = new Timer(_tmp505);
PaxosNode_timer = _tmp506;
PaxosNode_lastExecutedSlot = ~(1);
PaxosNode_nextSlotForProposer = 0;
}
fun PaxosNode_Init_exit0_rand_1951509474()
{


;

}
fun PaxosNode_PerformOperation_entry0_rand_1360688273()
{


;

}
fun PaxosNode_PerformOperation_exit0_rand_957396595()
{


;

}
fun PaxosNode_ProposeValuePhase1_entry190()
{
var _tmp507: (int, int);
var _tmp508: ((int, int), int);
var _tmp509: (int, int);
var _tmp510: (machine, int, (int, int));


PaxosNode_countAgree = 0;
PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);
_tmp507 = (~(1), ~(1));
_tmp508 = (_tmp507, ~(1));
PaxosNode_receivedAgree = _tmp508;
_tmp509 = (PaxosNode_nextProposal.0, PaxosNode_myRank);
_tmp510 = (this, PaxosNode_nextSlotForProposer, _tmp509);
PaxosNode_BroadCastAcceptors(prepare, _tmp510);
;

send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase1_exit0_rand_1049090986()
{


;

}
fun PaxosNode_ProposeValuePhase2_entry265()
{
var _tmp511: (machine, int, (int, int), int);


PaxosNode_countAccept = 0;
PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();
;

;

_tmp511 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
PaxosNode_BroadCastAcceptors(accept, _tmp511);
send PaxosNode_timer, startTimer;
}
fun PaxosNode_ProposeValuePhase2_exit0_rand_1513175337()
{


;

}
fun PaxosNode_RunLearner_entry310(PaxosNode_RunLearner_entry310_receivedMess_1: (int, (int, int), int))
{
var _tmp512: ((int, int), int);
var _tmp513: bool;


_tmp512 = (PaxosNode_RunLearner_entry310_receivedMess_1.1, PaxosNode_RunLearner_entry310_receivedMess_1.2);
PaxosNode_learnerSlots[PaxosNode_RunLearner_entry310_receivedMess_1.0] = _tmp512;
PaxosNode_RunReplicatedMachine();
_tmp513 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry310_receivedMess_1.2);
if((PaxosNode_currCommitOperation && _tmp513))
{

pop;

}
else
{

PaxosNode_proposeVal = PaxosNode_commitValue;
raise goPropose;

}

}
fun PaxosNode_RunLearner_exit0_rand_349770140()
{


;

}start  state PaxosNode_Init
{entry (payload: (int)) {
PaxosNode_Init_entry52(payload);
}
exit  {
PaxosNode_Init_exit0_rand_1951509474();
}
defer Ping;
on allNodes do  (payload: (seq[machine])) {
PaxosNode_Init_do_allNodes60(payload);
}
on local goto PaxosNode_PerformOperation with   {
PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_1614480353();
}
}
 state PaxosNode_PerformOperation
{entry  {
PaxosNode_PerformOperation_entry0_rand_1360688273();
}
exit  {
PaxosNode_PerformOperation_exit0_rand_957396595();
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
{entry  {
PaxosNode_ProposeValuePhase1_entry190();
}
exit  {
PaxosNode_ProposeValuePhase1_exit0_rand_1049090986();
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
PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1007677960();
}
}
 state PaxosNode_ProposeValuePhase2
{entry  {
PaxosNode_ProposeValuePhase2_entry265();
}
exit  {
PaxosNode_ProposeValuePhase2_exit0_rand_1513175337();
}
ignore agree;
on accepted do  (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase2_do_accepted276(payload);
}
on reject goto PaxosNode_ProposeValuePhase1 with  (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279(payload);
}

on timeout goto PaxosNode_ProposeValuePhase1 with  (payload: (machine)) {
PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1287382366();
}
}
 state PaxosNode_RunLearner
{entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry310(payload);
}
exit  {
PaxosNode_RunLearner_exit0_rand_349770140();
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
var _tmp514: machine;
var _tmp515: (int, machine);


_tmp514 = LeaderElection_servers[0];
_tmp515 = (1, _tmp514);
return (_tmp515);
}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_2101325838()
{


;

}
fun LeaderElection_Init_entry444(LeaderElection_Init_entry444_payload: (seq[machine], machine, int))
{
var _tmp516: (int, machine);


LeaderElection_servers = LeaderElection_Init_entry444_payload.0;
LeaderElection_parentServer = LeaderElection_Init_entry444_payload.1;
LeaderElection_myRank = LeaderElection_Init_entry444_payload.2;
_tmp516 = (LeaderElection_myRank, this);
LeaderElection_currentLeader = _tmp516;
raise local;
}
fun LeaderElection_Init_exit0_rand_2037441404()
{


;

}
fun LeaderElection_SendLeader_entry456()
{


LeaderElection_currentLeader = LeaderElection_GetNewLeader();
assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);
send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;
}
fun LeaderElection_SendLeader_exit0_rand_1228586897()
{


;

}start  state LeaderElection_Init
{entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry444(payload);
}
exit  {
LeaderElection_Init_exit0_rand_2037441404();
}
on local goto LeaderElection_SendLeader with   {
LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_2101325838();
}
}
 state LeaderElection_SendLeader
{entry  {
LeaderElection_SendLeader_entry456();
}
exit  {
LeaderElection_SendLeader_exit0_rand_1228586897();
}
}
}

model Timer
{
var Timer_target: machine;
var Timer_timeoutvalue: int;

fun Timer_Init_on_local_goto_Timer_Loop0_rand_326735202()
{


;

}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1036499742()
{


;

}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_2023491950()
{


;

}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_2065147620()
{


;

}
fun Timer_Init_entry486(Timer_Init_entry486_payload: (machine, int))
{


Timer_target = Timer_Init_entry486_payload.0;
Timer_timeoutvalue = Timer_Init_entry486_payload.1;
raise local;
}
fun Timer_Init_exit0_rand_1330484605()
{


;

}
fun Timer_Loop_entry0_rand_472141817()
{


;

}
fun Timer_Loop_exit0_rand_1762691959()
{


;

}
fun Timer_TimerStarted_entry501()
{
var _tmp517: bool;


_tmp517 = $;
if(_tmp517)
{

raise local;

}
else
{

;


}

}
fun Timer_TimerStarted_exit0_rand_1526261629()
{


;

}start  state Timer_Init
{entry (payload: (machine, int)) {
Timer_Init_entry486(payload);
}
exit  {
Timer_Init_exit0_rand_1330484605();
}
on local goto Timer_Loop with   {
Timer_Init_on_local_goto_Timer_Loop0_rand_326735202();
}
}
 state Timer_Loop
{entry  {
Timer_Loop_entry0_rand_472141817();
}
exit  {
Timer_Loop_exit0_rand_1762691959();
}
ignore cancelTimer;on startTimer goto Timer_TimerStarted with   {
Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1036499742();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry501();
}
exit  {
Timer_TimerStarted_exit0_rand_1526261629();
}
ignore startTimer;on local goto Timer_Loop with   {
Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_2023491950();
}

on cancelTimer goto Timer_Loop with   {
Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_2065147620();
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
var _tmp518: (int);
var _tmp519: machine;
var _tmp520: (int);
var _tmp521: machine;
var _tmp522: (int);
var _tmp523: machine;
var _tmp524: machine;
var _tmp525: (seq[machine]);


_tmp518 = (3,);
_tmp519 = new PaxosNode(_tmp518);
GodMachine_temp = _tmp519;
GodMachine_paxosnodes += (0, GodMachine_temp);
_tmp520 = (2,);
_tmp521 = new PaxosNode(_tmp520);
GodMachine_temp = _tmp521;
GodMachine_paxosnodes += (0, GodMachine_temp);
_tmp522 = (1,);
_tmp523 = new PaxosNode(_tmp522);
GodMachine_temp = _tmp523;
GodMachine_paxosnodes += (0, GodMachine_temp);
GodMachine_iter = 0;
while((GodMachine_iter < sizeof(GodMachine_paxosnodes)))
{

_tmp524 = GodMachine_paxosnodes[GodMachine_iter];
_tmp525 = (GodMachine_paxosnodes,);
send _tmp524, allNodes, _tmp525;
GodMachine_iter = (GodMachine_iter + 1);

}

new Client(GodMachine_paxosnodes);
}
fun GodMachine_Init_exit0_rand_2038606218()
{


;

}start  state GodMachine_Init
{entry  {
GodMachine_Init_entry519();
}
exit  {
GodMachine_Init_exit0_rand_2038606218();
}
}
}

model Client
{
var Client_servers: seq[machine];

fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_479613790()
{


;

}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1233597760()
{


;

}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_38175630()
{


;

}
fun Client_Init_entry542(Client_Init_entry542_payload: seq[machine])
{


Client_servers = Client_Init_entry542_payload;
raise local;
}
fun Client_Init_exit0_rand_1662055352()
{


;

}
fun Client_PumpRequestOne_entry0_rand_420018795()
{
var _tmp526: bool;
var _tmp527: machine;
var _tmp528: (int, int);
var _tmp529: machine;
var _tmp530: (int, int);


;

_tmp526 = $;
if(_tmp526)
{

_tmp527 = Client_servers[0];
_tmp528 = (0, 1);
send _tmp527, update, _tmp528;

}
else
{

_tmp529 = Client_servers[(sizeof(Client_servers) - 1)];
_tmp530 = (0, 1);
send _tmp529, update, _tmp530;

}

raise response;
}
fun Client_PumpRequestOne_exit0_rand_27211487()
{


;

}
fun Client_PumpRequestTwo_entry0_rand_1090878553()
{
var _tmp531: bool;
var _tmp532: machine;
var _tmp533: (int, int);
var _tmp534: machine;
var _tmp535: (int, int);


;

_tmp531 = $;
if(_tmp531)
{

_tmp532 = Client_servers[0];
_tmp533 = (0, 2);
send _tmp532, update, _tmp533;

}
else
{

_tmp534 = Client_servers[(sizeof(Client_servers) - 1)];
_tmp535 = (0, 2);
send _tmp534, update, _tmp535;

}

raise response;
}
fun Client_PumpRequestTwo_exit0_rand_421969266()
{


;

}
fun Client_Done_entry0_rand_341705566()
{


;

}
fun Client_Done_exit0_rand_1573952635()
{


;

}start  state Client_Init
{entry (payload: seq[machine]) {
Client_Init_entry542(payload);
}
exit  {
Client_Init_exit0_rand_1662055352();
}
on local goto Client_PumpRequestOne with   {
Client_Init_on_local_goto_Client_PumpRequestOne0_rand_479613790();
}
}
 state Client_PumpRequestOne
{entry  {
Client_PumpRequestOne_entry0_rand_420018795();
}
exit  {
Client_PumpRequestOne_exit0_rand_27211487();
}
on response goto Client_PumpRequestTwo with   {
Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1233597760();
}
}
 state Client_PumpRequestTwo
{entry  {
Client_PumpRequestTwo_entry0_rand_1090878553();
}
exit  {
Client_PumpRequestTwo_exit0_rand_421969266();
}
on response goto Client_Done with   {
Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_38175630();
}
}
 state Client_Done
{entry  {
Client_Done_entry0_rand_341705566();
}
exit  {
Client_Done_exit0_rand_1573952635();
}
}
}

