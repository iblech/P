event E;

main machine Program
{
var Program_i: int;

fun Program_Init_entry10(Program_Init_entry10__payload_0: null)
{


;

Program_i = 0;
;

raise E;
return;
}
fun Program_Init_exit12(Program_Init_exit12__payload_1: null)
{


;

assert false;
return;
}
fun Program_Call_entry18(Program_Call_entry18__payload_2: null)
{
var Tmp652: bool;


;

Tmp652 = (Program_i == 0);
if(Tmp652)
{

;

raise E;

}
else
{

;

Program_i = (Program_i + 1);

}

return;
}
fun Program_Call_exit28(Program_Call_exit28__payload_3: null)
{


;

assert false;
;

;

return;
}start 
 state Program_Init
{
entry (payload: null) {
Program_Init_entry10(payload);
}exit {
Program_Init_exit12(null);
}on E push Program_Call;}

 state Program_Call
{
entry (payload: null) {
Program_Call_entry18(payload);
}exit {
Program_Call_exit28(null);
}ignore E;}
}

