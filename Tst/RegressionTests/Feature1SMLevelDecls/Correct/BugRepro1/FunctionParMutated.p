event Ping  assert 1: int;
event Success;

main machine PING
{
var PING_x: int;
var PING_y: int;

fun PING_Func1(PING_Func1_i: int, PING_Func1_j: int): int
{
var Tmp12: bool;
var Tmp13: bool;
var Tmp14: bool;
var Tmp15: bool;
var Tmp16: bool;


;

Tmp12 = (PING_Func1_j == 1);
if(Tmp12)
{

;

PING_Func1_i = (PING_Func1_i + 1);
;

return (PING_Func1_i);

}
else
{

;

;


}

;

Tmp13 = (PING_Func1_j == 2);
if(Tmp13)
{

;

Tmp14 = (PING_Func1_i == 3);
assert Tmp14;
;

PING_Func1_i = (PING_Func1_i + 1);
;

Tmp15 = (PING_Func1_i == 4);
assert Tmp15;
;

send this, Ping, PING_Func1_i;
;

Tmp16 = (PING_Func1_i == 4);
assert Tmp16;
;

return (PING_Func1_i);

}
else
{

;

;


}

}
fun PING_Func2(PING_Func2_v: int): int
{
var Tmp17: bool;
var Tmp18: bool;


;

PING_Func2_v = (PING_Func2_v + 1);
;

Tmp17 = (PING_Func2_v == 3);
assert Tmp17;
;

PING_x = PING_Func1(PING_Func2_v, 2);
;

Tmp18 = (PING_x == 4);
assert Tmp18;
}
fun PING_Ping_Init_do_Success16(PING_Ping_Init_do_Success16__payload_1: null)
{
var Tmp19: bool;


;

PING_x = PING_Func1(1, 1);
;

Tmp19 = (PING_x == 2);
assert Tmp19;
;

PING_y = PING_Func2(PING_x);
return;
}
fun PING_Ping_Init_do_Ping21(PING_Ping_Init_do_Ping21_payload: int)
{
var Tmp20: bool;
var Tmp21: bool;


;

Tmp20 = (PING_x == 4);
assert Tmp20;
;

PING_x = (PING_x + 1);
;

Tmp21 = (PING_x == 5);
assert Tmp21;
return;
}
fun PING_Ping_Init_entry13(PING_Ping_Init_entry13__payload_0: null)
{


;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_1461603504(PING_Ping_Init_exit0_rand_1461603504__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_Init
{
entry (payload: null) {
PING_Ping_Init_entry13(payload);
}exit {
PING_Ping_Init_exit0_rand_1461603504(null);
}on Success do (payload: null) {
PING_Ping_Init_do_Success16(payload);
}
on Ping do (payload: int) {
PING_Ping_Init_do_Ping21(payload);
}}
}

