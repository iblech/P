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
var _tmp963: bool;


Scheduler_count = (Scheduler_count + 1);

_tmp963 = (Scheduler_count == 3);

if(_tmp963)
{

Scheduler_count = 0;

raise Resp;

Scheduler_count = 0;

raise Resp;



}
else
{

;

;



}


}
fun Scheduler_inits_entry15(Scheduler_inits_entry15__payload_0: any)
{
var _tmp964: machine;
var _tmp965: machine;
var _tmp966: machine;
var _tmp967: (machine, machine);
var _tmp968: (machine, machine);
var _tmp969: (machine, machine);


_tmp964 = new Process(this);

Scheduler_p1 = _tmp964;

_tmp965 = new Process(this);

Scheduler_p2 = _tmp965;

_tmp966 = new Process(this);

Scheduler_p3 = _tmp966;

_tmp967 = (Scheduler_p3, Scheduler_p2);

send Scheduler_p1, init, _tmp967;

_tmp968 = (Scheduler_p3, Scheduler_p1);

send Scheduler_p2, init, _tmp968;

_tmp969 = (Scheduler_p1, Scheduler_p2);

send Scheduler_p3, init, _tmp969;

Scheduler_count = 0;

raise unit;


}
fun Scheduler_inits_exit0_rand_1380539470()
{


;


}
fun Scheduler_Sync_entry0_rand_1359706831(Scheduler_Sync_entry0_rand_1359706831__payload_skip: any)
{


;


}
fun Scheduler_Sync_exit39()
{


send Scheduler_p1, Resp;

send Scheduler_p2, Resp;

send Scheduler_p3, Resp;


}
fun Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_383344497(Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_383344497__payload_skip: any)
{


;


}
fun Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_321901050(Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_321901050__payload_skip: any)
{


;


}start  state Scheduler_inits
{entry (payload: any) {
Scheduler_inits_entry15(payload);
}
exit  {
Scheduler_inits_exit0_rand_1380539470();
}
}
 state Scheduler_Sync
{entry (payload: any) {
Scheduler_Sync_entry0_rand_1359706831(payload);
}
exit  {
Scheduler_Sync_exit39();
}
}
}

machine Process
{
var Process_count: int;
var Process_parent: machine;
var Process_other1: machine;
var Process_other2: machine;

fun Process_initaction(Process_initaction_payload: (machine, machine))
{


Process_other1 = Process_initaction_payload.0;

Process_other2 = Process_initaction_payload.1;

send Process_parent, Req;


}
fun Process_ConfirmThatInSync(Process_ConfirmThatInSync_payload: int)
{


assert ((Process_count <= Process_ConfirmThatInSync_payload) && (Process_count >= (Process_ConfirmThatInSync_payload - 1)));


}
fun Process__init_entry55(Process__init_entry55_payload: machine)
{


Process_parent = Process__init_entry55_payload;

raise unit;


}
fun Process__init_exit0_rand_1157573025()
{


;


}
fun Process_inits_entry63(Process_inits_entry63__payload_2: any)
{


Process_count = 0;


}
fun Process_inits_exit0_rand_1876656508()
{


;


}
fun Process_SendCount_entry80(Process_SendCount_entry80__payload_3: any)
{


Process_count = (Process_count + 1);

send Process_other1, myCount, Process_count;

send Process_other2, myCount, Process_count;

send Process_parent, Req;

if((Process_count > 10))
{

raise unit;

raise unit;



}
else
{

;

;



}


}
fun Process_SendCount_exit0_rand_242923155()
{


;


}
fun Process_done_entry0_rand_966261157(Process_done_entry0_rand_966261157__payload_skip: any)
{


;


}
fun Process_done_exit0_rand_291123966()
{


;


}
fun Process_inits_do_init66(Process_inits_do_init66_payload: (machine, machine))
{


Process_initaction(Process_inits_do_init66_payload);


}
fun Process_SendCount_do_myCount91(Process_SendCount_do_myCount91_payload: int)
{


Process_ConfirmThatInSync(Process_SendCount_do_myCount91_payload);


}
fun Process__init_on_unit_goto_Process_inits0_rand_782697646(Process__init_on_unit_goto_Process_inits0_rand_782697646__payload_skip: any)
{


;


}
fun Process_inits_on_myCount_goto_Process_inits0_rand_1407299781(Process_inits_on_myCount_goto_Process_inits0_rand_1407299781__payload_skip: any)
{


;


}
fun Process_inits_on_Resp_goto_Process_SendCount0_rand_1300047062(Process_inits_on_Resp_goto_Process_SendCount0_rand_1300047062__payload_skip: any)
{


;


}
fun Process_SendCount_on_unit_goto_Process_done0_rand_1527046805(Process_SendCount_on_unit_goto_Process_done0_rand_1527046805__payload_skip: any)
{


;


}
fun Process_SendCount_on_Resp_goto_Process_SendCount0_rand_1534794836(Process_SendCount_on_Resp_goto_Process_SendCount0_rand_1534794836__payload_skip: any)
{


;


}start  state Process__init
{entry (payload: machine) {
Process__init_entry55(payload);
}
exit  {
Process__init_exit0_rand_1157573025();
}
}
 state Process_inits
{entry (payload: any) {
Process_inits_entry63(payload);
}
exit  {
Process_inits_exit0_rand_1876656508();
}
}
 state Process_SendCount
{entry (payload: any) {
Process_SendCount_entry80(payload);
}
exit  {
Process_SendCount_exit0_rand_242923155();
}
}
 state Process_done
{entry (payload: any) {
Process_done_entry0_rand_966261157(payload);
}
exit  {
Process_done_exit0_rand_291123966();
}
}
}

