event E  assert 1;
event E1  assert 1;
event E2  assert 1;
event E3  assert 1;

main machine M
{
var M_y: int;
var M_b: bool;
var M_e: event;
var M_a: any;
var M_mac: machine;

fun M_S_entry23()
{
var Tmp350: bool;
var Tmp351: bool;
var Tmp352: bool;
var Tmp353: bool;
var Tmp354: bool;
var Tmp355: bool;
var Tmp356: bool;
var Tmp357: bool;
var Tmp358: bool;


M_y = 2;
Tmp350 = (M_y == 2);
assert Tmp350;
M_y = default(int);
Tmp351 = (M_y == 0);
assert Tmp351;
M_b = true;
Tmp352 = (M_b == true);
assert Tmp352;
M_b = default(bool);
Tmp353 = (M_b == false);
assert Tmp353;
M_e = E;
Tmp354 = (M_e == E);
assert Tmp354;
M_e = default(event);
Tmp355 = (M_e == null);
assert Tmp355;
M_mac = this;
M_mac = default(machine);
Tmp356 = (M_mac == null);
assert Tmp356;
M_a = true;
M_a = default(any);
Tmp357 = (M_a == null);
assert Tmp357;
Tmp358 = (M_a == null);
if(Tmp358)
{

M_a = 1;

}
else
{

;


}

;

raise halt;
}
fun M_S_exit0_rand_121808478()
{


;

}start 
 state M_S
{
entry  {
M_S_entry23();
}
exit  {
M_S_exit0_rand_121808478();
}
}
}

