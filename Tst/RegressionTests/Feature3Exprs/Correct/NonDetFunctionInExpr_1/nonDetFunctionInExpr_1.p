
main machine M
{
var M_x: ((int));
var M_i: int;

fun M_F(): int
{
var _tmp187: bool;


_tmp187 = $;
;
if(_tmp187)
{

return (0);
;
return (0);



}
else
{

return (1);
;
return (1);



}


}
fun M_S_entry15(M_S_entry15__payload_0: any)
{
var _tmp188: bool;
var _tmp189: bool;


M_i = M_F();
;
M_x.0.0 = M_i;
;
_tmp188 = (M_x.0.0 == 0);
;
_tmp189 = (M_x.0.0 == 1);
;
assert (_tmp188 || _tmp189);


}
fun M_S_exit0_rand_996563880()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry15(payload);
}
exit  {
M_S_exit0_rand_996563880();
}
}
}

