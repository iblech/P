
main machine M
{
var M_x: ((int));
var M_i: int;

fun M_F(): int
{
var Tmp170: bool;


Tmp170 = $;
if(Tmp170)
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
var Tmp171: bool;
var Tmp172: bool;


M_i = M_F();
M_x.0.0 = M_i;
Tmp171 = (M_x.0.0 == 0);
Tmp172 = (M_x.0.0 == 1);
assert (Tmp171 || Tmp172);
}
fun M_S_exit0_rand_42789987()
{


;

}start 
 state M_S
{
entry  {
M_S_entry15();
}
exit  {
M_S_exit0_rand_42789987();
}
}
}

