event Ping  assert 1: machine;
event Pong  assert 2: machine;
event Success;
event M_Ping;
event M_Pong;
fun _CREATEMACHINE(_CREATEMACHINE_cner: machine, _CREATEMACHINE_typeOfMachine: int, _CREATEMACHINE_param: any, _CREATEMACHINE_newMachine: machine): machine
{
var Tmp23: bool;
var Tmp24: (machine, machine);
var Tmp25: machine;
var Tmp26: bool;
var Tmp27: machine;


Tmp23 = (_CREATEMACHINE_typeOfMachine == 1);
if(Tmp23)
{

Tmp24 = (_CREATEMACHINE_param as (machine, machine));
Tmp25 = new PING(Tmp24);
_CREATEMACHINE_newMachine = Tmp25;

}
else
{

Tmp26 = (_CREATEMACHINE_typeOfMachine == 2);
if(Tmp26)
{

Tmp27 = new PONG(null);
_CREATEMACHINE_newMachine = Tmp27;

}
else
{

assert false;

}


}

return (_CREATEMACHINE_newMachine);
}
model fun _SEND(_SEND_target: machine, _SEND_e: event, _SEND_p: any)
{


send _SEND_target, _SEND_e, _SEND_p;
}
model fun _CREATECONTAINER(): machine
{
var _CREATECONTAINER_retVal: machine;
var Tmp28: machine;


Tmp28 = new Container(null);
_CREATECONTAINER_retVal = Tmp28;
return (_CREATECONTAINER_retVal);
}
machine PING
{
var PING_pongMachine: (machine, machine);

fun PING_Init_on_Success_goto_PING_SendPing0_rand_2078973596()
{


;

}
fun PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_221942867()
{


;

}
fun PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_1066864604()
{


;

}
fun PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1217688142()
{


;

}
fun PING_Init_entry15(PING_Init_entry15_payload: (machine, machine))
{


PING_pongMachine = PING_Init_entry15_payload;
raise Success;
}
fun PING_Init_exit0_rand_1474280822()
{


;

}
fun PING_SendPing_entry0_rand_1460037738()
{


;

_SEND(PING_pongMachine.0, Ping, this);
_SEND(PING_pongMachine.1, Ping, this);
raise Success;
}
fun PING_SendPing_exit0_rand_2054494647()
{


;

}
fun PING_WaitPong_1_entry0_rand_1064985478()
{


;

}
fun PING_WaitPong_1_exit0_rand_921946207()
{


;

}
fun PING_WaitPong_2_entry0_rand_1343114236()
{


;

}
fun PING_WaitPong_2_exit0_rand_1544856480()
{


;

}
fun PING_Done_entry0_rand_1570148146()
{


;

}
fun PING_Done_exit0_rand_512448344()
{


;

}start 
 state PING_Init
{
entry (payload: (machine, machine)) {
PING_Init_entry15(payload);
}
exit  {
PING_Init_exit0_rand_1474280822();
}
on Success goto PING_SendPing with   {
PING_Init_on_Success_goto_PING_SendPing0_rand_2078973596();
}
}

 state PING_SendPing
{
entry  {
PING_SendPing_entry0_rand_1460037738();
}
exit  {
PING_SendPing_exit0_rand_2054494647();
}
on Success goto PING_WaitPong_1 with   {
PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_221942867();
}
}

 state PING_WaitPong_1
{
entry  {
PING_WaitPong_1_entry0_rand_1064985478();
}
exit  {
PING_WaitPong_1_exit0_rand_921946207();
}
on Pong goto PING_WaitPong_2 with  (payload: machine) {
PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_1066864604();
}
}

 state PING_WaitPong_2
{
entry  {
PING_WaitPong_2_entry0_rand_1343114236();
}
exit  {
PING_WaitPong_2_exit0_rand_1544856480();
}
on Pong goto PING_Done with  (payload: machine) {
PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1217688142();
}
}

 state PING_Done
{
entry  {
PING_Done_entry0_rand_1570148146();
}
exit  {
PING_Done_exit0_rand_512448344();
}
}
}

machine PONG
{

fun PONG_Init_on_Ping_goto_PONG_SendPong0_rand_813870013()
{


;

}
fun PONG_SendPong_on_Success_goto_PONG_End0_rand_210627416()
{


;

}
fun PONG_Init_entry0_rand_1025615097()
{


;

}
fun PONG_Init_exit0_rand_1836500412()
{


;

}
fun PONG_SendPong_entry0_rand_541058064(PONG_SendPong_entry0_rand_541058064_payload: machine)
{


;

_SEND(PONG_SendPong_entry0_rand_541058064_payload, Pong, this);
raise Success;
}
fun PONG_SendPong_exit0_rand_1861955878()
{


;

}
fun PONG_End_entry59()
{


raise halt;
}
fun PONG_End_exit0_rand_2110172708()
{


;

}start 
 state PONG_Init
{
entry  {
PONG_Init_entry0_rand_1025615097();
}
exit  {
PONG_Init_exit0_rand_1836500412();
}
on Ping goto PONG_SendPong with  (payload: machine) {
PONG_Init_on_Ping_goto_PONG_SendPong0_rand_813870013();
}
}

 state PONG_SendPong
{
entry (payload: machine) {
PONG_SendPong_entry0_rand_541058064(payload);
}
exit  {
PONG_SendPong_exit0_rand_1861955878();
}
on Success goto PONG_End with   {
PONG_SendPong_on_Success_goto_PONG_End0_rand_210627416();
}
}

 state PONG_End
{
entry  {
PONG_End_entry59();
}
exit  {
PONG_End_exit0_rand_2110172708();
}
}
}

main machine GodMachine
{
var GodMachine_container: machine;
var GodMachine_pongMachine_1: machine;
var GodMachine_pongMachine_2: machine;

fun GodMachine_Init_entry105()
{
var Tmp22: (machine, machine);


GodMachine_container = _CREATECONTAINER();
GodMachine_pongMachine_1 = _CREATEMACHINE(GodMachine_container, 2, null, null);
GodMachine_container = _CREATECONTAINER();
GodMachine_pongMachine_2 = _CREATEMACHINE(GodMachine_container, 2, null, null);
GodMachine_container = _CREATECONTAINER();
Tmp22 = (GodMachine_pongMachine_1, GodMachine_pongMachine_2);
_CREATEMACHINE(GodMachine_container, 1, Tmp22, null);
}
fun GodMachine_Init_exit0_rand_1533532291()
{


;

}start 
 state GodMachine_Init
{
entry  {
GodMachine_Init_entry105();
}
exit  {
GodMachine_Init_exit0_rand_1533532291();
}
}
}

machine Container
{

fun Container_Init_entry0_rand_1951073076()
{


;

}
fun Container_Init_exit0_rand_1611163285()
{


;

}start 
 state Container_Init
{
entry  {
Container_Init_entry0_rand_1951073076();
}
exit  {
Container_Init_exit0_rand_1611163285();
}
}
}

