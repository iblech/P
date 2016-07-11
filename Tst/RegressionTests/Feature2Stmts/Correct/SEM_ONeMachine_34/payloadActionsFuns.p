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
var _tmp72: bool;
var _tmp73: bool;


MachOS_INT = MachOS_foo_1_payload.0;
;
_tmp72 = (MachOS_INT == 1);
;
assert _tmp72;
;
MachOS_BOOL = MachOS_foo_1_payload.1;
;
_tmp73 = (MachOS_BOOL == true);
;
assert _tmp73;


}
fun MachOS_foo_2(MachOS_foo_2_payload: (int, bool))
{
var _tmp74: bool;
var _tmp75: bool;


MachOS_INT = MachOS_foo_2_payload.0;
;
_tmp74 = (MachOS_INT == 0);
;
assert _tmp74;
;
MachOS_BOOL = MachOS_foo_2_payload.1;
;
_tmp75 = (MachOS_BOOL == false);
;
assert _tmp75;


}
fun MachOS_foo_3(MachOS_foo_3_payload: seq[int])
{
var _tmp76: int;


_tmp76 = MachOS_foo_3_payload[1];
;
MachOS_INT = _tmp76;


}
fun MachOS_Init_entry34(MachOS_Init_entry34__payload_0: any)
{
var _tmp77: (int, bool);
var _tmp78: (int, bool);
var _tmp79: (map[int, int], seq[bool]);


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
_tmp77 = (1, true);
;
send this, myTuple, _tmp77;
;
_tmp78 = (0, false);
;
send this, myNmTuple, _tmp78;
;
_tmp79 = (MachOS_m, MachOS_s);
;
send this, myMapSeq, _tmp79;


}
fun MachOS_Init_exit0_rand_913627857()
{


;


}
fun MachOS_Init_do_myTuple44(MachOS_Init_do_myTuple44_payload: (int, bool))
{


MachOS_foo_1(MachOS_Init_do_myTuple44_payload);


}
fun MachOS_Init_do_myNmTuple45(MachOS_Init_do_myNmTuple45_payload: (int, bool))
{


MachOS_foo_2(MachOS_Init_do_myNmTuple45_payload);


}
fun MachOS_Init_do_mySeq46(MachOS_Init_do_mySeq46_payload: seq[int])
{


MachOS_foo_3(MachOS_Init_do_mySeq46_payload);


}
fun MachOS_Init_do_myMapSeq49(MachOS_Init_do_myMapSeq49_payload: (map[int, int], seq[bool]))
{
var _tmp80: int;
var _tmp81: bool;
var _tmp82: bool;
var _tmp83: bool;


_tmp80 = MachOS_Init_do_myMapSeq49_payload.0[0];
;
MachOS_INT = _tmp80;
;
_tmp81 = (MachOS_INT == 1);
;
assert _tmp81;
;
_tmp82 = MachOS_Init_do_myMapSeq49_payload.1[2];
;
MachOS_BOOL = _tmp82;
;
_tmp83 = (MachOS_BOOL == true);
;
assert _tmp83;


}
fun MachOS_Init_do_halt0_rand_740761494(MachOS_Init_do_halt0_rand_740761494__payload_1: any)
{


;


}start  state MachOS_Init
{entry (payload: any) {
MachOS_Init_entry34(payload);
}
exit  {
MachOS_Init_exit0_rand_913627857();
}
}
}

