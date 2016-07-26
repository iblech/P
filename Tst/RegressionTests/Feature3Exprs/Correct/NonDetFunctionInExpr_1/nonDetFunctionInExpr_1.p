
main machine M
{
var M_x: ((int));
var M_i: int;

fun M_F(): int
{
var Tmp215: bool;


;

Tmp215 = $;
if(Tmp215)
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
fun M_S_entry15(M_S_entry15__payload_0: null)
{
var Tmp216: bool;
var Tmp217: bool;


;

M_i = M_F();
;

M_x.0.0 = M_i;
;

Tmp216 = (M_x.0.0 == 0);
Tmp217 = (M_x.0.0 == 1);
assert (Tmp216 || Tmp217);
return;
}
fun M_S_exit0_rand_1676961516(M_S_exit0_rand_1676961516__payload_skip: any)
{


;

;

return;
}start 
 state M_S
{
entry (payload: null) {
M_S_entry15(payload);
}exit {
M_S_exit0_rand_1676961516(null);
}}
}

