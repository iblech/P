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
var _tmp374: bool;


Scheduler_count = (Scheduler_count + 1);
_tmp374 = (Scheduler_count == 3);
if(_tmp374)
{

Scheduler_count = 0;
raise Resp;

}
else
{

;


}

}
fun Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_711715449()
{


;

}
fun Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_716258352()
{


;

}
fun Scheduler_inits_entry15()
{
var _tmp375: machine;
var _tmp376: machine;
var _tmp377: machine;
var _tmp378: (machine, machine);
var _tmp379: (machine, machine);
var _tmp380: (machine, machine);


_tmp375 = new Process(this);
Scheduler_p1 = _tmp375;
_tmp376 = new Process(this);
Scheduler_p2 = _tmp376;
_tmp377 = new Process(this);
Scheduler_p3 = _tmp377;
_tmp378 = (Scheduler_p3, Scheduler_p2);
send Scheduler_p1, init, _tmp378;
_tmp379 = (Scheduler_p3, Scheduler_p1);
send Scheduler_p2, init, _tmp379;
_tmp380 = (Scheduler_p1, Scheduler_p2);
send Scheduler_p3, init, _tmp380;
Scheduler_count = 0;
raise unit;
}
fun Scheduler_inits_exit0_rand_566248086()
{


;

}
fun Scheduler_Sync_entry0_rand_1510292126()
{


;

}
fun Scheduler_Sync_exit39()
{


send Scheduler_p1, Resp;
send Scheduler_p2, Resp;
send Scheduler_p3, Resp;
}start  state Scheduler_inits
{entry  {
Scheduler_inits_entry15();
}
exit  {
Scheduler_inits_exit0_rand_566248086();
}
on unit goto Scheduler_Sync with   {
Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_711715449();
}
}
 state Scheduler_Sync
{entry  {
Scheduler_Sync_entry0_rand_1510292126();
}
exit  {
Scheduler_Sync_exit39();
}
on Req do   {
Scheduler_CountReq();
}
on Resp goto Scheduler_Sync with   {
Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_716258352();
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
fun Process_inits_do_init66(Process_inits_do_init66_payload: (machine, machine))
{


Process_initaction(Process_inits_do_init66_payload);
}
fun Process_SendCount_do_myCount91(Process_SendCount_do_myCount91_payload: int)
{


Process_ConfirmThatInSync(Process_SendCount_do_myCount91_payload);
}
fun Process__init_on_unit_goto_Process_inits0_rand_66515521()
{


;

}
fun Process_inits_on_myCount_goto_Process_inits0_rand_1139473845()
{


;

}
fun Process_inits_on_Resp_goto_Process_SendCount0_rand_1045602598()
{


;

}
fun Process_SendCount_on_unit_goto_Process_done0_rand_628867430()
{


;

}
fun Process_SendCount_on_Resp_goto_Process_SendCount0_rand_894235152()
{


;

}
fun Process__init_entry55(Process__init_entry55_payload: machine)
{


Process_parent = Process__init_entry55_payload;
raise unit;
}
fun Process__init_exit0_rand_490939952()
{


;

}
fun Process_inits_entry63()
{


Process_count = 0;
}
fun Process_inits_exit0_rand_242277333()
{


;

}
fun Process_SendCount_entry80()
{


Process_count = (Process_count + 1);
send Process_other1, myCount, Process_count;
send Process_other2, myCount, Process_count;
send Process_parent, Req;
if((Process_count > 10))
{

raise unit;

}
else
{

;


}

}
fun Process_SendCount_exit0_rand_791213070()
{


;

}
fun Process_done_entry0_rand_1921461029()
{


;

}
fun Process_done_exit0_rand_961539274()
{


;

}start  state Process__init
{entry (payload: machine) {
Process__init_entry55(payload);
}
exit  {
Process__init_exit0_rand_490939952();
}
on unit goto Process_inits with   {
Process__init_on_unit_goto_Process_inits0_rand_66515521();
}
}
 state Process_inits
{entry  {
Process_inits_entry63();
}
exit  {
Process_inits_exit0_rand_242277333();
}
on init do  (payload: (machine, machine)) {
Process_inits_do_init66(payload);
}
on myCount goto Process_inits with  (payload: int) {
Process_inits_on_myCount_goto_Process_inits0_rand_1139473845();
}

on Resp goto Process_SendCount with   {
Process_inits_on_Resp_goto_Process_SendCount0_rand_1045602598();
}
}
 state Process_SendCount
{entry  {
Process_SendCount_entry80();
}
exit  {
Process_SendCount_exit0_rand_791213070();
}
on myCount do  (payload: int) {
Process_SendCount_do_myCount91(payload);
}
on unit goto Process_done with   {
Process_SendCount_on_unit_goto_Process_done0_rand_628867430();
}

on Resp goto Process_SendCount with   {
Process_SendCount_on_Resp_goto_Process_SendCount0_rand_894235152();
}
}
 state Process_done
{entry  {
Process_done_entry0_rand_1921461029();
}
exit  {
Process_done_exit0_rand_961539274();
}
ignore Resp;
ignore myCount;}
}

