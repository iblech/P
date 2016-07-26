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
var Tmp453: bool;
var Tmp454: (seq[machine], machine, int);
var Tmp455: machine;


;

PaxosNode_acceptors = PaxosNode_UpdateAcceptors_payload.0;
;

PaxosNode_majority = ((sizeof(PaxosNode_acceptors) / 2) + 1);
;

Tmp453 = (PaxosNode_majority == 2);
assert Tmp453;
;

Tmp454 = (PaxosNode_acceptors, this, PaxosNode_myRank);
Tmp455 = new LeaderElection(Tmp454);
PaxosNode_leaderElectionService = Tmp455;
;

raise local;
}
fun PaxosNode_CheckIfLeader(PaxosNode_CheckIfLeader_payload: (int, int))
{
var Tmp456: bool;


;

Tmp456 = (PaxosNode_currentLeader.0 == PaxosNode_myRank);
if(Tmp456)
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
var Tmp457: bool;
var Tmp458: (int, int);
var Tmp459: (int, (int, int), int);
var Tmp460: ((int, int), int);
var Tmp461: ((int, int), int);
var Tmp462: ((int, int), int);
var Tmp463: (int, (int, int));
var Tmp464: ((int, int), int);
var Tmp465: ((int, int), int);
var Tmp466: (int, (int, int), int);
var Tmp467: ((int, int), int);


;

Tmp457 = (PaxosNode_preparefun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(!(Tmp457))
{

;

Tmp458 = (-(1), -(1));
Tmp459 = (PaxosNode_preparefun_receivedMess_2.1, Tmp458, -(1));
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp459;
;

Tmp460 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp460;

}
else
{

;

;


}

;

Tmp461 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, Tmp461.0);
;

if(PaxosNode_returnVal)
{

;

Tmp462 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp463 = (PaxosNode_preparefun_receivedMess_2.1, Tmp462.0);
send PaxosNode_preparefun_receivedMess_2.0, reject, Tmp463;

}
else
{

;

Tmp464 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp465 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
Tmp466 = (PaxosNode_preparefun_receivedMess_2.1, Tmp464.0, Tmp465.1);
send PaxosNode_preparefun_receivedMess_2.0, agree, Tmp466;
;

Tmp467 = (PaxosNode_preparefun_receivedMess_2.2, -(1));
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = Tmp467;

}

}
fun PaxosNode_acceptfun(PaxosNode_acceptfun_receivedMess_2: (machine, int, (int, int), int))
{
var Tmp468: bool;
var Tmp469: ((int, int), int);
var Tmp470: ((int, int), int);
var Tmp471: (int, (int, int));
var Tmp472: ((int, int), int);
var Tmp473: (int, (int, int), int);


;

Tmp468 = (PaxosNode_acceptfun_receivedMess_2.1 in PaxosNode_acceptorSlots);
if(Tmp468)
{

;

Tmp469 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, Tmp469.0);
;

if(!(PaxosNode_returnVal))
{

;

Tmp470 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
Tmp471 = (PaxosNode_acceptfun_receivedMess_2.1, Tmp470.0);
send PaxosNode_acceptfun_receivedMess_2.0, reject, Tmp471;

}
else
{

;

Tmp472 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = Tmp472;
;

Tmp473 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
send PaxosNode_acceptfun_receivedMess_2.0, accepted, Tmp473;

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
var Tmp474: (int, int);


;

Tmp474 = ((PaxosNode_GetNextProposal_maxRound + 1), PaxosNode_myRank);
return (Tmp474);
}
fun PaxosNode_equal(PaxosNode_equal_p1: (int, int), PaxosNode_equal_p2: (int, int)): bool
{
var Tmp475: bool;
var Tmp476: bool;


;

Tmp475 = (PaxosNode_equal_p1.0 == PaxosNode_equal_p2.0);
Tmp476 = (PaxosNode_equal_p1.1 == PaxosNode_equal_p2.1);
if((Tmp475 && Tmp476))
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
var Tmp477: bool;


;

if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

;

return (true);

}
else
{

;

Tmp477 = (PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0);
if(Tmp477)
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
var Tmp478: machine;


;

PaxosNode_iter = 0;
;

while((PaxosNode_iter < sizeof(PaxosNode_acceptors)))
{

;

Tmp478 = PaxosNode_acceptors[PaxosNode_iter];
send Tmp478, PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
;

PaxosNode_iter = (PaxosNode_iter + 1);

}

}
fun PaxosNode_CountAccepted(PaxosNode_CountAccepted_receivedMess_1: (int, (int, int), int))
{
var Tmp479: bool;
var Tmp480: bool;
var Tmp481: (machine, int, (int, int), int);


;

Tmp479 = (PaxosNode_CountAccepted_receivedMess_1.0 == PaxosNode_nextSlotForProposer);
if(Tmp479)
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

Tmp480 = (PaxosNode_countAccept == PaxosNode_majority);
if(Tmp480)
{

;

Tmp481 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
monitor (monitor_valueChosen), (Tmp481);
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
var Tmp482: bool;


;

Tmp482 = (PaxosNode_receivedAgree.1 == -(1));
if(!(Tmp482))
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
var Tmp483: bool;


;

while(true)
{

;

Tmp483 = ((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots);
if(Tmp483)
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
fun PaxosNode_Init_do_allNodes58(PaxosNode_Init_do_allNodes58_payload: (seq[machine]))
{


;

PaxosNode_UpdateAcceptors(PaxosNode_Init_do_allNodes58_payload);
return;
}
fun PaxosNode_PerformOperation_do_update89(PaxosNode_PerformOperation_do_update89_payload: (int, int))
{


;

PaxosNode_CheckIfLeader(PaxosNode_PerformOperation_do_update89_payload);
return;
}
fun PaxosNode_PerformOperation_do_prepare93(PaxosNode_PerformOperation_do_prepare93_payload: (machine, int, (int, int)))
{


;

PaxosNode_preparefun(PaxosNode_PerformOperation_do_prepare93_payload);
return;
}
fun PaxosNode_PerformOperation_do_accept94(PaxosNode_PerformOperation_do_accept94_payload: (machine, int, (int, int), int))
{


;

PaxosNode_acceptfun(PaxosNode_PerformOperation_do_accept94_payload);
return;
}
fun PaxosNode_PerformOperation_do_Ping100(PaxosNode_PerformOperation_do_Ping100_payload: (int, machine))
{


;

send PaxosNode_leaderElectionService, Ping, PaxosNode_PerformOperation_do_Ping100_payload;
return;
}
fun PaxosNode_PerformOperation_do_newLeader101(PaxosNode_PerformOperation_do_newLeader101_payload: (int, machine))
{


;

PaxosNode_currentLeader = PaxosNode_PerformOperation_do_newLeader101_payload;
return;
}
fun PaxosNode_ProposeValuePhase1_do_agree195(PaxosNode_ProposeValuePhase1_do_agree195_receivedMess: (int, (int, int), int))
{
var Tmp484: bool;
var Tmp485: bool;


;

Tmp484 = (PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.0 == PaxosNode_nextSlotForProposer);
if(Tmp484)
{

;

PaxosNode_countAgree = (PaxosNode_countAgree + 1);
;

PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_receivedAgree.0, PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.1);
;

if(PaxosNode_returnVal)
{

;

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.1;
;

PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree195_receivedMess.2;

}
else
{

;

;


}

;

Tmp485 = (PaxosNode_countAgree == PaxosNode_majority);
if(Tmp485)
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
fun PaxosNode_ProposeValuePhase2_do_accepted271(PaxosNode_ProposeValuePhase2_do_accepted271_payload: (int, (int, int), int))
{


;

PaxosNode_CountAccepted(PaxosNode_ProposeValuePhase2_do_accepted271_payload);
return;
}
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_238825708(PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_238825708__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209(PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209_payload: (int, (int, int)))
{


;

if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209_payload.1.0))
{

;

PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209_payload.1.0;

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
fun PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2216(PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2216__payload_0: null)
{


;

send PaxosNode_timer, cancelTimer;
return;
}
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_405706873(PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_405706873__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275(PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275_payload: (int, (int, int)))
{


;

if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275_payload.1.0))
{

;

PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275_payload.1.0;

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
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1254685665(PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1254685665__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_Init_entry50(PaxosNode_Init_entry50_payload: (int))
{
var Tmp486: (int, machine);
var Tmp487: (machine, int);
var Tmp488: machine;


;

PaxosNode_myRank = PaxosNode_Init_entry50_payload.0;
;

Tmp486 = (PaxosNode_myRank, this);
PaxosNode_currentLeader = Tmp486;
;

PaxosNode_roundNum = 0;
;

PaxosNode_maxRound = 0;
;

Tmp487 = (this, 10);
Tmp488 = new Timer(Tmp487);
PaxosNode_timer = Tmp488;
;

PaxosNode_lastExecutedSlot = -(1);
;

PaxosNode_nextSlotForProposer = 0;
return;
}
fun PaxosNode_Init_exit0_rand_133564647(PaxosNode_Init_exit0_rand_133564647__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_PerformOperation_entry0_rand_1033162991(PaxosNode_PerformOperation_entry0_rand_1033162991__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_PerformOperation_exit0_rand_129190940(PaxosNode_PerformOperation_exit0_rand_129190940__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase1_entry186(PaxosNode_ProposeValuePhase1_entry186_payload: any)
{
var Tmp489: (int, int);
var Tmp490: ((int, int), int);
var Tmp491: (int, int);
var Tmp492: (machine, int, (int, int));


;

PaxosNode_countAgree = 0;
;

PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);
;

Tmp489 = (-(1), -(1));
Tmp490 = (Tmp489, -(1));
PaxosNode_receivedAgree = Tmp490;
;

Tmp491 = (PaxosNode_nextProposal.0, PaxosNode_myRank);
Tmp492 = (this, PaxosNode_nextSlotForProposer, Tmp491);
PaxosNode_BroadCastAcceptors(prepare, Tmp492);
;

monitor (monitor_proposer_sent), (PaxosNode_proposeVal);
;

send PaxosNode_timer, startTimer;
return;
}
fun PaxosNode_ProposeValuePhase1_exit0_rand_1580422203(PaxosNode_ProposeValuePhase1_exit0_rand_1580422203__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_ProposeValuePhase2_entry260(PaxosNode_ProposeValuePhase2_entry260__payload_1: null)
{
var Tmp493: (machine, int, (int, int), int);
var Tmp494: (machine, int, (int, int), int);


;

PaxosNode_countAccept = 0;
;

PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();
;

Tmp493 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
monitor (monitor_valueProposed), (Tmp493);
;

monitor (monitor_proposer_sent), (PaxosNode_proposeVal);
;

Tmp494 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
PaxosNode_BroadCastAcceptors(accept, Tmp494);
;

send PaxosNode_timer, startTimer;
return;
}
fun PaxosNode_ProposeValuePhase2_exit0_rand_819490978(PaxosNode_ProposeValuePhase2_exit0_rand_819490978__payload_skip: any)
{


;

;

return;
}
fun PaxosNode_RunLearner_entry306(PaxosNode_RunLearner_entry306_receivedMess_1: (int, (int, int), int))
{
var Tmp495: ((int, int), int);
var Tmp496: bool;


;

Tmp495 = (PaxosNode_RunLearner_entry306_receivedMess_1.1, PaxosNode_RunLearner_entry306_receivedMess_1.2);
PaxosNode_learnerSlots[PaxosNode_RunLearner_entry306_receivedMess_1.0] = Tmp495;
;

PaxosNode_RunReplicatedMachine();
;

Tmp496 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry306_receivedMess_1.2);
if((PaxosNode_currCommitOperation && Tmp496))
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
fun PaxosNode_RunLearner_exit0_rand_1951280032(PaxosNode_RunLearner_exit0_rand_1951280032__payload_skip: any)
{


;

;

return;
}start 
 state PaxosNode_Init
{
entry (payload: (int)) {
PaxosNode_Init_entry50(payload);
}exit {
PaxosNode_Init_exit0_rand_133564647(null);
}defer Ping;
on allNodes do (payload: (seq[machine])) {
PaxosNode_Init_do_allNodes58(payload);
}on local goto PaxosNode_PerformOperation with (payload: null) {
PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_238825708(payload);
}}

 state PaxosNode_PerformOperation
{
entry (payload: any) {
PaxosNode_PerformOperation_entry0_rand_1033162991(payload);
}exit {
PaxosNode_PerformOperation_exit0_rand_129190940(null);
}ignore agree;
ignore accepted;
ignore timeout;
on update do (payload: (int, int)) {
PaxosNode_PerformOperation_do_update89(payload);
}
on prepare do (payload: (machine, int, (int, int))) {
PaxosNode_PerformOperation_do_prepare93(payload);
}
on accept do (payload: (machine, int, (int, int), int)) {
PaxosNode_PerformOperation_do_accept94(payload);
}
on Ping do (payload: (int, machine)) {
PaxosNode_PerformOperation_do_Ping100(payload);
}
on newLeader do (payload: (int, machine)) {
PaxosNode_PerformOperation_do_newLeader101(payload);
}on goPropose push PaxosNode_ProposeValuePhase1;
on chosen push PaxosNode_RunLearner;}

 state PaxosNode_ProposeValuePhase1
{
entry (payload: any) {
PaxosNode_ProposeValuePhase1_entry186(payload);
}exit {
PaxosNode_ProposeValuePhase1_exit0_rand_1580422203(null);
}ignore accepted;
on agree do (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase1_do_agree195(payload);
}on reject goto PaxosNode_ProposeValuePhase1 with (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1209(payload);
}
on success goto PaxosNode_ProposeValuePhase2 with (payload: null) {
PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2216(payload);
}
on timeout goto PaxosNode_ProposeValuePhase1 with (payload: (machine)) {
PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_405706873(payload);
}}

 state PaxosNode_ProposeValuePhase2
{
entry (payload: null) {
PaxosNode_ProposeValuePhase2_entry260(payload);
}exit {
PaxosNode_ProposeValuePhase2_exit0_rand_819490978(null);
}ignore agree;
on accepted do (payload: (int, (int, int), int)) {
PaxosNode_ProposeValuePhase2_do_accepted271(payload);
}on reject goto PaxosNode_ProposeValuePhase1 with (payload: (int, (int, int))) {
PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1275(payload);
}
on timeout goto PaxosNode_ProposeValuePhase1 with (payload: (machine)) {
PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1254685665(payload);
}}

 state PaxosNode_RunLearner
{
entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry306(payload);
}exit {
PaxosNode_RunLearner_exit0_rand_1951280032(null);
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
var Tmp497: bool;


;

if((BasicPaxosInvariant_P2b_lessThan_p1.0 < BasicPaxosInvariant_P2b_lessThan_p2.0))
{

;

return (true);

}
else
{

;

Tmp497 = (BasicPaxosInvariant_P2b_lessThan_p1.0 == BasicPaxosInvariant_P2b_lessThan_p2.0);
if(Tmp497)
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
fun BasicPaxosInvariant_P2b_Init_on_local_goto_BasicPaxosInvariant_P2b_WaitForValueChosen0_rand_768182073(BasicPaxosInvariant_P2b_Init_on_local_goto_BasicPaxosInvariant_P2b_WaitForValueChosen0_rand_768182073__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed352(BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed352_receivedValue: (machine, int, (int, int), int))
{
var Tmp498: ((int, int), int);


;

Tmp498 = (BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed352_receivedValue.2, BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed352_receivedValue.3);
BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed352_receivedValue.1] = Tmp498;
return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed377(BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed377_receivedValue: (machine, int, (int, int), int))
{
var Tmp499: ((int, int), int);
var Tmp500: bool;


;

Tmp499 = BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed377_receivedValue.1];
Tmp500 = (Tmp499.1 == BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed377_receivedValue.3);
assert Tmp500;
return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed381(BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue: (machine, int, (int, int), int))
{
var Tmp501: ((int, int), int);
var Tmp502: ((int, int), int);
var Tmp503: bool;


;

Tmp501 = BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue.1];
BasicPaxosInvariant_P2b_returnVal = BasicPaxosInvariant_P2b_lessThan(Tmp501.0, BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue.2);
;

if(BasicPaxosInvariant_P2b_returnVal)
{

;

Tmp502 = BasicPaxosInvariant_P2b_lastValueChosen[BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue.1];
Tmp503 = (Tmp502.1 == BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed381_receivedValue.3);
assert Tmp503;

}
else
{

;

;


}

return;
}
fun BasicPaxosInvariant_P2b_Init_entry339(BasicPaxosInvariant_P2b_Init_entry339__payload_2: null)
{


;

raise local;
return;
}
fun BasicPaxosInvariant_P2b_Init_exit0_rand_249512987(BasicPaxosInvariant_P2b_Init_exit0_rand_249512987__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_WaitForValueChosen_entry0_rand_1998065400(BasicPaxosInvariant_P2b_WaitForValueChosen_entry0_rand_1998065400__payload_3: null)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_WaitForValueChosen_exit0_rand_55089995(BasicPaxosInvariant_P2b_WaitForValueChosen_exit0_rand_55089995__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_entry0_rand_574612679(BasicPaxosInvariant_P2b_CheckValueProposed_entry0_rand_574612679__payload_skip: any)
{


;

;

return;
}
fun BasicPaxosInvariant_P2b_CheckValueProposed_exit0_rand_179558659(BasicPaxosInvariant_P2b_CheckValueProposed_exit0_rand_179558659__payload_skip: any)
{


;

;

return;
}start 
 state BasicPaxosInvariant_P2b_Init
{
entry (payload: null) {
BasicPaxosInvariant_P2b_Init_entry339(payload);
}exit {
BasicPaxosInvariant_P2b_Init_exit0_rand_249512987(null);
}on local goto BasicPaxosInvariant_P2b_WaitForValueChosen with (payload: null) {
BasicPaxosInvariant_P2b_Init_on_local_goto_BasicPaxosInvariant_P2b_WaitForValueChosen0_rand_768182073(payload);
}}

 state BasicPaxosInvariant_P2b_WaitForValueChosen
{
entry (payload: null) {
BasicPaxosInvariant_P2b_WaitForValueChosen_entry0_rand_1998065400(payload);
}exit {
BasicPaxosInvariant_P2b_WaitForValueChosen_exit0_rand_55089995(null);
}ignore monitor_valueProposed;on monitor_valueChosen goto BasicPaxosInvariant_P2b_CheckValueProposed with (payload: (machine, int, (int, int), int)) {
BasicPaxosInvariant_P2b_WaitForValueChosen_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed352(payload);
}}

 state BasicPaxosInvariant_P2b_CheckValueProposed
{
entry (payload: any) {
BasicPaxosInvariant_P2b_CheckValueProposed_entry0_rand_574612679(payload);
}exit {
BasicPaxosInvariant_P2b_CheckValueProposed_exit0_rand_179558659(null);
}on monitor_valueChosen goto BasicPaxosInvariant_P2b_CheckValueProposed with (payload: (machine, int, (int, int), int)) {
BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueChosen_goto_BasicPaxosInvariant_P2b_CheckValueProposed377(payload);
}
on monitor_valueProposed goto BasicPaxosInvariant_P2b_CheckValueProposed with (payload: (machine, int, (int, int), int)) {
BasicPaxosInvariant_P2b_CheckValueProposed_on_monitor_valueProposed_goto_BasicPaxosInvariant_P2b_CheckValueProposed381(payload);
}}
}

spec ValmachineityCheck monitors monitor_client_sent, monitor_proposer_sent, monitor_proposer_chosen 
{
var ValmachineityCheck_clientSet: map[int, int];
var ValmachineityCheck_ProposedSet: map[int, int];

fun ValmachineityCheck_Wait_do_monitor_client_sent412(ValmachineityCheck_Wait_do_monitor_client_sent412_payload: int)
{


;

ValmachineityCheck_clientSet[ValmachineityCheck_Wait_do_monitor_client_sent412_payload] = 0;
return;
}
fun ValmachineityCheck_Wait_do_monitor_proposer_sent413(ValmachineityCheck_Wait_do_monitor_proposer_sent413_payload: int)
{
var Tmp504: bool;


;

Tmp504 = (ValmachineityCheck_Wait_do_monitor_proposer_sent413_payload in ValmachineityCheck_clientSet);
assert Tmp504;
;

ValmachineityCheck_ProposedSet[ValmachineityCheck_Wait_do_monitor_proposer_sent413_payload] = 0;
return;
}
fun ValmachineityCheck_Wait_do_monitor_proposer_chosen415(ValmachineityCheck_Wait_do_monitor_proposer_chosen415_payload: int)
{
var Tmp505: bool;


;

Tmp505 = (ValmachineityCheck_Wait_do_monitor_proposer_chosen415_payload in ValmachineityCheck_ProposedSet);
assert Tmp505;
return;
}
fun ValmachineityCheck_Init_on_local_goto_ValmachineityCheck_Wait0_rand_2053151834(ValmachineityCheck_Init_on_local_goto_ValmachineityCheck_Wait0_rand_2053151834__payload_skip: any)
{


;

;

return;
}
fun ValmachineityCheck_Init_entry406(ValmachineityCheck_Init_entry406__payload_4: null)
{


;

raise local;
return;
}
fun ValmachineityCheck_Init_exit0_rand_1072596696(ValmachineityCheck_Init_exit0_rand_1072596696__payload_skip: any)
{


;

;

return;
}
fun ValmachineityCheck_Wait_entry0_rand_184393064(ValmachineityCheck_Wait_entry0_rand_184393064__payload_skip: any)
{


;

;

return;
}
fun ValmachineityCheck_Wait_exit0_rand_181251281(ValmachineityCheck_Wait_exit0_rand_181251281__payload_skip: any)
{


;

;

return;
}start 
 state ValmachineityCheck_Init
{
entry (payload: null) {
ValmachineityCheck_Init_entry406(payload);
}exit {
ValmachineityCheck_Init_exit0_rand_1072596696(null);
}on local goto ValmachineityCheck_Wait with (payload: null) {
ValmachineityCheck_Init_on_local_goto_ValmachineityCheck_Wait0_rand_2053151834(payload);
}}

 state ValmachineityCheck_Wait
{
entry (payload: any) {
ValmachineityCheck_Wait_entry0_rand_184393064(payload);
}exit {
ValmachineityCheck_Wait_exit0_rand_181251281(null);
}on monitor_client_sent do (payload: int) {
ValmachineityCheck_Wait_do_monitor_client_sent412(payload);
}
on monitor_proposer_sent do (payload: int) {
ValmachineityCheck_Wait_do_monitor_proposer_sent413(payload);
}
on monitor_proposer_chosen do (payload: int) {
ValmachineityCheck_Wait_do_monitor_proposer_chosen415(payload);
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
var Tmp506: machine;
var Tmp507: (int, machine);


;

Tmp506 = LeaderElection_servers[0];
Tmp507 = (1, Tmp506);
return (Tmp507);
}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1902789818(LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1902789818__payload_skip: any)
{


;

;

return;
}
fun LeaderElection_Init_entry440(LeaderElection_Init_entry440_payload: (seq[machine], machine, int))
{
var Tmp508: (int, machine);


;

LeaderElection_servers = LeaderElection_Init_entry440_payload.0;
;

LeaderElection_parentServer = LeaderElection_Init_entry440_payload.1;
;

LeaderElection_myRank = LeaderElection_Init_entry440_payload.2;
;

Tmp508 = (LeaderElection_myRank, this);
LeaderElection_currentLeader = Tmp508;
;

raise local;
return;
}
fun LeaderElection_Init_exit0_rand_546801588(LeaderElection_Init_exit0_rand_546801588__payload_skip: any)
{


;

;

return;
}
fun LeaderElection_SendLeader_entry452(LeaderElection_SendLeader_entry452__payload_5: null)
{


;

LeaderElection_currentLeader = LeaderElection_GetNewLeader();
;

assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);
;

send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;
return;
}
fun LeaderElection_SendLeader_exit0_rand_2103980871(LeaderElection_SendLeader_exit0_rand_2103980871__payload_skip: any)
{


;

;

return;
}start 
 state LeaderElection_Init
{
entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry440(payload);
}exit {
LeaderElection_Init_exit0_rand_546801588(null);
}on local goto LeaderElection_SendLeader with (payload: null) {
LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1902789818(payload);
}}

 state LeaderElection_SendLeader
{
entry (payload: null) {
LeaderElection_SendLeader_entry452(payload);
}exit {
LeaderElection_SendLeader_exit0_rand_2103980871(null);
}}
}

machine Timer
{
var Timer_target: machine;
var Timer_timeoutvalue: int;

fun Timer_Init_on_local_goto_Timer_Loop0_rand_155014915(Timer_Init_on_local_goto_Timer_Loop0_rand_155014915__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_929634212(Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_929634212__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_1352834165(Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_1352834165__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_1252481683(Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_1252481683__payload_skip: any)
{


;

;

return;
}
fun Timer_Init_entry483(Timer_Init_entry483_payload: (machine, int))
{


;

Timer_target = Timer_Init_entry483_payload.0;
;

Timer_timeoutvalue = Timer_Init_entry483_payload.1;
;

raise local;
return;
}
fun Timer_Init_exit0_rand_895224441(Timer_Init_exit0_rand_895224441__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_entry0_rand_1233430693(Timer_Loop_entry0_rand_1233430693__payload_skip: any)
{


;

;

return;
}
fun Timer_Loop_exit0_rand_446310738(Timer_Loop_exit0_rand_446310738__payload_skip: any)
{


;

;

return;
}
fun Timer_TimerStarted_entry498(Timer_TimerStarted_entry498__payload_6: null)
{
var Tmp509: bool;


;

Tmp509 = $;
if(Tmp509)
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
fun Timer_TimerStarted_exit0_rand_1511296408(Timer_TimerStarted_exit0_rand_1511296408__payload_skip: any)
{


;

;

return;
}start 
 state Timer_Init
{
entry (payload: (machine, int)) {
Timer_Init_entry483(payload);
}exit {
Timer_Init_exit0_rand_895224441(null);
}on local goto Timer_Loop with (payload: null) {
Timer_Init_on_local_goto_Timer_Loop0_rand_155014915(payload);
}}

 state Timer_Loop
{
entry (payload: any) {
Timer_Loop_entry0_rand_1233430693(payload);
}exit {
Timer_Loop_exit0_rand_446310738(null);
}ignore cancelTimer;on startTimer goto Timer_TimerStarted with (payload: null) {
Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_929634212(payload);
}}

 state Timer_TimerStarted
{
entry (payload: null) {
Timer_TimerStarted_entry498(payload);
}exit {
Timer_TimerStarted_exit0_rand_1511296408(null);
}ignore startTimer;on local goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_1352834165(payload);
}
on cancelTimer goto Timer_Loop with (payload: null) {
Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_1252481683(payload);
}}
}

main machine GodMachine
{
var GodMachine_paxosnodes: seq[machine];
var GodMachine_temp: machine;
var GodMachine_iter: int;

fun GodMachine_Init_entry516(GodMachine_Init_entry516__payload_7: null)
{
var Tmp510: (int);
var Tmp511: machine;
var Tmp512: (int);
var Tmp513: machine;
var Tmp514: (int);
var Tmp515: machine;
var Tmp516: machine;
var Tmp517: (seq[machine]);


;

Tmp510 = (3,);
Tmp511 = new PaxosNode(Tmp510);
GodMachine_temp = Tmp511;
;

GodMachine_paxosnodes += (0, GodMachine_temp);
;

Tmp512 = (2,);
Tmp513 = new PaxosNode(Tmp512);
GodMachine_temp = Tmp513;
;

GodMachine_paxosnodes += (0, GodMachine_temp);
;

Tmp514 = (1,);
Tmp515 = new PaxosNode(Tmp514);
GodMachine_temp = Tmp515;
;

GodMachine_paxosnodes += (0, GodMachine_temp);
;

GodMachine_iter = 0;
;

while((GodMachine_iter < sizeof(GodMachine_paxosnodes)))
{

;

Tmp516 = GodMachine_paxosnodes[GodMachine_iter];
Tmp517 = (GodMachine_paxosnodes,);
send Tmp516, allNodes, Tmp517;
;

GodMachine_iter = (GodMachine_iter + 1);

}

;

new Client(GodMachine_paxosnodes);
return;
}
fun GodMachine_Init_exit0_rand_1824039857(GodMachine_Init_exit0_rand_1824039857__payload_skip: any)
{


;

;

return;
}start 
 state GodMachine_Init
{
entry (payload: null) {
GodMachine_Init_entry516(payload);
}exit {
GodMachine_Init_exit0_rand_1824039857(null);
}}
}

machine Client
{
var Client_servers: seq[machine];

fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_1092972108(Client_Init_on_local_goto_Client_PumpRequestOne0_rand_1092972108__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1339357651(Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1339357651__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_1675014215(Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_1675014215__payload_skip: any)
{


;

;

return;
}
fun Client_Init_entry539(Client_Init_entry539_payload: seq[machine])
{


;

Client_servers = Client_Init_entry539_payload;
;

raise local;
return;
}
fun Client_Init_exit0_rand_29381600(Client_Init_exit0_rand_29381600__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestOne_entry548(Client_PumpRequestOne_entry548__payload_8: null)
{
var Tmp518: bool;
var Tmp519: machine;
var Tmp520: (int, int);
var Tmp521: machine;
var Tmp522: (int, int);


;

monitor (monitor_client_sent), (1);
;

Tmp518 = $;
if(Tmp518)
{

;

Tmp519 = Client_servers[0];
Tmp520 = (0, 1);
send Tmp519, update, Tmp520;

}
else
{

;

Tmp521 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp522 = (0, 1);
send Tmp521, update, Tmp522;

}

;

raise response;
return;
}
fun Client_PumpRequestOne_exit0_rand_1911503152(Client_PumpRequestOne_exit0_rand_1911503152__payload_skip: any)
{


;

;

return;
}
fun Client_PumpRequestTwo_entry562(Client_PumpRequestTwo_entry562__payload_9: null)
{
var Tmp523: bool;
var Tmp524: machine;
var Tmp525: (int, int);
var Tmp526: machine;
var Tmp527: (int, int);


;

monitor (monitor_client_sent), (2);
;

Tmp523 = $;
if(Tmp523)
{

;

Tmp524 = Client_servers[0];
Tmp525 = (0, 2);
send Tmp524, update, Tmp525;

}
else
{

;

Tmp526 = Client_servers[(sizeof(Client_servers) - 1)];
Tmp527 = (0, 2);
send Tmp526, update, Tmp527;

}

;

raise response;
return;
}
fun Client_PumpRequestTwo_exit0_rand_1964774425(Client_PumpRequestTwo_exit0_rand_1964774425__payload_skip: any)
{


;

;

return;
}
fun Client_Done_entry0_rand_1270548486(Client_Done_entry0_rand_1270548486__payload_skip: any)
{


;

;

return;
}
fun Client_Done_exit0_rand_1011319101(Client_Done_exit0_rand_1011319101__payload_skip: any)
{


;

;

return;
}start 
 state Client_Init
{
entry (payload: seq[machine]) {
Client_Init_entry539(payload);
}exit {
Client_Init_exit0_rand_29381600(null);
}on local goto Client_PumpRequestOne with (payload: null) {
Client_Init_on_local_goto_Client_PumpRequestOne0_rand_1092972108(payload);
}}

 state Client_PumpRequestOne
{
entry (payload: null) {
Client_PumpRequestOne_entry548(payload);
}exit {
Client_PumpRequestOne_exit0_rand_1911503152(null);
}on response goto Client_PumpRequestTwo with (payload: null) {
Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_1339357651(payload);
}}

 state Client_PumpRequestTwo
{
entry (payload: null) {
Client_PumpRequestTwo_entry562(payload);
}exit {
Client_PumpRequestTwo_exit0_rand_1964774425(null);
}on response goto Client_Done with (payload: null) {
Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_1675014215(payload);
}}

 state Client_Done
{
entry (payload: any) {
Client_Done_entry0_rand_1270548486(payload);
}exit {
Client_Done_exit0_rand_1011319101(null);
}}
}

