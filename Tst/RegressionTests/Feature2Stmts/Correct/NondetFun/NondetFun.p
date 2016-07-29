
main machine Test
{
var Test_x: int;
var Test_y: int;

fun Test_Foo(): bool
{
var Test_Foo_n1: bool;
var Test_Foo_n2: bool;
var Tmp46: bool;
var Tmp47: bool;
var Tmp48: bool;
var Tmp49: bool;


;

Tmp46 = $;
Test_Foo_n1 = Tmp46;
;

Tmp47 = $;
Test_Foo_n2 = Tmp47;
;

Tmp48 = (Test_y == 0);
Tmp49 = (Test_x == 0);
return ((((Test_x < Test_y) && Test_Foo_n1) && ((!(Tmp48) || !(Tmp49)) || Test_Foo_n2)));
}
fun Test_Baz(): bool
{
var Tmp50: bool;


;

Tmp50 = Test_Foo();
return (Tmp50);
}
fun Test_Bar(): bool
{
var Tmp51: bool;


;

Test_x = (Test_x + 1);
;

if((Test_x >= 5))
{

;

return (false);

}
else
{

;

;


}

;

Tmp51 = $;
return (Tmp51);
}
fun Test_Init_entry28(Test_Init_entry28__payload_0: null)
{
var Tmp52: bool;
var Tmp53: bool;
var Tmp54: bool;


;

Tmp52 = Test_Foo();
if(Tmp52)
{

;

Test_x = (Test_x + 1);

}
else
{

;

;


}

;

Tmp53 = (Test_x == 0);
assert Tmp53;
;

Tmp54 = Test_Bar();
while(Tmp54)
{

;

;


}

;

assert (Test_x <= 5);
return;
}
fun Test_Init_exit0_rand_57172423(Test_Init_exit0_rand_57172423__payload_skip: any)
{


;

;

return;
}start 
 state Test_Init
{
entry (payload: null) {
Test_Init_entry28(payload);
}exit {
Test_Init_exit0_rand_57172423(null);
}}
}

