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

fun M_S_entry22()
{
var Tmp361: bool;
var Tmp362: bool;
var Tmp363: bool;
var Tmp364: bool;
var Tmp365: bool;
var Tmp366: bool;
var Tmp367: bool;
var Tmp368: bool;


M_y = 2;
Tmp361 = (M_y == 2);
assert Tmp361;
M_y = default(int);
Tmp362 = (M_y == 0);
assert Tmp362;
M_b = true;
Tmp363 = (M_b == true);
assert Tmp363;
M_b = default(bool);
Tmp364 = (M_b == false);
assert Tmp364;
M_e = E;
Tmp365 = (M_e == E);
assert Tmp365;
M_e = default(event);
Tmp366 = (M_e == null);
assert Tmp366;
M_mac = this;
M_mac = default(machine);
Tmp367 = (M_mac == null);
assert Tmp367;
M_a = true;
M_a = default(any);
Tmp368 = (M_a == null);
if(Tmp368)
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
fun M_S_exit0_rand_171987812()
{


;

}start 
 state M_S
{
entry  {
M_S_entry22();
}
exit  {
M_S_exit0_rand_171987812();
}
}
}

