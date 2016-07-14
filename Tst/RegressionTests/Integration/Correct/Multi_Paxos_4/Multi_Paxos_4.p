event halt;
event null;
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

PaxosNode_commitValue = PaxosNode_CheckIfLeader_payload.1;

PaxosNode_proposeVal = PaxosNode_commitValue;

raise goPropose;



}
else
{

send PaxosNode_currentLeader.1, update, PaxosNode_CheckIfLeader_payload;

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

send PaxosNode_preparefun_receivedMess_2.0, agree, (PaxosNode_preparefun_receivedMess_2.1, (~(1), ~(1)), ~(1));

PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = (PaxosNode_preparefun_receivedMess_2.2, ~(1));

return;



}
else
{

;

;



}

_tmp480 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];

PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, _tmp480.0);

if(PaxosNode_returnVal)
{

_tmp481 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];

_tmp482 = (PaxosNode_preparefun_receivedMess_2.1, _tmp481.0);

send PaxosNode_preparefun_receivedMess_2.0, reject, _tmp482;

send PaxosNode_preparefun_receivedMess_2.0, reject, (PaxosNode_preparefun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1].0);



}
else
{

_tmp483 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];

_tmp484 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];

_tmp485 = (PaxosNode_preparefun_receivedMess_2.1, _tmp483.0, _tmp484.1);

send PaxosNode_preparefun_receivedMess_2.0, agree, _tmp485;

_tmp486 = (PaxosNode_preparefun_receivedMess_2.2, ~(1));

PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = _tmp486;

send PaxosNode_preparefun_receivedMess_2.0, agree, (PaxosNode_preparefun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1].0, PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1].1);

PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = (PaxosNode_preparefun_receivedMess_2.2, ~(1));



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

send PaxosNode_acceptfun_receivedMess_2.0, reject, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1].0);



}
else
{

_tmp491 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);

PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = _tmp491;

_tmp492 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);

send PaxosNode_acceptfun_receivedMess_2.0, accepted, _tmp492;

PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);

send PaxosNode_acceptfun_receivedMess_2.0, accepted, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);



}

PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1].0);

if(!(PaxosNode_returnVal))
{
send PaxosNode_acceptfun_receivedMess_2.0, reject, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1].0);

}
else
{

PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);

send PaxosNode_acceptfun_receivedMess_2.0, accepted, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);



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

return (true);



}
else
{

return (false);

return (false);



}


}
fun PaxosNode_lessThan(PaxosNode_lessThan_p1: (int, int), PaxosNode_lessThan_p2: (int, int)): bool
{
var _tmp496: bool;


if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

return (true);

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

return (true);



}
else
{

return (false);

return (false);



}

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

return (false);



}

if((PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0))
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

send PaxosNode_acceptors[PaxosNode_iter], PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;

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

PaxosNode_countAccept = (PaxosNode_countAccept + 1);



}
else
{

;

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

;

send PaxosNode_timer, cancelTimer;

;

PaxosNode_nextSlotForProposer = (PaxosNode_nextSlotForProposer + 1);

raise chosen, PaxosNode_CountAccepted_receivedMess_1;



}
else
{

;

;



}

PaxosNode_returnVal = PaxosNode_equal(PaxosNode_CountAccepted_receivedMess_1.1, PaxosNode_nextProposal);

if(PaxosNode_returnVal)
{
PaxosNode_countAccept = (PaxosNode_countAccept + 1);

}
else
{
;

}

if((PaxosNode_countAccept == PaxosNode_majority))
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

PaxosNode_currCommitOperation = false;

return (PaxosNode_receivedAgree.1);



}
else
{

PaxosNode_currCommitOperation = true;

return (PaxosNode_commitValue);

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

PaxosNode_lastExecutedSlot = (PaxosNode_lastExecutedSlot + 1);



}
else
{

return;

return;



}

if(((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots))
{
PaxosNode_lastExecutedSlot = (PaxosNode_lastExecutedSlot + 1);

}
else
{
return;

}



}


}
fun PaxosNode_Init_entry52(PaxosNode_Init_entry52_payload: (int))
{
var _tmp502: (int, machine);
var _tmp503: (machine, int);
var _tmp504: machine;


PaxosNode_myRank = PaxosNode_Init_entry52_payload.0;

_tmp502 = (PaxosNode_myRank, this);

PaxosNode_currentLeader = _tmp502;

PaxosNode_roundNum = 0;

PaxosNode_maxRound = 0;

_tmp503 = (this, 10);

_tmp504 = new Timer(_tmp503);

PaxosNode_timer = _tmp504;

PaxosNode_lastExecutedSlot = ~(1);

PaxosNode_nextSlotForProposer = 0;


}
fun PaxosNode_Init_exit0_rand_1319925286()
{


;


}
fun PaxosNode_PerformOperation_entry0_rand_1457394909()
{


;


}
fun PaxosNode_PerformOperation_exit0_rand_547486369()
{


;


}
fun PaxosNode_ProposeValuePhase1_entry190()
{
var _tmp505: (int, int);
var _tmp506: ((int, int), int);
var _tmp507: (int, int);
var _tmp508: (machine, int, (int, int));


PaxosNode_countAgree = 0;

PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);

