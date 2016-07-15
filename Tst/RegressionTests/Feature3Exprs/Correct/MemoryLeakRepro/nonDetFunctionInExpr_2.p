
main machine M
{
var M_t: (seq[int], map[int, seq[int]]);
var M_i: int;

fun M_F(): int
{
var _tmp169: bool;


_tmp169 = $;
if(_tmp169)
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
fun M_S_exit0_rand_805118578()
{


;

}start  state M_S
{entry  {
M_S_entry20();
}
exit  {
M_S_exit0_rand_805118578();
}
}
}

