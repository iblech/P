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
var _tmp217: bool;


Scheduler_count = (Scheduler_count + 1);

_tmp217 = (Scheduler_count == 3);

if(_tmp217)
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
var _tmp218: machine;
var _tmp219: machine;
var _tmp220: machine;
var _tmp221: (machine, machine);
var _tmp222: (machine, machine);
var _tmp223: (machine, machine);


_tmp218 = new Process(this);

Scheduler_p1 = _tmp218;

_tmp219 = new Process(this);

Scheduler_p2 = _tmp219;

_tmp220 = new Process(this);

Scheduler_p3 = _tmp220;

_tmp221 = (Scheduler_p3, Scheduler_p2);

send Scheduler_p1, init, _tmp221;

_tmp222 = (Scheduler_p3, Scheduler_p1);

send Scheduler_p2, init, _tmp222;

_tmp223 = (Scheduler_p1, Scheduler_p2);

send Scheduler_p3, init, _tmp223;

Scheduler_count = 0;

raise unit;


}
fun Scheduler_inits_exit0_rand_237448571()
{


;


}
fun Scheduler_Sync_entry0_rand_1241909749(Scheduler_Sync_entry0_rand_1241909749__payload_skip: any)
{


;


}
fun Scheduler_Sync_exit39()
{


send Scheduler_p1, Resp;

send Scheduler_p2, Resp;

send Scheduler_p3, Resp;


}
fun Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_1362162347(Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_1362162347__payload_skip: any)
{


;


}
fun Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_976935839(Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_976935839__payload_skip: any)
{


;


}start  state Scheduler_inits
{entry (payload: any) {
Scheduler_inits_entry15(payload);
}
exit  {
Scheduler_inits_exit0_rand_237448571();
}
}
 state Scheduler_Sync
{entry (payload: any) {
Scheduler_Sync_entry0_rand_1241909749(payload);
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
fun Process__init_exit0_rand_132358442()
{


;


}
fun Process_inits_entry63(Process_inits_entry63__payload_2: any)
{


Process_count = 0;


}
fun Process_inits_exit0_rand_1042208076()
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
fun Process_SendCount_exit0_rand_1060285785()
{


;


}
fun Process_done_entry0_rand_1402028687(Process_done_entry0_rand_1402028687__payload_skip: any)
{


;


}
fun Process_done_exit0_rand_37792645()
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
fun Process__init_on_unit_goto_Process_inits0_rand_985084844(Process__init_on_unit_goto_Process_inits0_rand_985084844__payload_skip: any)
{


;


}
fun Process_inits_on_myCount_goto_Process_inits0_rand_32343997(Process_inits_on_myCount_goto_Process_inits0_rand_32343997__payload_skip: any)
{


;


}
fun Process_inits_on_Resp_goto_Process_SendCount0_rand_553372520(Process_inits_on_Resp_goto_Process_SendCount0_rand_553372520__payload_skip: any)
{


;


}
fun Process_SendCount_on_unit_goto_Process_done0_rand_805762539(Process_SendCount_on_unit_goto_Process_done0_rand_805762539__payload_skip: any)
{


;


}
fun Process_SendCount_on_Resp_goto_Process_SendCount0_rand_1933534186(Process_SendCount_on_Resp_goto_Process_SendCount0_rand_1933534186__payload_skip: any)
{


;


}start  state Process__init
{entry (payload: machine) {
Process__init_entry55(payload);
}
exit  {
Process__init_exit0_rand_132358442();
}
}
 state Process_inits
{entry (payload: any) {
Process_inits_entry63(payload);
}
exit  {
Process_inits_exit0_rand_1042208076();
}
}
 state Process_SendCount
{entry (payload: any) {
Process_SendCount_entry80(payload);
}
exit  {
Process_SendCount_exit0_rand_1060285785();
}
}
 state Process_done
{entry (payload: any) {
Process_done_entry0_rand_1402028687(payload);
}
exit  {
Process_done_exit0_rand_37792645();
}
}
}

