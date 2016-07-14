event halt;
event null;
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
var _tmp47: bool;
var _tmp48: bool;


MachOS_INT = MachOS_foo_1_payload.0;

_tmp47 = (MachOS_INT == 1);

assert _tmp47;

MachOS_BOOL = MachOS_foo_1_payload.1;

_tmp48 = (MachOS_BOOL == true);

assert _tmp48;


}
fun MachOS_foo_2(MachOS_foo_2_payload: (int, bool))
{
var _tmp49: bool;
var _tmp50: bool;


MachOS_INT = MachOS_foo_2_payload.0;

_tmp49 = (MachOS_INT == 0);

assert _tmp49;

MachOS_BOOL = MachOS_foo_2_payload.1;

_tmp50 = (MachOS_BOOL == false);

assert _tmp50;


}
fun MachOS_foo_3(MachOS_foo_3_payload: seq[int])
{
var _tmp51: int;


_tmp51 = MachOS_foo_3_payload[1];

MachOS_INT = _tmp51;


}
fun MachOS_Init_entry34()
{
var _tmp52: (int, bool);
var _tmp53: (int, bool);
var _tmp54: (map[int, int], seq[bool]);


MachOS_m[0] = 1;

MachOS_m[1] = 2;

MachOS_s += (0, true);

MachOS_s += (1, false);

MachOS_s += (2, true);

_tmp52 = (1, true);

send this, myTuple, _tmp52;

_tmp53 = (0, false);

send this, myNmTuple, _tmp53;

_tmp54 = (MachOS_m, MachOS_s);

send this, myMapSeq, _tmp54;


}
fun MachOS_Init_exit0_rand_1433846437()
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
var _tmp55: int;
var _tmp56: bool;
var _tmp57: bool;
var _tmp58: bool;


_tmp55 = MachOS_Init_do_myMapSeq49_payload.0[0];

MachOS_INT = _tmp55;

_tmp56 = (MachOS_INT == 1);

assert _tmp56;

_tmp57 = MachOS_Init_do_myMapSeq49_payload.1[2];

MachOS_BOOL = _tmp57;

_tmp58 = (MachOS_BOOL == true);

assert _tmp58;


}
fun MachOS_Init_do_halt0_rand_1592294251()
{


;


}start  state MachOS_Init
{entry  {
MachOS_Init_entry34();
}
exit  {
MachOS_Init_exit0_rand_1433846437();
}
}
}

