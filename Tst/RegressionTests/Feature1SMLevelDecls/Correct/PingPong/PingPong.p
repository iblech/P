event Ping  assert 1: machine;
event Pong  assert 2: machine;
event Success;
event M_Ping;
event M_Pong;
fun _CREATEMACHINE(_CREATEMACHINE_cner: machine, _CREATEMACHINE_typeOfMachine: int, _CREATEMACHINE_param: any, _CREATEMACHINE_newMachine: machine): machine
{
var Tmp34: bool;
var Tmp35: (machine, machine);
var Tmp36: machine;
var Tmp37: bool;
var Tmp38: machine;


;

Tmp34 = (_CREATEMACHINE_typeOfMachine == 1);
if(Tmp34)
{

;

Tmp35 = (_CREATEMACHINE_param as (machine, machine));
Tmp36 = new PING(Tmp35);
_CREATEMACHINE_newMachine = Tmp36;

}
else
{

;

Tmp37 = (_CREATEMACHINE_typeOfMachine == 2);
if(Tmp37)
{

;

Tmp38 = new PONG(null);
_CREATEMACHINE_newMachine = Tmp38;

}
else
{

;

assert false;

}


}

;

return (_CREATEMACHINE_newMachine);
}
fun _SEND(_SEND_target: machine, _SEND_e: event, _SEND_p: any)
{


;

send _SEND_target, _SEND_e, _SEND_p;
}
fun _CREATECONTAINER(): machine
{
var _CREATECONTAINER_retVal: machine;
var Tmp39: machine;


;

Tmp39 = new Container(null);
_CREATECONTAINER_retVal = Tmp39;
;

return (_CREATECONTAINER_retVal);
}
machine PING
{
var PING_pongMachine: (machine, machine);

fun PING_Init_on_Success_goto_PING_SendPing0_rand_418652766(PING_Init_on_Success_goto_PING_SendPing0_rand_418652766__payload_skip: any)
{


;

;

return;
}
fun PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_2089455412(PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_2089455412__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_591891222(PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_591891222__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1274910990(PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1274910990__payload_skip: any)
{


;

;

return;
}
fun PING_Init_entry15(PING_Init_entry15_payload: (machine, machine))
{


;

PING_pongMachine = PING_Init_entry15_payload;
;

raise Success;
return;
}
fun PING_Init_exit0_rand_286781155(PING_Init_exit0_rand_286781155__payload_skip: any)
{


;

;

return;
}
fun PING_SendPing_entry23(PING_SendPing_entry23__payload_0: null)
{


;

monitor (M_Ping), (null);
;

_SEND(PING_pongMachine.0, Ping, this);
;

_SEND(PING_pongMachine.1, Ping, this);
;

raise Success;
return;
}
fun PING_SendPing_exit0_rand_2112468219(PING_SendPing_exit0_rand_2112468219__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_1_entry0_rand_402219228(PING_WaitPong_1_entry0_rand_402219228__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_1_exit0_rand_1065943707(PING_WaitPong_1_exit0_rand_1065943707__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_2_entry0_rand_726063740(PING_WaitPong_2_entry0_rand_726063740__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_2_exit0_rand_1989852705(PING_WaitPong_2_exit0_rand_1989852705__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_1081542875(PING_Done_entry0_rand_1081542875__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_609994915(PING_Done_exit0_rand_609994915__payload_skip: any)
{


;

;

return;
}start 
 state PING_Init
{
entry (payload: (machine, machine)) {
PING_Init_entry15(payload);
}exit {
PING_Init_exit0_rand_286781155(null);
}on Success goto PING_SendPing with (payload: null) {
PING_Init_on_Success_goto_PING_SendPing0_rand_418652766(payload);
}}

 state PING_SendPing
{
entry (payload: null) {
PING_SendPing_entry23(payload);
}exit {
PING_SendPing_exit0_rand_2112468219(null);
}on Success goto PING_WaitPong_1 with (payload: null) {
PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_2089455412(payload);
}}

 state PING_WaitPong_1
{
entry (payload: any) {
PING_WaitPong_1_entry0_rand_402219228(payload);
}exit {
PING_WaitPong_1_exit0_rand_1065943707(null);
}on Pong goto PING_WaitPong_2 with (payload: machine) {
PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_591891222(payload);
}}

 state PING_WaitPong_2
{
entry (payload: any) {
PING_WaitPong_2_entry0_rand_726063740(payload);
}exit {
PING_WaitPong_2_exit0_rand_1989852705(null);
}on Pong goto PING_Done with (payload: machine) {
PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_1274910990(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_1081542875(payload);
}exit {
PING_Done_exit0_rand_609994915(null);
}}
}

machine PONG
{

fun PONG_Init_on_Ping_goto_PONG_SendPong0_rand_1770585434(PONG_Init_on_Ping_goto_PONG_SendPong0_rand_1770585434__payload_skip: any)
{


;

;

return;
}
fun PONG_SendPong_on_Success_goto_PONG_End0_rand_1825847908(PONG_SendPong_on_Success_goto_PONG_End0_rand_1825847908__payload_skip: any)
{


;

;

return;
}
fun PONG_Init_entry0_rand_2088064741(PONG_Init_entry0_rand_2088064741__payload_skip: any)
{


;

;

return;
}
fun PONG_Init_exit0_rand_1718964583(PONG_Init_exit0_rand_1718964583__payload_skip: any)
{


;

;

return;
}
fun PONG_SendPong_entry50(PONG_SendPong_entry50_payload: machine)
{


;

monitor (M_Pong), (null);
;

_SEND(PONG_SendPong_entry50_payload, Pong, this);
;

raise Success;
return;
}
fun PONG_SendPong_exit0_rand_1292092310(PONG_SendPong_exit0_rand_1292092310__payload_skip: any)
{


;

;

return;
}
fun PONG_End_entry59(PONG_End_entry59__payload_1: null)
{


;

raise halt;
return;
}
fun PONG_End_exit0_rand_704113973(PONG_End_exit0_rand_704113973__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Init
{
entry (payload: any) {
PONG_Init_entry0_rand_2088064741(payload);
}exit {
PONG_Init_exit0_rand_1718964583(null);
}on Ping goto PONG_SendPong with (payload: machine) {
PONG_Init_on_Ping_goto_PONG_SendPong0_rand_1770585434(payload);
}}

 state PONG_SendPong
{
entry (payload: machine) {
PONG_SendPong_entry50(payload);
}exit {
PONG_SendPong_exit0_rand_1292092310(null);
}on Success goto PONG_End with (payload: null) {
PONG_SendPong_on_Success_goto_PONG_End0_rand_1825847908(payload);
}}

 state PONG_End
{
entry (payload: null) {
PONG_End_entry59(payload);
}exit {
PONG_End_exit0_rand_704113973(null);
}}
}

spec M monitors M_Ping, M_Pong 
{

fun M_ExpectPing_on_M_Ping_goto_M_ExpectPong_10_rand_2107523097(M_ExpectPing_on_M_Ping_goto_M_ExpectPong_10_rand_2107523097__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_1_on_M_Pong_goto_M_ExpectPong_20_rand_897413010(M_ExpectPong_1_on_M_Pong_goto_M_ExpectPong_20_rand_897413010__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_2_on_M_Pong_goto_M_ExpectPing0_rand_1572814744(M_ExpectPong_2_on_M_Pong_goto_M_ExpectPing0_rand_1572814744__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPing_entry0_rand_1068232973(M_ExpectPing_entry0_rand_1068232973__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPing_exit0_rand_81827314(M_ExpectPing_exit0_rand_81827314__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_1_entry0_rand_1752189856(M_ExpectPong_1_entry0_rand_1752189856__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_1_exit0_rand_825323950(M_ExpectPong_1_exit0_rand_825323950__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_2_entry0_rand_1110509689(M_ExpectPong_2_entry0_rand_1110509689__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_2_exit0_rand_1277661069(M_ExpectPong_2_exit0_rand_1277661069__payload_skip: any)
{


;

;

return;
}start 
 state M_ExpectPing
{
entry (payload: any) {
M_ExpectPing_entry0_rand_1068232973(payload);
}exit {
M_ExpectPing_exit0_rand_81827314(null);
}on M_Ping goto M_ExpectPong_1 with (payload: null) {
M_ExpectPing_on_M_Ping_goto_M_ExpectPong_10_rand_2107523097(payload);
}}

 state M_ExpectPong_1
{
entry (payload: any) {
M_ExpectPong_1_entry0_rand_1752189856(payload);
}exit {
M_ExpectPong_1_exit0_rand_825323950(null);
}on M_Pong goto M_ExpectPong_2 with (payload: null) {
M_ExpectPong_1_on_M_Pong_goto_M_ExpectPong_20_rand_897413010(payload);
}}

 state M_ExpectPong_2
{
entry (payload: any) {
M_ExpectPong_2_entry0_rand_1110509689(payload);
}exit {
M_ExpectPong_2_exit0_rand_1277661069(null);
}on M_Pong goto M_ExpectPing with (payload: null) {
M_ExpectPong_2_on_M_Pong_goto_M_ExpectPing0_rand_1572814744(payload);
}}
}

main machine GodMachine
{
var GodMachine_container: machine;
var GodMachine_pongMachine_1: machine;
var GodMachine_pongMachine_2: machine;

fun GodMachine_Init_entry105(GodMachine_Init_entry105__payload_2: null)
{
var Tmp33: (machine, machine);


;

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

Tmp33 = (GodMachine_pongMachine_1, GodMachine_pongMachine_2);
_CREATEMACHINE(GodMachine_container, 1, Tmp33, null);
return;
}
fun GodMachine_Init_exit0_rand_438660113(GodMachine_Init_exit0_rand_438660113__payload_skip: any)
{


;

;

return;
}start 
 state GodMachine_Init
{
entry (payload: null) {
GodMachine_Init_entry105(payload);
}exit {
GodMachine_Init_exit0_rand_438660113(null);
}}
}

machine Container
{

fun Container_Init_entry0_rand_1183611419(Container_Init_entry0_rand_1183611419__payload_skip: any)
{


;

;

return;
}
fun Container_Init_exit0_rand_1914389759(Container_Init_exit0_rand_1914389759__payload_skip: any)
{


;

;

return;
}start 
 state Container_Init
{
entry (payload: any) {
Container_Init_entry0_rand_1183611419(payload);
}exit {
Container_Init_exit0_rand_1914389759(null);
}}
}

