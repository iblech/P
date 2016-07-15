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
var Tmp47: bool;
var Tmp48: bool;


MachOS_INT = MachOS_foo_1_payload.0;
Tmp47 = (MachOS_INT == 1);
assert Tmp47;
MachOS_BOOL = MachOS_foo_1_payload.1;
Tmp48 = (MachOS_BOOL == true);
assert Tmp48;
}
fun MachOS_foo_2(MachOS_foo_2_payload: (int, bool))
{
var Tmp49: bool;
var Tmp50: bool;


MachOS_INT = MachOS_foo_2_payload.0;
Tmp49 = (MachOS_INT == 0);
assert Tmp49;
MachOS_BOOL = MachOS_foo_2_payload.1;
Tmp50 = (MachOS_BOOL == false);
assert Tmp50;
}
fun MachOS_foo_3(MachOS_foo_3_payload: seq[int])
{
var Tmp51: int;


Tmp51 = MachOS_foo_3_payload[1];
MachOS_INT = Tmp51;
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
var Tmp52: int;
var Tmp53: bool;
var Tmp54: bool;
var Tmp55: bool;


Tmp52 = MachOS_Init_do_myMapSeq49_payload.0[0];
MachOS_INT = Tmp52;
Tmp53 = (MachOS_INT == 1);
assert Tmp53;
Tmp54 = MachOS_Init_do_myMapSeq49_payload.1[2];
MachOS_BOOL = Tmp54;
Tmp55 = (MachOS_BOOL == true);
assert Tmp55;
}
fun MachOS_Init_do_halt0_rand_2079909046()
{


;

}
fun MachOS_Init_entry34()
{
var Tmp56: (int, bool);
var Tmp57: (int, bool);
var Tmp58: (map[int, int], seq[bool]);


MachOS_m[0] = 1;
MachOS_m[1] = 2;
MachOS_s += (0, true);
MachOS_s += (1, false);
MachOS_s += (2, true);
Tmp56 = (1, true);
send this, myTuple, Tmp56;
Tmp57 = (0, false);
send this, myNmTuple, Tmp57;
Tmp58 = (MachOS_m, MachOS_s);
send this, myMapSeq, Tmp58;
}
fun MachOS_Init_exit0_rand_1760047983()
{


;

}start 
 state MachOS_Init
{
entry  {
MachOS_Init_entry34();
}
exit  {
MachOS_Init_exit0_rand_1760047983();
}
on myTuple do  (payload: (int, bool)) {
MachOS_Init_do_myTuple44(payload);
}

on myNmTuple do  (payload: (int, bool)) {
MachOS_Init_do_myNmTuple45(payload);
}

on mySeq do  (payload: seq[int]) {
MachOS_Init_do_mySeq46(payload);
}

on myMapSeq do  (payload: (map[int, int], seq[bool])) {
MachOS_Init_do_myMapSeq49(payload);
}

on halt do   {
MachOS_Init_do_halt0_rand_2079909046();
}
}
}

