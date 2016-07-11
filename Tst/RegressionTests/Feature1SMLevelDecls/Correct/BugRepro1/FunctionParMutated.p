event Ping  assert 1: int;
event Success;

main machine PING
{
var PING_x: int;
var PING_y: int;

fun PING_Func1(PING_Func1_i: int, PING_Func1_j: int): int
{
var _tmp11: bool;
var _tmp12: bool;
var _tmp13: bool;
var _tmp14: bool;
var _tmp15: bool;


_tmp11 = (PING_Func1_j == 1);

if(_tmp11)
{

PING_Func1_i = (PING_Func1_i + 1);

return (PING_Func1_i);

PING_Func1_i = (PING_Func1_i + 1);

return (PING_Func1_i);



}
else
{

;

;



}

_tmp12 = (PING_Func1_j == 2);

if(_tmp12)
{

_tmp13 = (PING_Func1_i == 3);

assert _tmp13;

PING_Func1_i = (PING_Func1_i + 1);

_tmp14 = (PING_Func1_i == 4);

assert _tmp14;

send this, Ping, PING_Func1_i;

_tmp15 = (PING_Func1_i == 4);

assert _tmp15;

return (PING_Func1_i);

assert (PING_Func1_i == 3);

PING_Func1_i = (PING_Func1_i + 1);

assert (PING_Func1_i == 4);

send this, Ping, PING_Func1_i;

assert (PING_Func1_i == 4);

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
var _tmp16: bool;
var _tmp17: bool;


PING_Func2_v = (PING_Func2_v + 1);

_tmp16 = (PING_Func2_v == 3);

assert _tmp16;

PING_x = PING_Func1(PING_Func2_v, 2);

_tmp17 = (PING_x == 4);

assert _tmp17;


}
fun PING_Ping_Init_entry13(PING_Ping_Init_entry13__payload_0: any)
{


raise Success;


}
fun PING_Ping_Init_exit0_rand_1842971178()
{


;


}
fun PING_Ping_Init_do_Success16(PING_Ping_Init_do_Success16__payload_1: any)
{
var _tmp18: bool;


PING_x = PING_Func1(1, 1);

_tmp18 = (PING_x == 2);

assert _tmp18;

PING_y = PING_Func2(PING_x);


}
fun PING_Ping_Init_do_Ping21(PING_Ping_Init_do_Ping21__payload_2: any)
{
var _tmp19: bool;
var _tmp20: bool;


_tmp19 = (PING_x == 4);

assert _tmp19;

PING_x = (PING_x + 1);

_tmp20 = (PING_x == 5);

assert _tmp20;


}start  state PING_Ping_Init
{entry (payload: any) {
PING_Ping_Init_entry13(payload);
}
exit  {
PING_Ping_Init_exit0_rand_1842971178();
}
}
}

