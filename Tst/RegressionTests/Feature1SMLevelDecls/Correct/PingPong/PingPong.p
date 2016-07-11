event Ping  assert 1: machine;
event Pong  assert 2: machine;
event Success;
event M_Ping;
event M_Pong;
fun _CREATEMACHINE(_CREATEMACHINE_cner: machine, _CREATEMACHINE_typeOfMachine: int, _CREATEMACHINE_param: any, _CREATEMACHINE_newMachine: machine): machine
{
var _tmp26: bool;
var _tmp27: (machine, machine);
var _tmp28: machine;
var _tmp29: bool;
var _tmp30: machine;


_tmp26 = (_CREATEMACHINE_typeOfMachine == 1);
;
if(_tmp26)
{

_tmp27 = (_CREATEMACHINE_param as (machine, machine));
;
_tmp28 = new PING(_tmp27);
;
_CREATEMACHINE_newMachine = _tmp28;
;
_CREATEMACHINE_newMachine = new PING((_CREATEMACHINE_param as (machine, machine)));



}
else
{

_tmp29 = (_CREATEMACHINE_typeOfMachine == 2);
;
if(_tmp29)
{

_tmp30 = new PONG(null);
;
_CREATEMACHINE_newMachine = _tmp30;
;
_CREATEMACHINE_newMachine = new PONG(null);



}
else
{

assert false;
;
assert false;



}
;
if((_CREATEMACHINE_typeOfMachine == 2))
{
_CREATEMACHINE_newMachine = new PONG(null);

}
else
{
assert false;

}



}
;
return (_CREATEMACHINE_newMachine);


}
model fun _SEND(_SEND_target: machine, _SEND_e: event, _SEND_p: any)
{


send _SEND_target, _SEND_e, _SEND_p;


}
model fun _CREATECONTAINER(): machine
{
var _CREATECONTAINER_retVal: machine;
var _tmp31: machine;


_tmp31 = new Container(null);
;
_CREATECONTAINER_retVal = _tmp31;
;
return (_CREATECONTAINER_retVal);


}
machine PING
{
var PING_pongMachine: (machine, machine);

fun PING_Init_entry15(PING_Init_entry15_payload: (machine, machine))
{


PING_pongMachine = PING_Init_entry15_payload;
;
raise Success;


}
fun PING_Init_exit0_rand_1811084587()
{


;


}
fun PING_SendPing_entry0_rand_138036435(PING_SendPing_entry0_rand_138036435__payload_0: any)
{


;
;
_SEND(PING_pongMachine.0, Ping, this);
;
_SEND(PING_pongMachine.1, Ping, this);
;
raise Success;


}
fun PING_SendPing_exit0_rand_966197304()
{


;


}
fun PING_WaitPong_1_entry0_rand_1161327764(PING_WaitPong_1_entry0_rand_1161327764__payload_skip: any)
{


;


}
fun PING_WaitPong_1_exit0_rand_913398353()
{


;


}
fun PING_WaitPong_2_entry0_rand_1352052975(PING_WaitPong_2_entry0_rand_1352052975__payload_skip: any)
{


;


}
fun PING_WaitPong_2_exit0_rand_893960624()
{


;


}
fun PING_Done_entry0_rand_220874926(PING_Done_entry0_rand_220874926__payload_skip: any)
{


;


}
fun PING_Done_exit0_rand_765279982()
{


;


}
fun PING_Init_on_Success_goto_PING_SendPing0_rand_1538572243(PING_Init_on_Success_goto_PING_SendPing0_rand_1538572243__payload_skip: any)
{


;


}
fun PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1345457498(PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1345457498__payload_skip: any)
{


;


}
fun PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_1729129773(PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_1729129773__payload_skip: any)
{


;


}
fun PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1056556087(PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1056556087__payload_skip: any)
{


;


}start  state PING_Init
{entry (payload: (machine, machine)) {
PING_Init_entry15(payload);
}
exit  {
PING_Init_exit0_rand_1811084587();
}
}
 state PING_SendPing
{entry (payload: any) {
PING_SendPing_entry0_rand_138036435(payload);
}
exit  {
PING_SendPing_exit0_rand_966197304();
}
}
 state PING_WaitPong_1
{entry (payload: any) {
PING_WaitPong_1_entry0_rand_1161327764(payload);
}
exit  {
PING_WaitPong_1_exit0_rand_913398353();
}
}
 state PING_WaitPong_2
{entry (payload: any) {
PING_WaitPong_2_entry0_rand_1352052975(payload);
}
exit  {
PING_WaitPong_2_exit0_rand_893960624();
}
}
 state PING_Done
{entry (payload: any) {
PING_Done_entry0_rand_220874926(payload);
}
exit  {
PING_Done_exit0_rand_765279982();
}
}
}

