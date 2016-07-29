event E;

main machine Program
{
var Program_i: int;

fun Program_Init_entry7(Program_Init_entry7__payload_0: null)
{


;

Program_i = 0;
;

raise E;
return;
}
fun Program_Init_exit11(Program_Init_exit11__payload_1: null)
{


;

assert false;
return;
}
fun Program_Call_entry17(Program_Call_entry17__payload_2: null)
{
var Tmp0: bool;


;

Tmp0 = (Program_i == 3);
if(Tmp0)
{

;

pop;

}
else
{

;

Program_i = (Program_i + 1);

}

;

raise E;
return;
}
fun Program_Call_exit0_rand_2044965935(Program_Call_exit0_rand_2044965935__payload_skip: any)
{


;

;

return;
}start 
 state Program_Init
{
entry (payload: null) {
Program_Init_entry7(payload);
}exit {
Program_Init_exit11(null);
}on E push Program_Call;}

 state Program_Call
{
entry (payload: null) {
Program_Call_entry17(payload);
}exit {
Program_Call_exit0_rand_2044965935(null);
}}
}

