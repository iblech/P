
main machine M
{
var M_t: (seq[int], map[int, seq[int]]);
var M_i: int;

fun M_F(): int
{
var _tmp186: bool;


_tmp186 = $;
;
if(_tmp186)
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
fun M_foo(): int
{


return (1);


}
fun M_S_entry20(M_S_entry20__payload_0: any)
{


M_t.0 += (0, 2);
;
M_t.0 += (1, 2);
;
M_i = M_F();
;
M_t.0 -= M_i;


}
fun M_S_exit0_rand_1748160418()
{


;


}start  state M_S
{entry (payload: any) {
M_S_entry20(payload);
}
exit  {
M_S_exit0_rand_1748160418();
}
}
}