machine PONG
{

fun PONG_Init_entry0_rand_2141120727(PONG_Init_entry0_rand_2141120727__payload_skip: any)
{


;


}
fun PONG_Init_exit0_rand_1468735111()
{


;


}
fun PONG_SendPong_entry0_rand_675555928(PONG_SendPong_entry0_rand_675555928_payload: machine)
{


;
;
_SEND(PONG_SendPong_entry0_rand_675555928_payload, Pong, this);
;
raise Success;


}
fun PONG_SendPong_exit0_rand_508333658()
{


;


}
fun PONG_End_entry59(PONG_End_entry59__payload_1: any)
{


raise halt;


}
fun PONG_End_exit0_rand_1674770261()
{


;


}
fun PONG_Init_on_Ping_goto_PONG_SendPong0_rand_1257714178(PONG_Init_on_Ping_goto_PONG_SendPong0_rand_1257714178__payload_skip: any)
{


;


}
fun PONG_SendPong_on_Success_goto_PONG_End0_rand_1434514575(PONG_SendPong_on_Success_goto_PONG_End0_rand_1434514575__payload_skip: any)
{


;


}start  state PONG_Init
{entry (payload: any) {
PONG_Init_entry0_rand_2141120727(payload);
}
exit  {
PONG_Init_exit0_rand_1468735111();
}
}
 state PONG_SendPong
{entry (payload: machine) {
PONG_SendPong_entry0_rand_675555928(payload);
}
exit  {
PONG_SendPong_exit0_rand_508333658();
}
}
 state PONG_End
{entry (payload: any) {
PONG_End_entry59(payload);
}
exit  {
PONG_End_exit0_rand_1674770261();
}
}
}

main machine GodMachine
{
var GodMachine_container: machine;
var GodMachine_pongMachine_1: machine;
var GodMachine_pongMachine_2: machine;

fun GodMachine_Init_entry105(GodMachine_Init_entry105__payload_2: any)
{
var _tmp25: (machine, machine);


GodMachine_container = _CREATECONTAINER();
;
GodMachine_pongMachine_1 = _CREATEMACHINE(GodMachine_container, 2, null, null);
;
GodMachine_container = _CREATECONTAINER();
;
GodMachine_pongMachine_2 = _CREATEMACHINE(GodMachine_container, 2, null, null);
;
GodMachine_container = _CREATECONTAINER();
;
_tmp25 = (GodMachine_pongMachine_1, GodMachine_pongMachine_2);
;
_CREATEMACHINE(GodMachine_container, 1, _tmp25, null);


}
fun GodMachine_Init_exit0_rand_30048024()
{


;


}start  state GodMachine_Init
{entry (payload: any) {
GodMachine_Init_entry105(payload);
}
exit  {
GodMachine_Init_exit0_rand_30048024();
}
}
}

machine Container
{

fun Container_Init_entry0_rand_930244284(Container_Init_entry0_rand_930244284__payload_skip: any)
{


;


}
fun Container_Init_exit0_rand_189903212()
{


;


}start  state Container_Init
{entry (payload: any) {
Container_Init_entry0_rand_930244284(payload);
}
exit  {
Container_Init_exit0_rand_189903212();
}
}
}

