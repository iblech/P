event unit;
event init: (machine, machine);
event myCount: int;
event Req;
event Resp;

main machine Scheduler
{
var Scheduler_p1: machine;
var Scheduler_p2: machine;
var Scheduler_p3: machine;
var Scheduler_count: int;

fun Scheduler_CountReq()
{
var Tmp419: bool;


;

Scheduler_count = (Scheduler_count + 1);
;

Tmp419 = (Scheduler_count == 3);
if(Tmp419)
{

;

Scheduler_count = 0;
;

raise Resp;

}
else
{

;

;


}

}
fun Scheduler_Sync_do_Req(payload: null)
{


Scheduler_CountReq();
}
fun Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_278026766(Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_278026766__payload_skip: any)
{


;

;

return;
}
fun Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_1288345639(Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_1288345639__payload_skip: any)
{


;

;

return;
}
fun Scheduler_inits_entry15(Scheduler_inits_entry15__payload_0: null)
{
var Tmp420: machine;
var Tmp421: machine;
var Tmp422: machine;
var Tmp423: (machine, machine);
var Tmp424: (machine, machine);
var Tmp425: (machine, machine);


;

Tmp420 = new Process(this);
Scheduler_p1 = Tmp420;
;

Tmp421 = new Process(this);
Scheduler_p2 = Tmp421;
;

Tmp422 = new Process(this);
Scheduler_p3 = Tmp422;
;

Tmp423 = (Scheduler_p3, Scheduler_p2);
send Scheduler_p1, init, Tmp423;
;

Tmp424 = (Scheduler_p3, Scheduler_p1);
send Scheduler_p2, init, Tmp424;
;

Tmp425 = (Scheduler_p1, Scheduler_p2);
send Scheduler_p3, init, Tmp425;
;

Scheduler_count = 0;
;

raise unit;
return;
}
fun Scheduler_inits_exit0_rand_1699752813(Scheduler_inits_exit0_rand_1699752813__payload_skip: any)
{


;

;

return;
}
fun Scheduler_Sync_entry0_rand_595653031(Scheduler_Sync_entry0_rand_595653031__payload_skip: any)
{


;

;

return;
}
fun Scheduler_Sync_exit39(Scheduler_Sync_exit39__payload_1: null)
{


;

send Scheduler_p1, Resp;
;

send Scheduler_p2, Resp;
;

send Scheduler_p3, Resp;
return;
}start 
 state Scheduler_inits
{
entry (payload: null) {
Scheduler_inits_entry15(payload);
}exit {
Scheduler_inits_exit0_rand_1699752813(null);
}on unit goto Scheduler_Sync with (payload: null) {
Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_278026766(payload);
}}

 state Scheduler_Sync
{
entry (payload: any) {
Scheduler_Sync_entry0_rand_595653031(payload);
}exit {
Scheduler_Sync_exit39(null);
}on Req do (payload: null) {
Scheduler_Sync_do_Req(payload);
}on Resp goto Scheduler_Sync with (payload: null) {
Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_1288345639(payload);
}}
}

