event local;
event global: int;

spec First monitors local 
{
var First_x: int;

fun First_Init_do_local8(First_Init_do_local8__payload_0: null)
{


;

First_x = (First_x + 1);
return;
}
fun First_Init_do_global9(First_Init_do_global9_payload: int)
{
var Tmp32: bool;


;

Tmp32 = (First_x == 2);
assert Tmp32;
return;
}
fun First_Init_entry0_rand_345009600(First_Init_entry0_rand_345009600__payload_skip: any)
{


;

;

return;
}
fun First_Init_exit0_rand_1473446046(First_Init_exit0_rand_1473446046__payload_skip: any)
{


;

;

return;
}start 
 state First_Init
{
entry (payload: any) {
First_Init_entry0_rand_345009600(payload);
}exit {
First_Init_exit0_rand_1473446046(null);
}on local do (payload: null) {
First_Init_do_local8(payload);
}
on global do (payload: int) {
First_Init_do_global9(payload);
}}
}

main machine MAIN
{

fun MAIN_Init_entry16(MAIN_Init_entry16__payload_1: null)
{


;

send this, local;
;

monitor (local), (null);
;

monitor (global), (5);
return;
}
fun MAIN_Init_exit0_rand_207253927(MAIN_Init_exit0_rand_207253927__payload_skip: any)
{


;

;

return;
}start 
 state MAIN_Init
{
entry (payload: null) {
MAIN_Init_entry16(payload);
}exit {
MAIN_Init_exit0_rand_207253927(null);
}ignore local;}
}

