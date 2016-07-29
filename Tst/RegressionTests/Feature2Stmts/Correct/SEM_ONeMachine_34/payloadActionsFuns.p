event myTuple: (int, bool);
event myNmTuple: (int, bool);
event mySeq: seq[int];
event myMapSeq: (map[int, int], seq[bool]);

main machine MachOS
{
var MachOS_INT: int;
var MachOS_BOOL: bool;
var MachOS_MACH: machine;
var MachOS_m: map[int, int];
var MachOS_s: seq[bool];

fun MachOS_foo_1(MachOS_foo_1_payload: (int, bool))
{
var Tmp91: bool;
var Tmp92: bool;


;

MachOS_INT = MachOS_foo_1_payload.0;
;

Tmp91 = (MachOS_INT == 1);
assert Tmp91;
;

MachOS_BOOL = MachOS_foo_1_payload.1;
;

Tmp92 = (MachOS_BOOL == true);
assert Tmp92;
}
fun MachOS_foo_2(MachOS_foo_2_payload: (int, bool))
{
var Tmp93: bool;
var Tmp94: bool;


;

MachOS_INT = MachOS_foo_2_payload.0;
;

Tmp93 = (MachOS_INT == 0);
assert Tmp93;
;

MachOS_BOOL = MachOS_foo_2_payload.1;
;

Tmp94 = (MachOS_BOOL == false);
assert Tmp94;
}
fun MachOS_foo_3(MachOS_foo_3_payload: seq[int])
{
var Tmp95: int;


;

Tmp95 = MachOS_foo_3_payload[1];
MachOS_INT = Tmp95;
}
fun MachOS_Init_do_myTuple44(MachOS_Init_do_myTuple44_payload: (int, bool))
{


;

MachOS_foo_1(MachOS_Init_do_myTuple44_payload);
return;
}
fun MachOS_Init_do_myNmTuple45(MachOS_Init_do_myNmTuple45_payload: (int, bool))
{


;

MachOS_foo_2(MachOS_Init_do_myNmTuple45_payload);
return;
}
fun MachOS_Init_do_mySeq46(MachOS_Init_do_mySeq46_payload: seq[int])
{


;

MachOS_foo_3(MachOS_Init_do_mySeq46_payload);
return;
}
fun MachOS_Init_do_myMapSeq49(MachOS_Init_do_myMapSeq49_payload: (map[int, int], seq[bool]))
{
var Tmp96: int;
var Tmp97: bool;
var Tmp98: bool;
var Tmp99: bool;


;

Tmp96 = MachOS_Init_do_myMapSeq49_payload.0[0];
MachOS_INT = Tmp96;
;

Tmp97 = (MachOS_INT == 1);
assert Tmp97;
;

Tmp98 = MachOS_Init_do_myMapSeq49_payload.1[2];
MachOS_BOOL = Tmp98;
;

Tmp99 = (MachOS_BOOL == true);
assert Tmp99;
return;
}
fun MachOS_Init_do_halt0_rand_1490502383(MachOS_Init_do_halt0_rand_1490502383_payload: any)
{


;

;

return;
}
fun MachOS_Init_entry34(MachOS_Init_entry34__payload_0: null)
{
var Tmp100: (int, bool);
var Tmp101: (int, bool);
var Tmp102: (map[int, int], seq[bool]);


;

MachOS_m[0] = 1;
;

MachOS_m[1] = 2;
;

MachOS_s += (0, true);
;

MachOS_s += (1, false);
;

MachOS_s += (2, true);
;

Tmp100 = (1, true);
send this, myTuple, Tmp100;
;

Tmp101 = (0, false);
send this, myNmTuple, Tmp101;
;

Tmp102 = (MachOS_m, MachOS_s);
send this, myMapSeq, Tmp102;
return;
}
fun MachOS_Init_exit0_rand_646941550(MachOS_Init_exit0_rand_646941550__payload_skip: any)
{


;

;

return;
}start 
 state MachOS_Init
{
entry (payload: null) {
MachOS_Init_entry34(payload);
}exit {
MachOS_Init_exit0_rand_646941550(null);
}on myTuple do (payload: (int, bool)) {
MachOS_Init_do_myTuple44(payload);
}
on myNmTuple do (payload: (int, bool)) {
MachOS_Init_do_myNmTuple45(payload);
}
on mySeq do (payload: seq[int]) {
MachOS_Init_do_mySeq46(payload);
}
on myMapSeq do (payload: (map[int, int], seq[bool])) {
MachOS_Init_do_myMapSeq49(payload);
}
on halt do (payload: null) {
MachOS_Init_do_halt0_rand_1490502383(payload);
}}
}