machine Process
{
var Process_count: int;
var Process_parent: machine;
var Process_other1: machine;
var Process_other2: machine;

fun Process_initaction(Process_initaction_payload: (machine, machine))
{


;

Process_other1 = Process_initaction_payload.0;
;

Process_other2 = Process_initaction_payload.1;
;

send Process_parent, Req;
}
fun Process_ConfirmThatInSync(Process_ConfirmThatInSync_payload: int)
{


;

assert ((Process_count <= Process_ConfirmThatInSync_payload) && (Process_count >= (Process_ConfirmThatInSync_payload - 1)));
}
fun Process_inits_do_init66(Process_inits_do_init66_payload: (machine, machine))
{


;

Process_initaction(Process_inits_do_init66_payload);
return;
}
fun Process_SendCount_do_myCount91(Process_SendCount_do_myCount91_payload: int)
{


;

Process_ConfirmThatInSync(Process_SendCount_do_myCount91_payload);
return;
}
fun Process__init_on_unit_goto_Process_inits0_rand_1939074800(Process__init_on_unit_goto_Process_inits0_rand_1939074800__payload_skip: any)
{


;

;

return;
}
fun Process_inits_on_myCount_goto_Process_inits0_rand_1597785898(Process_inits_on_myCount_goto_Process_inits0_rand_1597785898__payload_skip: any)
{


;

;

return;
}
fun Process_inits_on_Resp_goto_Process_SendCount0_rand_296218507(Process_inits_on_Resp_goto_Process_SendCount0_rand_296218507__payload_skip: any)
{


;

;

return;
}
fun Process_SendCount_on_unit_goto_Process_done0_rand_676867907(Process_SendCount_on_unit_goto_Process_done0_rand_676867907__payload_skip: any)
{


;

;

return;
}
fun Process_SendCount_on_Resp_goto_Process_SendCount0_rand_1442350895(Process_SendCount_on_Resp_goto_Process_SendCount0_rand_1442350895__payload_skip: any)
{


;

;

return;
}
fun Process__init_entry55(Process__init_entry55_payload: machine)
{


;

Process_parent = Process__init_entry55_payload;
;

raise unit;
return;
}
fun Process__init_exit0_rand_102209787(Process__init_exit0_rand_102209787__payload_skip: any)
{


;

;

return;
}
fun Process_inits_entry63(Process_inits_entry63_payload: any)
{


;

Process_count = 0;
return;
}
fun Process_inits_exit0_rand_1015466670(Process_inits_exit0_rand_1015466670__payload_skip: any)
{


;

;

return;
}
fun Process_SendCount_entry80(Process_SendCount_entry80__payload_2: null)
{


;

Process_count = (Process_count + 1);
;

send Process_other1, myCount, Process_count;
;

send Process_other2, myCount, Process_count;
;

send Process_parent, Req;
;

if((Process_count > 10))
{

;

raise unit;

}
else
{

;

;


}

return;
}
fun Process_SendCount_exit0_rand_854266785(Process_SendCount_exit0_rand_854266785__payload_skip: any)
{


;

;

return;
}
fun Process_done_entry0_rand_1240710467(Process_done_entry0_rand_1240710467__payload_skip: any)
{


;

;

return;
}
fun Process_done_exit0_rand_1824220307(Process_done_exit0_rand_1824220307__payload_skip: any)
{


;

;

return;
}start 
 state Process__init
{
entry (payload: machine) {
Process__init_entry55(payload);
}exit {
Process__init_exit0_rand_102209787(null);
}on unit goto Process_inits with (payload: null) {
Process__init_on_unit_goto_Process_inits0_rand_1939074800(payload);
}}

 state Process_inits
{
entry (payload: any) {
Process_inits_entry63(payload);
}exit {
Process_inits_exit0_rand_1015466670(null);
}on init do (payload: (machine, machine)) {
Process_inits_do_init66(payload);
}on myCount goto Process_inits with (payload: int) {
Process_inits_on_myCount_goto_Process_inits0_rand_1597785898(payload);
}
on Resp goto Process_SendCount with (payload: null) {
Process_inits_on_Resp_goto_Process_SendCount0_rand_296218507(payload);
}}

 state Process_SendCount
{
entry (payload: null) {
Process_SendCount_entry80(payload);
}exit {
Process_SendCount_exit0_rand_854266785(null);
}on myCount do (payload: int) {
Process_SendCount_do_myCount91(payload);
}on unit goto Process_done with (payload: null) {
Process_SendCount_on_unit_goto_Process_done0_rand_676867907(payload);
}
on Resp goto Process_SendCount with (payload: null) {
Process_SendCount_on_Resp_goto_Process_SendCount0_rand_1442350895(payload);
}}

 state Process_done
{
entry (payload: any) {
Process_done_entry0_rand_1240710467(payload);
}exit {
Process_done_exit0_rand_1824220307(null);
}ignore Resp;
ignore myCount;}
}

