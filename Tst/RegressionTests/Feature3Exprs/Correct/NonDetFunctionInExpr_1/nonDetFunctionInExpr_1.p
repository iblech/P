
main machine M
{
var M_x: ((int));
var M_i: int;

fun M_F(): int
{
var _tmp194: bool;


_tmp194 = $;

if(_tmp194)
{

return (0);

return (0);



}
else
{

return (1);

return (1);



}


}
fun M_S_entry15(M_S_entry15__payload_0: any)
{
var _tmp195: bool;
var _tmp196: bool;


M_i = M_F();

M_x.0.0 = M_i;

_tmp195 = (M_x.0.0 == 0);

_tmp196 = (M_x.0.0 == 1);

assert (_tmp195 || _tmp196);


}
fun M_S_exit0_rand_1091131844()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry15(payload);
}
exit  {
M_S_exit0_rand_1091131844();
}
}
}

