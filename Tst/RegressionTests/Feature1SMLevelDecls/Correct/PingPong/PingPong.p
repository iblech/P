event halt;
event null;
event Ping  assert 1: machine;
event Pong  assert 2: machine;
event Success;
event M_Ping;
event M_Pong;
fun _CREATEMACHINE(_CREATEMACHINE_cner: machine, _CREATEMACHINE_typeOfMachine: int, _CREATEMACHINE_param: any, _CREATEMACHINE_newMachine: machine): machine
{
var _tmp23: bool;
var _tmp24: (machine, machine);
var _tmp25: machine;
var _tmp26: bool;
var _tmp27: machine;


_tmp23 = (_CREATEMACHINE_typeOfMachine == 1);

if(_tmp23)
{

_tmp24 = (_CREATEMACHINE_param as (machine, machine));

_tmp25 = new PING(_tmp24);

_CREATEMACHINE_newMachine = _tmp25;

_CREATEMACHINE_newMachine = new PING((_CREATEMACHINE_param as (machine, machine)));



}
else
{

_tmp26 = (_CREATEMACHINE_typeOfMachine == 2);

if(_tmp26)
{

_tmp27 = new PONG(null);

_CREATEMACHINE_newMachine = _tmp27;

_CREATEMACHINE_newMachine = new PONG(null);



}
else
{

assert false;

assert false;



}

if((_CREATEMACHINE_typeOfMachine == 2))
{
_CREATEMACHINE_newMachine = new PONG(null);

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
var _tmp28: machine;


_tmp28 = new Container(null);

_CREATECONTAINER_retVal = _tmp28;

return (_CREATECONTAINER_retVal);


}
machine PING
{
var PING_pongMachine: (machine, machine);

fun PING_Init_entry15(PING_Init_entry15_payload: (machine, machine))
{


PING_pongMachine = PING_Init_entry15_payload;

raise Success;


}
fun PING_Init_exit0_rand_164852844()
{


;


}
fun PING_SendPing_entry0_rand_232173607()
{


;

_SEND(PING_pongMachine.0, Ping, this);

_SEND(PING_pongMachine.1, Ping, this);

raise Success;


}
fun PING_SendPing_exit0_rand_481431042()
{


;


}
fun PING_WaitPong_1_entry0_rand_2106406991()
{


;


}
fun PING_WaitPong_1_exit0_rand_281400883()
{


;


}
fun PING_WaitPong_2_entry0_rand_1573153706()
{


;


}
fun PING_WaitPong_2_exit0_rand_1768150061()
{


;


}
fun PING_Done_entry0_rand_1820500227()
{


;


}
fun PING_Done_exit0_rand_42933321()
{


;


}
fun PING_Init_on_Success_goto_PING_SendPing0_rand_181720107()
{


;


}
fun PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1587666605()
{


;


}
fun PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_2088138649()
{


;


}
fun PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1449011756()
{


;


}start  state PING_Init
{entry (payload: (machine, machine)) {
PING_Init_entry15(payload);
}
exit  {
PING_Init_exit0_rand_164852844();
}
}
 state PING_SendPing
{entry  {
PING_SendPing_entry0_rand_232173607();
}
exit  {
PING_SendPing_exit0_rand_481431042();
}
}
 state PING_WaitPong_1
{entry  {
PING_WaitPong_1_entry0_rand_2106406991();
}
exit  {
PING_WaitPong_1_exit0_rand_281400883();
}
}
 state PING_WaitPong_2
{entry  {
PING_WaitPong_2_entry0_rand_1573153706();
}
exit  {
PING_WaitPong_2_exit0_rand_1768150061();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_1820500227();
}
exit  {
PING_Done_exit0_rand_42933321();
}
}
}

machine PONG
{

fun PONG_Init_entry0_rand_597619508()
{


;


}
fun PONG_Init_exit0_rand_1600596520()
{


;


}
fun PONG_SendPong_entry0_rand_184772062(PONG_SendPong_entry0_rand_184772062_payload: machine)
{


;

_SEND(PONG_SendPong_entry0_rand_184772062_payload, Pong, this);

raise Success;


}
fun PONG_SendPong_exit0_rand_1712678222()
{


;


}
fun PONG_End_entry59()
{


raise halt;


}
fun PONG_End_exit0_rand_1313335620()
{


;


}
fun PONG_Init_on_Ping_goto_PONG_SendPong0_rand_1043446343()
{


;


}
fun PONG_SendPong_on_Success_goto_PONG_End0_rand_850376206()
{


;


}start  state PONG_Init
{entry  {
PONG_Init_entry0_rand_597619508();
}
exit  {
PONG_Init_exit0_rand_1600596520();
}
}
 state PONG_SendPong
{entry (payload: machine) {
PONG_SendPong_entry0_rand_184772062(payload);
}
exit  {
PONG_SendPong_exit0_rand_1712678222();
}
}
 state PONG_End
{entry  {
PONG_End_entry59();
}
exit  {
PONG_End_exit0_rand_1313335620();
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
var _tmp22: (machine, machine);


GodMachine_container = _CREATECONTAINER();

GodMachine_pongMachine_1 = _CREATEMACHINE(GodMachine_container, 2, null, null);

GodMachine_container = _CREATECONTAINER();

GodMachine_pongMachine_2 = _CREATEMACHINE(GodMachine_container, 2, null, null);

GodMachine_container = _CREATECONTAINER();

_tmp22 = (GodMachine_pongMachine_1, GodMachine_pongMachine_2);

_CREATEMACHINE(GodMachine_container, 1, _tmp22, null);


}
fun GodMachine_Init_exit0_rand_328878432()
{


;


}start  state GodMachine_Init
{entry  {
GodMachine_Init_entry105();
}
exit  {
GodMachine_Init_exit0_rand_328878432();
}
}
}

machine Container
{

fun Container_Init_entry0_rand_725436573()
{


;


}
fun Container_Init_exit0_rand_1593279185()
{


;


}start  state Container_Init
{entry  {
Container_Init_entry0_rand_725436573();
}
exit  {
Container_Init_exit0_rand_1593279185();
}
}
}

