event E;

main machine Program
{
var Program_i: int;

fun Program_Init_entry10(Program_Init_entry10__payload_0: any)
{


Program_i = 0;
;
raise E;


}
fun Program_Init_exit12()
{


assert false;


}
fun Program_Call_entry18(Program_Call_entry18__payload_2: any)
{
var _tmp1167: bool;


_tmp1167 = (Program_i == 0);
;
if(_tmp1167)
{

raise E;
;
raise E;



}
else
{

Program_i = (Program_i + 1);
;
Program_i = (Program_i + 1);



}


}
fun Program_Call_exit28()
{


assert false;
;
;


}start  state Program_Init
{entry (payload: any) {
Program_Init_entry10(payload);
}
exit  {
Program_Init_exit12();
}
}
 state Program_Call
{entry (payload: any) {
Program_Call_entry18(payload);
}
exit  {
Program_Call_exit28();
}
}
}

