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

fun PING_Init_on_Success_goto_PING_SendPing0_rand_209192403(PING_Init_on_Success_goto_PING_SendPing0_rand_209192403__payload_skip: any)
{


;

;

return;
}
fun PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1827302150(PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1827302150__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_959498917(PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_959498917__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_2146901211(PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_2146901211__payload_skip: any)
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
fun PING_Init_exit0_rand_1018763598(PING_Init_exit0_rand_1018763598__payload_skip: any)
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
fun PING_SendPing_exit0_rand_35302805(PING_SendPing_exit0_rand_35302805__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_1_entry0_rand_221347957(PING_WaitPong_1_entry0_rand_221347957__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_1_exit0_rand_1276786521(PING_WaitPong_1_exit0_rand_1276786521__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_2_entry0_rand_544430477(PING_WaitPong_2_entry0_rand_544430477__payload_skip: any)
{


;

;

return;
}
fun PING_WaitPong_2_exit0_rand_986229380(PING_WaitPong_2_exit0_rand_986229380__payload_skip: any)
{


;

;

return;
}
fun PING_Done_entry0_rand_1082551994(PING_Done_entry0_rand_1082551994__payload_skip: any)
{


;

;

return;
}
fun PING_Done_exit0_rand_462355106(PING_Done_exit0_rand_462355106__payload_skip: any)
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
PING_Init_exit0_rand_1018763598(null);
}on Success goto PING_SendPing with (payload: null) {
PING_Init_on_Success_goto_PING_SendPing0_rand_209192403(payload);
}}

 state PING_SendPing
{
entry (payload: null) {
PING_SendPing_entry23(payload);
}exit {
PING_SendPing_exit0_rand_35302805(null);
}on Success goto PING_WaitPong_1 with (payload: null) {
PING_SendPing_on_Success_goto_PING_WaitPong_10_rand_1827302150(payload);
}}

 state PING_WaitPong_1
{
entry (payload: any) {
PING_WaitPong_1_entry0_rand_221347957(payload);
}exit {
PING_WaitPong_1_exit0_rand_1276786521(null);
}on Pong goto PING_WaitPong_2 with (payload: machine) {
PING_WaitPong_1_on_Pong_goto_PING_WaitPong_20_rand_959498917(payload);
}}

 state PING_WaitPong_2
{
entry (payload: any) {
PING_WaitPong_2_entry0_rand_544430477(payload);
}exit {
PING_WaitPong_2_exit0_rand_986229380(null);
}on Pong goto PING_Done with (payload: machine) {
PING_WaitPong_2_on_Pong_goto_PING_Done0_rand_2146901211(payload);
}}

 state PING_Done
{
entry (payload: any) {
PING_Done_entry0_rand_1082551994(payload);
}exit {
PING_Done_exit0_rand_462355106(null);
}}
}

machine PONG
{

fun PONG_Init_on_Ping_goto_PONG_SendPong0_rand_2114495369(PONG_Init_on_Ping_goto_PONG_SendPong0_rand_2114495369__payload_skip: any)
{


;

;

return;
}
fun PONG_SendPong_on_Success_goto_PONG_End0_rand_1971150855(PONG_SendPong_on_Success_goto_PONG_End0_rand_1971150855__payload_skip: any)
{


;

;

return;
}
fun PONG_Init_entry0_rand_1435701678(PONG_Init_entry0_rand_1435701678__payload_skip: any)
{


;

;

return;
}
fun PONG_Init_exit0_rand_178049594(PONG_Init_exit0_rand_178049594__payload_skip: any)
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
fun PONG_SendPong_exit0_rand_558949516(PONG_SendPong_exit0_rand_558949516__payload_skip: any)
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
fun PONG_End_exit0_rand_1198655806(PONG_End_exit0_rand_1198655806__payload_skip: any)
{


;

;

return;
}start 
 state PONG_Init
{
entry (payload: any) {
PONG_Init_entry0_rand_1435701678(payload);
}exit {
PONG_Init_exit0_rand_178049594(null);
}on Ping goto PONG_SendPong with (payload: machine) {
PONG_Init_on_Ping_goto_PONG_SendPong0_rand_2114495369(payload);
}}

 state PONG_SendPong
{
entry (payload: machine) {
PONG_SendPong_entry50(payload);
}exit {
PONG_SendPong_exit0_rand_558949516(null);
}on Success goto PONG_End with (payload: null) {
PONG_SendPong_on_Success_goto_PONG_End0_rand_1971150855(payload);
}}

 state PONG_End
{
entry (payload: null) {
PONG_End_entry59(payload);
}exit {
PONG_End_exit0_rand_1198655806(null);
}}
}

spec M monitors M_Ping, M_Pong 
{

fun M_ExpectPing_on_M_Ping_goto_M_ExpectPong_10_rand_1433893550(M_ExpectPing_on_M_Ping_goto_M_ExpectPong_10_rand_1433893550__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_1_on_M_Pong_goto_M_ExpectPong_20_rand_939107906(M_ExpectPong_1_on_M_Pong_goto_M_ExpectPong_20_rand_939107906__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_2_on_M_Pong_goto_M_ExpectPing0_rand_1147875011(M_ExpectPong_2_on_M_Pong_goto_M_ExpectPing0_rand_1147875011__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPing_entry0_rand_730612664(M_ExpectPing_entry0_rand_730612664__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPing_exit0_rand_1528218562(M_ExpectPing_exit0_rand_1528218562__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_1_entry0_rand_1060788727(M_ExpectPong_1_entry0_rand_1060788727__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_1_exit0_rand_224739841(M_ExpectPong_1_exit0_rand_224739841__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_2_entry0_rand_1476191116(M_ExpectPong_2_entry0_rand_1476191116__payload_skip: any)
{


;

;

return;
}
fun M_ExpectPong_2_exit0_rand_1407417534(M_ExpectPong_2_exit0_rand_1407417534__payload_skip: any)
{


;

;

return;
}start 
 state M_ExpectPing
{
entry (payload: any) {
M_ExpectPing_entry0_rand_730612664(payload);
}exit {
M_ExpectPing_exit0_rand_1528218562(null);
}on M_Ping goto M_ExpectPong_1 with (payload: null) {
M_ExpectPing_on_M_Ping_goto_M_ExpectPong_10_rand_1433893550(payload);
}}

 state M_ExpectPong_1
{
entry (payload: any) {
M_ExpectPong_1_entry0_rand_1060788727(payload);
}exit {
M_ExpectPong_1_exit0_rand_224739841(null);
}on M_Pong goto M_ExpectPong_2 with (payload: null) {
M_ExpectPong_1_on_M_Pong_goto_M_ExpectPong_20_rand_939107906(payload);
}}

 state M_ExpectPong_2
{
entry (payload: any) {
M_ExpectPong_2_entry0_rand_1476191116(payload);
}exit {
M_ExpectPong_2_exit0_rand_1407417534(null);
}on M_Pong goto M_ExpectPing with (payload: null) {
M_ExpectPong_2_on_M_Pong_goto_M_ExpectPing0_rand_1147875011(payload);
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
fun GodMachine_Init_exit0_rand_1329026714(GodMachine_Init_exit0_rand_1329026714__payload_skip: any)
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
GodMachine_Init_exit0_rand_1329026714(null);
}}
}

machine Container
{

fun Container_Init_entry0_rand_1784531722(Container_Init_entry0_rand_1784531722__payload_skip: any)
{


;

;

return;
}
fun Container_Init_exit0_rand_1457692527(Container_Init_exit0_rand_1457692527__payload_skip: any)
{


;

;

return;
}start 
 state Container_Init
{
entry (payload: any) {
Container_Init_entry0_rand_1784531722(payload);
}exit {
Container_Init_exit0_rand_1457692527(null);
}}
}

