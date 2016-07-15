
main machine M
{
var M_x: ((int));
var M_i: int;

fun M_F(): int
{
var _tmp170: bool;


_tmp170 = $;
if(_tmp170)
{

return (0);

}
else
{

return (1);

}

}
fun M_S_entry15()
{
var _tmp171: bool;
var _tmp172: bool;


M_i = M_F();
M_x.0.0 = M_i;
_tmp171 = (M_x.0.0 == 0);
_tmp172 = (M_x.0.0 == 1);
assert (_tmp171 || _tmp172);
}
fun M_S_exit0_rand_1019189420()
{


;

}start  state M_S
{entry  {
M_S_entry15();
}
exit  {
M_S_exit0_rand_1019189420();
}
}
}

