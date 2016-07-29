event Ping  assert 1: int;
event Success;

main machine PING
{
var PING_x: int;
var PING_y: int;

fun PING_foo1(): bool
{
var Tmp22: bool;


;

Tmp22 = PING_foo2();
if(Tmp22)
{

;

return (true);

}
else
{

;

return (false);

}

}
fun PING_foo2(): bool
{


;

PING_x = (PING_x + 1);
;

if((PING_x < 100))
{

;

return (true);

}
else
{

;

return (false);

}

}
fun PING_foo3(): bool
{
var Tmp23: bool;


;

Tmp23 = PING_foo2();
return (Tmp23);
}
fun PING_Ping_Init_do_Success15(PING_Ping_Init_do_Success15__payload_1: null)
{
var Tmp24: bool;
var Tmp25: bool;
var Tmp26: bool;
var Tmp27: bool;
var Tmp28: bool;


;

Tmp24 = PING_foo1();
while(Tmp24)
{

;

Tmp25 = (PING_x == 1);
assert Tmp25;
;

PING_x = (PING_x + 100);

}

;

Tmp26 = (PING_x == 102);
assert Tmp26;
;

Tmp27 = PING_foo3();
if(Tmp27)
{

;

assert false;

}
else
{

;

Tmp28 = (PING_x == 103);
assert Tmp28;

}

return;
}
fun PING_Ping_Init_entry12(PING_Ping_Init_entry12__payload_0: null)
{


;

raise Success;
return;
}
fun PING_Ping_Init_exit0_rand_1836847707(PING_Ping_Init_exit0_rand_1836847707__payload_skip: any)
{


;

;

return;
}start 
 state PING_Ping_Init
{
entry (payload: null) {
PING_Ping_Init_entry12(payload);
}exit {
PING_Ping_Init_exit0_rand_1836847707(null);
}on Success do (payload: null) {
PING_Ping_Init_do_Success15(payload);
}}
}

