event E;

main machine Program
{
var Program_i: int;

fun Program_Init_entry10()
{


Program_i = 0;
raise E;
}
fun Program_Init_exit12()
{


assert false;
}
fun Program_Call_entry18()
{
var _tmp585: bool;


_tmp585 = (Program_i == 0);
if(_tmp585)
{

raise E;

}
else
{

Program_i = (Program_i + 1);

}

}
fun Program_Call_exit28()
{


assert false;
;

}start  state Program_Init
{entry  {
Program_Init_entry10();
}
exit  {
Program_Init_exit12();
}
on E push Program_Call;}
 state Program_Call
{entry  {
Program_Call_entry18();
}
exit  {
Program_Call_exit28();
}
ignore E;}
}

