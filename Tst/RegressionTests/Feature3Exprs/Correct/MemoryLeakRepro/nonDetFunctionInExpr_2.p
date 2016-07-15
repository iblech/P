
main machine M
{
var M_t: (seq[int], map[int, seq[int]]);
var M_i: int;

fun M_F(): int
{
var Tmp169: bool;


Tmp169 = $;
if(Tmp169)
{

return (0);

}
else
{

return (1);

}

}
fun M_foo(): int
{


return (1);
}
fun M_S_entry20()
{


M_t.0 += (0, 2);
M_t.0 += (1, 2);
M_i = M_F();
M_t.0 -= M_i;
}
fun M_S_exit0_rand_822714489()
{


;

}start 
 state M_S
{
entry  {
M_S_entry20();
}
exit  {
M_S_exit0_rand_822714489();
}
}
}

