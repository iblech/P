event Ping  assert 1: int;
event Success;

main machine PING
{
var PING_x: int;
var PING_y: int;

fun PING_Func1(PING_Func1_i: int, PING_Func1_j: int): int
{
var Tmp10: bool;
var Tmp11: bool;
var Tmp12: bool;
var Tmp13: bool;
var Tmp9: bool;


Tmp9 = (PING_Func1_j == 1);
if(Tmp9)
{

PING_Func1_i = (PING_Func1_i + 1);
return (PING_Func1_i);

}
else
{

;


}

Tmp10 = (PING_Func1_j == 2);
if(Tmp10)
{

Tmp11 = (PING_Func1_i == 3);
assert Tmp11;
PING_Func1_i = (PING_Func1_i + 1);
Tmp12 = (PING_Func1_i == 4);
assert Tmp12;
send this, Ping, PING_Func1_i;
Tmp13 = (PING_Func1_i == 4);
assert Tmp13;
return (PING_Func1_i);

}
else
{

;


}

}
fun PING_Func2(PING_Func2_v: int): int
{
var Tmp14: bool;
var Tmp15: bool;


PING_Func2_v = (PING_Func2_v + 1);
Tmp14 = (PING_Func2_v == 3);
assert Tmp14;
PING_x = PING_Func1(PING_Func2_v, 2);
Tmp15 = (PING_x == 4);
assert Tmp15;
}
fun PING_Ping_Init_do_Success17()
{
var Tmp16: bool;


PING_x = PING_Func1(1, 1);
Tmp16 = (PING_x == 2);
assert Tmp16;
PING_y = PING_Func2(PING_x);
}
fun PING_Ping_Init_do_Ping22()
{
var Tmp17: bool;
var Tmp18: bool;


Tmp17 = (PING_x == 4);
assert Tmp17;
PING_x = (PING_x + 1);
Tmp18 = (PING_x == 5);
assert Tmp18;
}
fun PING_Ping_Init_entry14()
{


raise Success;
}
fun PING_Ping_Init_exit0_rand_1022442686()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry14();
}
exit  {
PING_Ping_Init_exit0_rand_1022442686();
}
on Success do   {
PING_Ping_Init_do_Success17();
}

on Ping do  (payload: int) {
PING_Ping_Init_do_Ping22();
}
}
}

