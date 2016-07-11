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
var _tmp1054: bool;
var _tmp1055: (seq[machine], machine, int);
var _tmp1056: machine;


PaxosNode_acceptors = PaxosNode_UpdateAcceptors_payload.0;
;
PaxosNode_majority = ((sizeof(PaxosNode_acceptors) / 2) + 1);
;
_tmp1054 = (PaxosNode_majority == 2);
;
assert _tmp1054;
;
_tmp1055 = (PaxosNode_acceptors, this, PaxosNode_myRank);
;
_tmp1056 = new LeaderElection(_tmp1055);
;
PaxosNode_leaderElectionService = _tmp1056;
;
raise local;


}
fun PaxosNode_CheckIfLeader(PaxosNode_CheckIfLeader_payload: (int, int))
{
var _tmp1057: bool;


_tmp1057 = (PaxosNode_currentLeader.0 == PaxosNode_myRank);
;
if(_tmp1057)
{

PaxosNode_commitValue = PaxosNode_CheckIfLeader_payload.1;
;
PaxosNode_proposeVal = PaxosNode_commitValue;
;
raise goPropose;
;
PaxosNode_commitValue = PaxosNode_CheckIfLeader_payload.1;
;
PaxosNode_proposeVal = PaxosNode_commitValue;
;
raise goPropose;



}
else
{

send PaxosNode_currentLeader.1, update, PaxosNode_CheckIfLeader_payload;
;
send PaxosNode_currentLeader.1, update, PaxosNode_CheckIfLeader_payload;



}


}
fun PaxosNode_preparefun(PaxosNode_preparefun_receivedMess_2: (machine, int, (int, int)))
{
var _tmp1058: bool;
var _tmp1059: (int, int);
var _tmp1060: (int, (int, int), int);
var _tmp1061: ((int, int), int);
var _tmp1062: ((int, int), int);
var _tmp1063: ((int, int), int);
var _tmp1064: (int, (int, int));
var _tmp1065: ((int, int), int);
var _tmp1066: ((int, int), int);
var _tmp1067: (int, (int, int), int);
var _tmp1068: ((int, int), int);


_tmp1058 = (PaxosNode_preparefun_receivedMess_2.1 in PaxosNode_acceptorSlots);
;
if(!(_tmp1058))
{

_tmp1059 = (~(1), ~(1));
;
_tmp1060 = (PaxosNode_preparefun_receivedMess_2.1, _tmp1059, ~(1));
;
send PaxosNode_preparefun_receivedMess_2.0, agree, _tmp1060;
;
_tmp1061 = (PaxosNode_preparefun_receivedMess_2.2, ~(1));
;
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = _tmp1061;
;
return;
;
send PaxosNode_preparefun_receivedMess_2.0, agree, (PaxosNode_preparefun_receivedMess_2.1, (~(1), ~(1)), ~(1));
;
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = (PaxosNode_preparefun_receivedMess_2.2, ~(1));
;
return;



}
else
{

;
;
;



}
;
_tmp1062 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
;
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_preparefun_receivedMess_2.2, _tmp1062.0);
;
if(PaxosNode_returnVal)
{

_tmp1063 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
;
_tmp1064 = (PaxosNode_preparefun_receivedMess_2.1, _tmp1063.0);
;
send PaxosNode_preparefun_receivedMess_2.0, reject, _tmp1064;
;
send PaxosNode_preparefun_receivedMess_2.0, reject, (PaxosNode_preparefun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1].0);



}
else
{

_tmp1065 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
;
_tmp1066 = PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1];
;
_tmp1067 = (PaxosNode_preparefun_receivedMess_2.1, _tmp1065.0, _tmp1066.1);
;
send PaxosNode_preparefun_receivedMess_2.0, agree, _tmp1067;
;
_tmp1068 = (PaxosNode_preparefun_receivedMess_2.2, ~(1));
;
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = _tmp1068;
;
send PaxosNode_preparefun_receivedMess_2.0, agree, (PaxosNode_preparefun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1].0, PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1].1);
;
PaxosNode_acceptorSlots[PaxosNode_preparefun_receivedMess_2.1] = (PaxosNode_preparefun_receivedMess_2.2, ~(1));



}


}
fun PaxosNode_acceptfun(PaxosNode_acceptfun_receivedMess_2: (machine, int, (int, int), int))
{
var _tmp1069: bool;
var _tmp1070: ((int, int), int);
var _tmp1071: ((int, int), int);
var _tmp1072: (int, (int, int));
var _tmp1073: ((int, int), int);
var _tmp1074: (int, (int, int), int);


_tmp1069 = (PaxosNode_acceptfun_receivedMess_2.1 in PaxosNode_acceptorSlots);
;
if(_tmp1069)
{

_tmp1070 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
;
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, _tmp1070.0);
;
if(!(PaxosNode_returnVal))
{

_tmp1071 = PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1];
;
_tmp1072 = (PaxosNode_acceptfun_receivedMess_2.1, _tmp1071.0);
;
send PaxosNode_acceptfun_receivedMess_2.0, reject, _tmp1072;
;
send PaxosNode_acceptfun_receivedMess_2.0, reject, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1].0);



}
else
{

_tmp1073 = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
;
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = _tmp1073;
;
_tmp1074 = (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
;
send PaxosNode_acceptfun_receivedMess_2.0, accepted, _tmp1074;
;
PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
;
send PaxosNode_acceptfun_receivedMess_2.0, accepted, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);



}
;
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1].0);
;
if(!(PaxosNode_returnVal))
{
send PaxosNode_acceptfun_receivedMess_2.0, reject, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1].0);

}
else
{

PaxosNode_acceptorSlots[PaxosNode_acceptfun_receivedMess_2.1] = (PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);
;
send PaxosNode_acceptfun_receivedMess_2.0, accepted, (PaxosNode_acceptfun_receivedMess_2.1, PaxosNode_acceptfun_receivedMess_2.2, PaxosNode_acceptfun_receivedMess_2.3);



}



}
else
{

;
;
;



}


}
fun PaxosNode_GetNextProposal(PaxosNode_GetNextProposal_maxRound: int): (int, int)
{
var _tmp1075: (int, int);


_tmp1075 = ((PaxosNode_GetNextProposal_maxRound + 1), PaxosNode_myRank);
;
return (_tmp1075);


}
fun PaxosNode_equal(PaxosNode_equal_p1: (int, int), PaxosNode_equal_p2: (int, int)): bool
{
var _tmp1076: bool;
var _tmp1077: bool;


_tmp1076 = (PaxosNode_equal_p1.0 == PaxosNode_equal_p2.0);
;
_tmp1077 = (PaxosNode_equal_p1.1 == PaxosNode_equal_p2.1);
;
if((_tmp1076 && _tmp1077))
{

return (true);
;
return (true);



}
else
{

return (false);
;
return (false);



}


}
fun PaxosNode_lessThan(PaxosNode_lessThan_p1: (int, int), PaxosNode_lessThan_p2: (int, int)): bool
{
var _tmp1078: bool;


if((PaxosNode_lessThan_p1.0 < PaxosNode_lessThan_p2.0))
{

return (true);
;
return (true);



}
else
{

_tmp1078 = (PaxosNode_lessThan_p1.0 == PaxosNode_lessThan_p2.0);
;
if(_tmp1078)
{

if((PaxosNode_lessThan_p1.1 < PaxosNode_lessThan_p2.1))
{

return (true);
;
return (true);



}
else
{

return (false);
;
return (false);



}
;
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
;
return (false);



}
;
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
var _tmp1079: machine;


PaxosNode_iter = 0;
;
while((PaxosNode_iter < sizeof(PaxosNode_acceptors)))
{

_tmp1079 = PaxosNode_acceptors[PaxosNode_iter];
;
send _tmp1079, PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
;
PaxosNode_iter = (PaxosNode_iter + 1);
;
send PaxosNode_acceptors[PaxosNode_iter], PaxosNode_BroadCastAcceptors_mess, PaxosNode_BroadCastAcceptors_pay;
;
PaxosNode_iter = (PaxosNode_iter + 1);



}


}
fun PaxosNode_CountAccepted(PaxosNode_CountAccepted_receivedMess_1: (int, (int, int), int))
{
var _tmp1080: bool;
var _tmp1081: bool;


_tmp1080 = (PaxosNode_CountAccepted_receivedMess_1.0 == PaxosNode_nextSlotForProposer);
;
if(_tmp1080)
{

PaxosNode_returnVal = PaxosNode_equal(PaxosNode_CountAccepted_receivedMess_1.1, PaxosNode_nextProposal);
;
if(PaxosNode_returnVal)
{

PaxosNode_countAccept = (PaxosNode_countAccept + 1);
;
PaxosNode_countAccept = (PaxosNode_countAccept + 1);



}
else
{

;
;
;



}
;
_tmp1081 = (PaxosNode_countAccept == PaxosNode_majority);
;
if(_tmp1081)
{

;
;
send PaxosNode_timer, cancelTimer;
;
;
;
PaxosNode_nextSlotForProposer = (PaxosNode_nextSlotForProposer + 1);
;
raise chosen, PaxosNode_CountAccepted_receivedMess_1;
;
;
;
send PaxosNode_timer, cancelTimer;
;
;
;
PaxosNode_nextSlotForProposer = (PaxosNode_nextSlotForProposer + 1);
;
raise chosen, PaxosNode_CountAccepted_receivedMess_1;



}
else
{

;
;
;



}
;
PaxosNode_returnVal = PaxosNode_equal(PaxosNode_CountAccepted_receivedMess_1.1, PaxosNode_nextProposal);
;
if(PaxosNode_returnVal)
{
PaxosNode_countAccept = (PaxosNode_countAccept + 1);

}
else
{
;

}
;
if((PaxosNode_countAccept == PaxosNode_majority))
{

;
;
send PaxosNode_timer, cancelTimer;
;
;
;
PaxosNode_nextSlotForProposer = (PaxosNode_nextSlotForProposer + 1);
;
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
;



}


}
fun PaxosNode_getHighestProposedValue(): int
{
var _tmp1082: bool;


_tmp1082 = (PaxosNode_receivedAgree.1 == ~(1));
;
if(!(_tmp1082))
{

PaxosNode_currCommitOperation = false;
;
return (PaxosNode_receivedAgree.1);
;
PaxosNode_currCommitOperation = false;
;
return (PaxosNode_receivedAgree.1);



}
else
{

PaxosNode_currCommitOperation = true;
;
return (PaxosNode_commitValue);
;
PaxosNode_currCommitOperation = true;
;
return (PaxosNode_commitValue);



}


}
fun PaxosNode_RunReplicatedMachine()
{
var _tmp1083: bool;


while(true)
{

_tmp1083 = ((PaxosNode_lastExecutedSlot + 1) in PaxosNode_learnerSlots);
;
if(_tmp1083)
{

PaxosNode_lastExecutedSlot = (PaxosNode_lastExecutedSlot + 1);
;
PaxosNode_lastExecutedSlot = (PaxosNode_lastExecutedSlot + 1);



}
else
{

return;
;
return;



}
;
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
var _tmp1084: (int, machine);
var _tmp1085: (machine, int);
var _tmp1086: machine;


PaxosNode_myRank = PaxosNode_Init_entry52_payload.0;
;
_tmp1084 = (PaxosNode_myRank, this);
;
PaxosNode_currentLeader = _tmp1084;
;
PaxosNode_roundNum = 0;
;
PaxosNode_maxRound = 0;
;
_tmp1085 = (this, 10);
;
_tmp1086 = new Timer(_tmp1085);
;
PaxosNode_timer = _tmp1086;
;
PaxosNode_lastExecutedSlot = ~(1);
;
PaxosNode_nextSlotForProposer = 0;


}
fun PaxosNode_Init_exit0_rand_1888543761()
{


;


}
fun PaxosNode_PerformOperation_entry0_rand_860409788(PaxosNode_PerformOperation_entry0_rand_860409788__payload_skip: any)
{


;


}
fun PaxosNode_PerformOperation_exit0_rand_1282072544()
{


;


}
fun PaxosNode_ProposeValuePhase1_entry190(PaxosNode_ProposeValuePhase1_entry190__payload_0: any)
{
var _tmp1087: (int, int);
var _tmp1088: ((int, int), int);
var _tmp1089: (int, int);
var _tmp1090: (machine, int, (int, int));


PaxosNode_countAgree = 0;
;
PaxosNode_nextProposal = PaxosNode_GetNextProposal(PaxosNode_maxRound);
;
_tmp1087 = (~(1), ~(1));
;
_tmp1088 = (_tmp1087, ~(1));
;
PaxosNode_receivedAgree = _tmp1088;
;
_tmp1089 = (PaxosNode_nextProposal.0, PaxosNode_myRank);
;
_tmp1090 = (this, PaxosNode_nextSlotForProposer, _tmp1089);
;
PaxosNode_BroadCastAcceptors(prepare, _tmp1090);
;
;
;
send PaxosNode_timer, startTimer;


}
fun PaxosNode_ProposeValuePhase1_exit0_rand_943536683()
{


;


}
fun PaxosNode_ProposeValuePhase2_entry265(PaxosNode_ProposeValuePhase2_entry265__payload_2: any)
{
var _tmp1091: (machine, int, (int, int), int);


PaxosNode_countAccept = 0;
;
PaxosNode_proposeVal = PaxosNode_getHighestProposedValue();
;
;
;
;
;
_tmp1091 = (this, PaxosNode_nextSlotForProposer, PaxosNode_nextProposal, PaxosNode_proposeVal);
;
PaxosNode_BroadCastAcceptors(accept, _tmp1091);
;
send PaxosNode_timer, startTimer;


}
fun PaxosNode_ProposeValuePhase2_exit0_rand_1581195646()
{


;


}
fun PaxosNode_RunLearner_entry310(PaxosNode_RunLearner_entry310_receivedMess_1: (int, (int, int), int))
{
var _tmp1092: ((int, int), int);
var _tmp1093: bool;


_tmp1092 = (PaxosNode_RunLearner_entry310_receivedMess_1.1, PaxosNode_RunLearner_entry310_receivedMess_1.2);
;
PaxosNode_learnerSlots[PaxosNode_RunLearner_entry310_receivedMess_1.0] = _tmp1092;
;
PaxosNode_RunReplicatedMachine();
;
_tmp1093 = (PaxosNode_commitValue == PaxosNode_RunLearner_entry310_receivedMess_1.2);
;
if((PaxosNode_currCommitOperation && _tmp1093))
{

pop;
;
pop;



}
else
{

PaxosNode_proposeVal = PaxosNode_commitValue;
;
raise goPropose;
;
PaxosNode_proposeVal = PaxosNode_commitValue;
;
raise goPropose;



}


}
fun PaxosNode_RunLearner_exit0_rand_1831538395()
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
var _tmp1094: bool;
var _tmp1095: bool;


_tmp1094 = (PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.0 == PaxosNode_nextSlotForProposer);
;
if(_tmp1094)
{

PaxosNode_countAgree = (PaxosNode_countAgree + 1);
;
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_receivedAgree.0, PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1);
;
if(PaxosNode_returnVal)
{

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1;
;
PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.2;
;
PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1;
;
PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.2;



}
else
{

;
;
;



}
;
_tmp1095 = (PaxosNode_countAgree == PaxosNode_majority);
;
if(_tmp1095)
{

raise success;
;
raise success;



}
else
{

;
;
;



}
;
PaxosNode_countAgree = (PaxosNode_countAgree + 1);
;
PaxosNode_returnVal = PaxosNode_lessThan(PaxosNode_receivedAgree.0, PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1);
;
if(PaxosNode_returnVal)
{

PaxosNode_receivedAgree.0 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.1;
;
PaxosNode_receivedAgree.1 = PaxosNode_ProposeValuePhase1_do_agree199_receivedMess.2;



}
else
{
;

}
;
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
;



}


}
fun PaxosNode_ProposeValuePhase2_do_accepted276(PaxosNode_ProposeValuePhase2_do_accepted276_payload: (int, (int, int), int))
{


PaxosNode_CountAccepted(PaxosNode_ProposeValuePhase2_do_accepted276_payload);


}
fun PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_154322087(PaxosNode_Init_on_local_goto_PaxosNode_PerformOperation0_rand_154322087__payload_skip: any)
{


;


}
fun PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214(PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0;
;
PaxosNode_maxRound = PaxosNode_ProposeValuePhase1_on_reject_goto_PaxosNode_ProposeValuePhase1214_payload.1.0;



}
else
{

;
;
;



}
;
send PaxosNode_timer, cancelTimer;


}
fun PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221(PaxosNode_ProposeValuePhase1_on_success_goto_PaxosNode_ProposeValuePhase2221__payload_1: any)
{


send PaxosNode_timer, cancelTimer;


}
fun PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1512885312(PaxosNode_ProposeValuePhase1_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_1512885312__payload_skip: any)
{


;


}
fun PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279(PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload: (int, (int, int)))
{


if((PaxosNode_nextProposal.0 <= PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0))
{

PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0;
;
PaxosNode_maxRound = PaxosNode_ProposeValuePhase2_on_reject_goto_PaxosNode_ProposeValuePhase1279_payload.1.0;



}
else
{

;
;
;



}
;
send PaxosNode_timer, cancelTimer;


}
fun PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_987215339(PaxosNode_ProposeValuePhase2_on_timeout_goto_PaxosNode_ProposeValuePhase10_rand_987215339__payload_skip: any)
{


;


}start  state PaxosNode_Init
{entry (payload: (int)) {
PaxosNode_Init_entry52(payload);
}
exit  {
PaxosNode_Init_exit0_rand_1888543761();
}
}
 state PaxosNode_PerformOperation
{entry (payload: any) {
PaxosNode_PerformOperation_entry0_rand_860409788(payload);
}
exit  {
PaxosNode_PerformOperation_exit0_rand_1282072544();
}
}
 state PaxosNode_ProposeValuePhase1
{entry (payload: any) {
PaxosNode_ProposeValuePhase1_entry190(payload);
}
exit  {
PaxosNode_ProposeValuePhase1_exit0_rand_943536683();
}
}
 state PaxosNode_ProposeValuePhase2
{entry (payload: any) {
PaxosNode_ProposeValuePhase2_entry265(payload);
}
exit  {
PaxosNode_ProposeValuePhase2_exit0_rand_1581195646();
}
}
 state PaxosNode_RunLearner
{entry (payload: (int, (int, int), int)) {
PaxosNode_RunLearner_entry310(payload);
}
exit  {
PaxosNode_RunLearner_exit0_rand_1831538395();
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
var _tmp1096: machine;
var _tmp1097: (int, machine);


_tmp1096 = LeaderElection_servers[0];
;
_tmp1097 = (1, _tmp1096);
;
return (_tmp1097);


}
fun LeaderElection_Init_entry444(LeaderElection_Init_entry444_payload: (seq[machine], machine, int))
{
var _tmp1098: (int, machine);


LeaderElection_servers = LeaderElection_Init_entry444_payload.0;
;
LeaderElection_parentServer = LeaderElection_Init_entry444_payload.1;
;
LeaderElection_myRank = LeaderElection_Init_entry444_payload.2;
;
_tmp1098 = (LeaderElection_myRank, this);
;
LeaderElection_currentLeader = _tmp1098;
;
raise local;


}
fun LeaderElection_Init_exit0_rand_2074067504()
{


;


}
fun LeaderElection_SendLeader_entry456(LeaderElection_SendLeader_entry456__payload_6: any)
{


LeaderElection_currentLeader = LeaderElection_GetNewLeader();
;
assert (LeaderElection_currentLeader.0 <= LeaderElection_myRank);
;
send LeaderElection_parentServer, newLeader, LeaderElection_currentLeader;


}
fun LeaderElection_SendLeader_exit0_rand_1798389970()
{


;


}
fun LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1288191266(LeaderElection_Init_on_local_goto_LeaderElection_SendLeader0_rand_1288191266__payload_skip: any)
{


;


}start  state LeaderElection_Init
{entry (payload: (seq[machine], machine, int)) {
LeaderElection_Init_entry444(payload);
}
exit  {
LeaderElection_Init_exit0_rand_2074067504();
}
}
 state LeaderElection_SendLeader
{entry (payload: any) {
LeaderElection_SendLeader_entry456(payload);
}
exit  {
LeaderElection_SendLeader_exit0_rand_1798389970();
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
;
Timer_timeoutvalue = Timer_Init_entry486_payload.1;
;
raise local;


}
fun Timer_Init_exit0_rand_1636763499()
{


;


}
fun Timer_Loop_entry0_rand_665953883(Timer_Loop_entry0_rand_665953883__payload_skip: any)
{


;


}
fun Timer_Loop_exit0_rand_354888539()
{


;


}
fun Timer_TimerStarted_entry501(Timer_TimerStarted_entry501__payload_7: any)
{
var _tmp1099: bool;


_tmp1099 = $;
;
if(_tmp1099)
{

raise local;
;
raise local;



}
else
{

;
;
;



}


}
fun Timer_TimerStarted_exit0_rand_1046664400()
{


;


}
fun Timer_Init_on_local_goto_Timer_Loop0_rand_841601176(Timer_Init_on_local_goto_Timer_Loop0_rand_841601176__payload_skip: any)
{


;


}
fun Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1632181416(Timer_Loop_on_startTimer_goto_Timer_TimerStarted0_rand_1632181416__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_1089282891(Timer_TimerStarted_on_local_goto_Timer_Loop0_rand_1089282891__payload_skip: any)
{


;


}
fun Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_208024838(Timer_TimerStarted_on_cancelTimer_goto_Timer_Loop0_rand_208024838__payload_skip: any)
{


;


}start  state Timer_Init
{entry (payload: (machine, int)) {
Timer_Init_entry486(payload);
}
exit  {
Timer_Init_exit0_rand_1636763499();
}
}
 state Timer_Loop
{entry (payload: any) {
Timer_Loop_entry0_rand_665953883(payload);
}
exit  {
Timer_Loop_exit0_rand_354888539();
}
}
 state Timer_TimerStarted
{entry (payload: any) {
Timer_TimerStarted_entry501(payload);
}
exit  {
Timer_TimerStarted_exit0_rand_1046664400();
}
}
}

main machine GodMachine
{
var GodMachine_paxosnodes: seq[machine];
var GodMachine_temp: machine;
var GodMachine_iter: int;

fun GodMachine_Init_entry519(GodMachine_Init_entry519__payload_8: any)
{
var _tmp1100: (int);
var _tmp1101: machine;
var _tmp1102: (int);
var _tmp1103: machine;
var _tmp1104: (int);
var _tmp1105: machine;
var _tmp1106: machine;
var _tmp1107: (seq[machine]);


_tmp1100 = (3,);
;
_tmp1101 = new PaxosNode(_tmp1100);
;
GodMachine_temp = _tmp1101;
;
GodMachine_paxosnodes += (0, GodMachine_temp);
;
_tmp1102 = (2,);
;
_tmp1103 = new PaxosNode(_tmp1102);
;
GodMachine_temp = _tmp1103;
;
GodMachine_paxosnodes += (0, GodMachine_temp);
;
_tmp1104 = (1,);
;
_tmp1105 = new PaxosNode(_tmp1104);
;
GodMachine_temp = _tmp1105;
;
GodMachine_paxosnodes += (0, GodMachine_temp);
;
GodMachine_iter = 0;
;
while((GodMachine_iter < sizeof(GodMachine_paxosnodes)))
{

_tmp1106 = GodMachine_paxosnodes[GodMachine_iter];
;
_tmp1107 = (GodMachine_paxosnodes,);
;
send _tmp1106, allNodes, _tmp1107;
;
GodMachine_iter = (GodMachine_iter + 1);
;
send GodMachine_paxosnodes[GodMachine_iter], allNodes, (GodMachine_paxosnodes,);
;
GodMachine_iter = (GodMachine_iter + 1);



}
;
new Client(GodMachine_paxosnodes);


}
fun GodMachine_Init_exit0_rand_1578908937()
{


;


}start  state GodMachine_Init
{entry (payload: any) {
GodMachine_Init_entry519(payload);
}
exit  {
GodMachine_Init_exit0_rand_1578908937();
}
}
}

model Client
{
var Client_servers: seq[machine];

fun Client_Init_entry542(Client_Init_entry542_payload: seq[machine])
{


Client_servers = Client_Init_entry542_payload;
;
raise local;


}
fun Client_Init_exit0_rand_1314092298()
{


;


}
fun Client_PumpRequestOne_entry0_rand_64707019(Client_PumpRequestOne_entry0_rand_64707019__payload_9: any)
{
var _tmp1108: bool;
var _tmp1109: machine;
var _tmp1110: (int, int);
var _tmp1111: machine;
var _tmp1112: (int, int);


;
;
_tmp1108 = $;
;
if(_tmp1108)
{

_tmp1109 = Client_servers[0];
;
_tmp1110 = (0, 1);
;
send _tmp1109, update, _tmp1110;
;
send Client_servers[0], update, (0, 1);



}
else
{

_tmp1111 = Client_servers[(sizeof(Client_servers) - 1)];
;
_tmp1112 = (0, 1);
;
send _tmp1111, update, _tmp1112;
;
send Client_servers[(sizeof(Client_servers) - 1)], update, (0, 1);



}
;
raise response;


}
fun Client_PumpRequestOne_exit0_rand_9109244()
{


;


}
fun Client_PumpRequestTwo_entry0_rand_1640224416(Client_PumpRequestTwo_entry0_rand_1640224416__payload_10: any)
{
var _tmp1113: bool;
var _tmp1114: machine;
var _tmp1115: (int, int);
var _tmp1116: machine;
var _tmp1117: (int, int);


;
;
_tmp1113 = $;
;
if(_tmp1113)
{

_tmp1114 = Client_servers[0];
;
_tmp1115 = (0, 2);
;
send _tmp1114, update, _tmp1115;
;
send Client_servers[0], update, (0, 2);



}
else
{

_tmp1116 = Client_servers[(sizeof(Client_servers) - 1)];
;
_tmp1117 = (0, 2);
;
send _tmp1116, update, _tmp1117;
;
send Client_servers[(sizeof(Client_servers) - 1)], update, (0, 2);



}
;
raise response;


}
fun Client_PumpRequestTwo_exit0_rand_1553103096()
{


;


}
fun Client_Done_entry0_rand_2099991429(Client_Done_entry0_rand_2099991429__payload_skip: any)
{


;


}
fun Client_Done_exit0_rand_981145()
{


;


}
fun Client_Init_on_local_goto_Client_PumpRequestOne0_rand_1296486649(Client_Init_on_local_goto_Client_PumpRequestOne0_rand_1296486649__payload_skip: any)
{


;


}
fun Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_735742324(Client_PumpRequestOne_on_response_goto_Client_PumpRequestTwo0_rand_735742324__payload_skip: any)
{


;


}
fun Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_1439374286(Client_PumpRequestTwo_on_response_goto_Client_Done0_rand_1439374286__payload_skip: any)
{


;


}start  state Client_Init
{entry (payload: seq[machine]) {
Client_Init_entry542(payload);
}
exit  {
Client_Init_exit0_rand_1314092298();
}
}
 state Client_PumpRequestOne
{entry (payload: any) {
Client_PumpRequestOne_entry0_rand_64707019(payload);
}
exit  {
Client_PumpRequestOne_exit0_rand_9109244();
}
}
 state Client_PumpRequestTwo
{entry (payload: any) {
Client_PumpRequestTwo_entry0_rand_1640224416(payload);
}
exit  {
Client_PumpRequestTwo_exit0_rand_1553103096();
}
}
 state Client_Done
{entry (payload: any) {
Client_Done_entry0_rand_2099991429(payload);
}
exit  {
Client_Done_exit0_rand_981145();
}
}
}