_tmp505 = (~(1), ~(1));

_tmp506 = (_tmp505, ~(1));

PaxosNode_receivedAgree = _tmp506;

_tmp507 = (PaxosNode_nextProposal.0, PaxosNode_myRank);

_tmp508 = (this, PaxosNode_nextSlotForProposer, _tmp507);

PaxosNode_BroadCastAcceptors(prepare, _tmp508);

;

send PaxosNode_timer, startTimer;


}
fun PaxosNode_ProposeValuePhase1_exit0_rand_527568717()
{


;


}
fun PaxosNode_ProposeValuePhase2_entry265()
{
var _tmp509: (machine, int, (int, int), int);


PaxosNode_countAccept = 0;

PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();

;

;

_tmp509 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);

PaxosNode_BroadCastAcceptors(accept, _tmp509);

send PaxosNode_timer, startTimer;


}
fun PaxosNode_ProposeValuePhase2_exit0_rand_1617799765()
{


;


}
fun PaxosNode_RunLearner_entry310(PaxosNode_RunLearner_entry310_receivedMess_1: (int, (int, int), int))
{
var _tmp510: ((int, int), int);
var _tmp511: bool;


_tmp510 = (PaxosNode_RunLearner_entry310_receivedMess_1.1, PaxosNode_RunLearner_entry310_receivedMess_1.2);

PaxosNode_learnerSlots[PaxosNode_RunLearner_entry310_receivedMess_1.0] = _tmp510;

PaxosNode_RunReplicatedMachine();

_tmp511 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry310_receivedMess_1.2);

if((PaxosNode_currCommitOperation && _tmp511))
{

pop;

pop;



}
else
{

PaxosNode_proposeVal = PaxosNode_commitValue;

raise goPropose;

PaxosNode_proposeVal = PaxosNode_commitValue;

raise goPropose;



}


}
fun PaxosNode_RunLearner_exit0_rand_2002016373()
{


;


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
var _tmp512: bool;
var _tmp513: bool;


_tmp512 = (PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.0 == PaxosNode_nextSlotForProposer);

if(_tmp512)
{

PaxosNode_countAgree = (PaxosNode_countAgree + 1);

PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_receivedAgree.0, PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1);

if(PaxosNode_returnVal)
{

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1;

PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.2;

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1;

PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.2;



}
else
{

;

;



}

_tmp513 = (PaxosNode_countAgree == PaxosNode_majority);

if(_tmp513)
{

raise success;

raise success;



}
else
{

;

;



}

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

if((PaxosNode_countAgree == PaxosNode_majority))
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

;



}


}
fun PaxosNode_ProposeValuePhase2_do_accepted276(PaxosNode_ProposeValuePhase2_do_accepted276_payload: (int, (int, int), int))
{


PaxosNode_CountAccepted(PaxosNode_ProposeValuePhase2_do_accepted276_payload);


}
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_101051740()
{


;


}
fun PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214(PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0;

PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0;



}
else
{

;

;



}

send PaxosNode_timer, cancelTimer;


}
fun PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221()
{


send PaxosNode_timer, cancelTimer;


}
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1470270259()
{


;


}
fun PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279(PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0;

PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0;



}
else
{

;

;



}

send PaxosNode_timer, cancelTimer;


}
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_295075434()
{


;


}start  state PaxosNode_Init
{entry (payload: (int)) {
PaxosNode_Init_entry52(payload);
}
exit  {
PaxosNode_Init_exit0_rand_1319925286();
}
}
 state PaxosNode_PerformOperation
{entry  {
PaxosNode_PerformOperation_entry0_rand_1457394909();
}
exit  {
PaxosNode_PerformOperation_exit0_rand_547486369();
}
}
 state PaxosNode_ProposeValuePhase1
{entry  {
PaxosNode_ProposeValuePhase1_entry190();
}
exit  {
PaxosNode_ProposeValuePhase1_exit0_rand_527568717();
}
}
 state PaxosNode_ProposeValuePhase2
{entry  {
PaxosNode_ProposeValuePhase2_entry265();
}
exit  {
PaxosNode_ProposeValuePhase2_exit0_rand_1617799765();
}
}
 state PaxosNode_RunLearner
{entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry310(payload);
}
exit  {
PaxosNode_RunLearner_exit0_rand_2002016373();
}
}
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
fun LeaderElection_Init_exit0_rand_1786829556()
{


;


}
fun LeaderElection_SendLeader_entry456()
{


LeaderElection_currentLeader = LeaderElection_GetNewLeader();

assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);

