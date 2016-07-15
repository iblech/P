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

}
else
{

_tmp26 = (_CREATEMACHINE_typeOfMachine == 2);
if(_tmp26)
{

_tmp27 = new PONG(null);
_CREATEMACHINE_newMachine = _tmp27;

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

fun PING_Init_on_Success_goto_PING_SendPing0_rand_258397643()
{


;

}
fun PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1882261389()
{


;

}
fun PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_2129462140()
{


;

}
fun PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1139640162()
{


;

}
fun PING_Init_entry15(PING_Init_entry15_payload: (machine, machine))
{


PING_pongMachine = PING_Init_entry15_payload;
raise Success;
}
fun PING_Init_exit0_rand_342229155()
{


;

}
fun PING_SendPing_entry0_rand_1412942388()
{


;

_SEND(PING_pongMachine.0, Ping, this);
_SEND(PING_pongMachine.1, Ping, this);
raise Success;
}
fun PING_SendPing_exit0_rand_577258922()
{


;

}
fun PING_WaitPong_1_entry0_rand_1004742318()
{


;

}
fun PING_WaitPong_1_exit0_rand_273587576()
{


;

}
fun PING_WaitPong_2_entry0_rand_400756469()
{


;

}
fun PING_WaitPong_2_exit0_rand_565902374()
{


;

}
fun PING_Done_entry0_rand_811560947()
{


;

}
fun PING_Done_exit0_rand_379299652()
{


;

}start  state PING_Init
{entry (payload: (machine, machine)) {
PING_Init_entry15(payload);
}
exit  {
PING_Init_exit0_rand_342229155();
}
on Success goto PING_SendPing with   {
PING_Init_on_Success_goto_PING_SendPing0_rand_258397643();
}
}
 state PING_SendPing
{entry  {
PING_SendPing_entry0_rand_1412942388();
}
exit  {
PING_SendPing_exit0_rand_577258922();
}
on Success goto PING_WaitPong_1 with   {
PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1882261389();
}
}
 state PING_WaitPong_1
{entry  {
PING_WaitPong_1_entry0_rand_1004742318();
}
exit  {
PING_WaitPong_1_exit0_rand_273587576();
}
on Pong goto PING_WaitPong_2 with  (payload: machine) {
PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_2129462140();
}
}
 state PING_WaitPong_2
{entry  {
PING_WaitPong_2_entry0_rand_400756469();
}
exit  {
PING_WaitPong_2_exit0_rand_565902374();
}
on Pong goto PING_Done with  (payload: machine) {
PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1139640162();
}
}
 state PING_Done
{entry  {
PING_Done_entry0_rand_811560947();
}
exit  {
PING_Done_exit0_rand_379299652();
}
}
}

machine PONG
{

fun PONG_Init_on_Ping_goto_PONG_SendPong0_rand_929251012()
{


;

}
fun PONG_SendPong_on_Success_goto_PONG_End0_rand_1332107449()
{


;

}
fun PONG_Init_entry0_rand_207460026()
{


;

}
fun PONG_Init_exit0_rand_1982470680()
{


;

}
fun PONG_SendPong_entry0_rand_81845469(PONG_SendPong_entry0_rand_81845469_payload: machine)
{


;

_SEND(PONG_SendPong_entry0_rand_81845469_payload, Pong, this);
raise Success;
}
fun PONG_SendPong_exit0_rand_1682067237()
{


;

}
fun PONG_End_entry59()
{


raise halt;
}
fun PONG_End_exit0_rand_1911591611()
{


;

}start  state PONG_Init
{entry  {
PONG_Init_entry0_rand_207460026();
}
exit  {
PONG_Init_exit0_rand_1982470680();
}
on Ping goto PONG_SendPong with  (payload: machine) {
PONG_Init_on_Ping_goto_PONG_SendPong0_rand_929251012();
}
}
 state PONG_SendPong
{entry (payload: machine) {
PONG_SendPong_entry0_rand_81845469(payload);
}
exit  {
PONG_SendPong_exit0_rand_1682067237();
}
on Success goto PONG_End with   {
PONG_SendPong_on_Success_goto_PONG_End0_rand_1332107449();
}
}
 state PONG_End
{entry  {
PONG_End_entry59();
}
exit  {
PONG_End_exit0_rand_1911591611();
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
fun GodMachine_Init_exit0_rand_1218797557()
{


;

}start  state GodMachine_Init
{entry  {
GodMachine_Init_entry105();
}
exit  {
GodMachine_Init_exit0_rand_1218797557();
}
}
}

machine Container
{

fun Container_Init_entry0_rand_925433007()
{


;

}
fun Container_Init_exit0_rand_506531217()
{


;

}start  state Container_Init
{entry  {
Container_Init_entry0_rand_925433007();
}
exit  {
Container_Init_exit0_rand_506531217();
}
}
}

