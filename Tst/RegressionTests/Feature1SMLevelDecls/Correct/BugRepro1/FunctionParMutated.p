event Ping  assert 1: int;
event Success;

main machine PING
{
var PING_x: int;
var PING_y: int;

fun PING_Func1(PING_Func1_i: int, PING_Func1_j: int): int
{
var _tmp10: bool;
var _tmp11: bool;
var _tmp12: bool;
var _tmp13: bool;
var _tmp9: bool;


_tmp9 = (PING_Func1_j == 1);
if(_tmp9)
{

PING_Func1_i = (PING_Func1_i + 1);
return (PING_Func1_i);

}
else
{

;


}

_tmp10 = (PING_Func1_j == 2);
if(_tmp10)
{

_tmp11 = (PING_Func1_i == 3);
assert _tmp11;
PING_Func1_i = (PING_Func1_i + 1);
_tmp12 = (PING_Func1_i == 4);
assert _tmp12;
send this, Ping, PING_Func1_i;
_tmp13 = (PING_Func1_i == 4);
assert _tmp13;
return (PING_Func1_i);

}
else
{

;


}

}
fun PING_Func2(PING_Func2_v: int): int
{
var _tmp14: bool;
var _tmp15: bool;


PING_Func2_v = (PING_Func2_v + 1);
_tmp14 = (PING_Func2_v == 3);
assert _tmp14;
PING_x = PING_Func1(PING_Func2_v, 2);
_tmp15 = (PING_x == 4);
assert _tmp15;
}
fun PING_Ping_Init_do_Success17()
{
var _tmp16: bool;


PING_x = PING_Func1(1, 1);
_tmp16 = (PING_x == 2);
assert _tmp16;
PING_y = PING_Func2(PING_x);
}
fun PING_Ping_Init_do_Ping22()
{
var _tmp17: bool;
var _tmp18: bool;


_tmp17 = (PING_x == 4);
assert _tmp17;
PING_x = (PING_x + 1);
_tmp18 = (PING_x == 5);
assert _tmp18;
}
fun PING_Ping_Init_entry14()
{


raise Success;
}
fun PING_Ping_Init_exit0_rand_1014272797()
{


;

}start  state PING_Ping_Init
{entry  {
PING_Ping_Init_entry14();
}
exit  {
PING_Ping_Init_exit0_rand_1014272797();
}
on Success do   {
PING_Ping_Init_do_Success17();
}

on Ping do  (payload: int) {
PING_Ping_Init_do_Ping22();
}
}
}