send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;


}
fun LeaderElection_SendLeader_exit0_rand_1327534852()
{


;


}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1768361243()
{


;


}start  state LeaderElection_Init
{entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry444(payload);
}
exit  {
LeaderElection_Init_exit0_rand_1786829556();
}
}
 state LeaderElection_SendLeader
{entry  {
LeaderElection_SendLeader_entry456();
}
exit  {
LeaderElection_SendLeader_exit0_rand_1327534852();
}
}
}

model Timer
{
var Timer_target: machine;
var Timer_timeoutvalue: int;

fun Timer_Init_entry486(Timer_Init_entry486_payload: (machine, int))
{


Timer_target = Timer_Init_entry486_payload.0;

Timer_timeoutvalue = Timer_Init_entry486_payload.1;

raise local;


}
fun Timer_Init_exit0_rand_857019158()
{


;


}
fun Timer_Loop_entry0_rand_2095039245()
{


;


}
fun Timer_Loop_exit0_rand_211078127()
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

raise local;



}
else
{

;

;



}


}
fun Timer_TimerStarted_exit0_rand_1313678815()
{


;


}
fun Timer_Init_on_local_goto_Timer_Loop0_rand_2009165436()
{


;


}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_2046797127()
{


;


}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_327026354()
{


;


}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_1644145839()
{


;


}start  state Timer_Init
{entry (payload: (machine, int)) {
Timer_Init_entry486(payload);
}
exit  {
Timer_Init_exit0_rand_857019158();
}
}
 state Timer_Loop
{entry  {
Timer_Loop_entry0_rand_2095039245();
}
exit  {
Timer_Loop_exit0_rand_211078127();
}
}
 state Timer_TimerStarted
{entry  {
Timer_TimerStarted_entry501();
}
exit  {
Timer_TimerStarted_exit0_rand_1313678815();
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

send GodMachine_paxosnodes[GodMachine_iter], allNodes, (GodMachine_paxosnodes,);

GodMachine_iter = (GodMachine_iter + 1);



}

new Client(GodMachine_paxosnodes);


}
fun GodMachine_Init_exit0_rand_45929401()
{


;


}start  state GodMachine_Init
{entry  {
GodMachine_Init_entry519();
}
exit  {
GodMachine_Init_exit0_rand_45929401();
}
}
}

model Client
{
var Client_servers: seq[machine];

fun Client_Init_entry542(Client_Init_entry542_payload: seq[machine])
{


Client_servers = Client_Init_entry542_payload;

raise local;


}
fun Client_Init_exit0_rand_569920875()
{


;


}
fun Client_PumpRequestOne_entry0_rand_1748197976()
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

send Client_servers[0], update, (0, 1);



}
else
{

_tmp529 = Client_servers[(sizeof(Client_servers) - 1)];

_tmp530 = (0, 1);

send _tmp529, update, _tmp530;

send Client_servers[(sizeof(Client_servers) - 1)], update, (0, 1);



}

raise response;


}
fun Client_PumpRequestOne_exit0_rand_351206804()
{


;


}
fun Client_PumpRequestTwo_entry0_rand_1395211460()
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

send Client_servers[0], update, (0, 2);



}
else
{

_tmp534 = Client_servers[(sizeof(Client_servers) - 1)];

_tmp535 = (0, 2);

send _tmp534, update, _tmp535;

send Client_servers[(sizeof(Client_servers) - 1)], update, (0, 2);



}

raise response;


}
fun Client_PumpRequestTwo_exit0_rand_485799888()
{


;


}
fun Client_Done_entry0_rand_309307343()
{


;


}
fun Client_Done_exit0_rand_323811481()
{


;


}
fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_520255109()
{


;


}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_2026714794()
{


;


}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_842647295()
{


;


}start  state Client_Init
{entry (payload: seq[machine]) {
Client_Init_entry542(payload);
}
exit  {
Client_Init_exit0_rand_569920875();
}
}
 state Client_PumpRequestOne
{entry  {
Client_PumpRequestOne_entry0_rand_1748197976();
}
exit  {
Client_PumpRequestOne_exit0_rand_351206804();
}
}
 state Client_PumpRequestTwo
{entry  {
Client_PumpRequestTwo_entry0_rand_1395211460();
}
exit  {
Client_PumpRequestTwo_exit0_rand_485799888();
}
}
 state Client_Done
{entry  {
Client_Done_entry0_rand_309307343();
}
exit  {
Client_Done_exit0_rand_323811481();
}
}
}

