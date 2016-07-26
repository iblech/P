
main machine M
{
var M_t: (seq[int], map[int, seq[int]]);
var M_i: int;

fun M_F(): int
{
var Tmp213: bool;


;

Tmp213 = $;
if(Tmp213)
{

;

return (0);

}
else
{

;

return (1);

}

}
fun M_foo(): int
{


;

return (1);
}
fun M_S_entry20(M_S_entry20__payload_0: null)
{


;

M_t.0 += (0, 2);
;

M_t.0 += (1, 2);
;

M_i = M_F();
;

M_t.0 -= M_i;
return;
}
fun M_S_exit0_rand_1228280317(M_S_exit0_rand_1228280317__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry20(payload);
}exit {
M_S_exit0_rand_1228280317(null);
}}
}

