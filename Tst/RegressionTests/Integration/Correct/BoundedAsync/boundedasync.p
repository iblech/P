event halt;
event null;
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

Scheduler_count = 0;

raise Resp;



}
else
{

;

;



}


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
fun Scheduler_inits_exit0_rand_325854905()
{


;


}
fun Scheduler_Sync_entry0_rand_1177682406()
{


;


}
fun Scheduler_Sync_exit39()
{


send Scheduler_p1, Resp;

send Scheduler_p2, Resp;

send Scheduler_p3, Resp;


}
fun Scheduler_inits_on_unit_goto_Scheduler_Sync0_rand_419702374()
{


;


}
fun Scheduler_Sync_on_Resp_goto_Scheduler_Sync0_rand_53684570()
{


;


}start  state Scheduler_inits
{entry  {
Scheduler_inits_entry15();
}
exit  {
Scheduler_inits_exit0_rand_325854905();
}
}
 state Scheduler_Sync
{entry  {
Scheduler_Sync_entry0_rand_1177682406();
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
fun Process__init_exit0_rand_44424345()
{


;


}
fun Process_inits_entry63()
{


Process_count = 0;


}
fun Process_inits_exit0_rand_50059822()
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

raise unit;



}
else
{

;

;



}


}
fun Process_SendCount_exit0_rand_1732791142()
{


;


}
fun Process_done_entry0_rand_2109147425()
{


;


}
fun Process_done_exit0_rand_549413035()
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
fun Process__init_on_unit_goto_Process_inits0_rand_614792518()
{


;


}
fun Process_inits_on_myCount_goto_Process_inits0_rand_974589099()
{


;


}
fun Process_inits_on_Resp_goto_Process_SendCount0_rand_1225303375()
{


;


}
fun Process_SendCount_on_unit_goto_Process_done0_rand_997114789()
{


;


}
fun Process_SendCount_on_Resp_goto_Process_SendCount0_rand_2079426280()
{


;


}start  state Process__init
{entry (payload: machine) {
Process__init_entry55(payload);
}
exit  {
Process__init_exit0_rand_44424345();
}
}
 state Process_inits
{entry  {
Process_inits_entry63();
}
exit  {
Process_inits_exit0_rand_50059822();
}
}
 state Process_SendCount
{entry  {
Process_SendCount_entry80();
}
exit  {
Process_SendCount_exit0_rand_1732791142();
}
}
 state Process_done
{entry  {
Process_done_entry0_rand_2109147425();
}
exit  {
Process_done_exit0_rand_549413035();
}
}
}

