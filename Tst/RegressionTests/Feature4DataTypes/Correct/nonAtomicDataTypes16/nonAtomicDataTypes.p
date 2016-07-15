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
var _tmp361: bool;
var _tmp362: bool;
var _tmp363: bool;
var _tmp364: bool;
var _tmp365: bool;
var _tmp366: bool;
var _tmp367: bool;
var _tmp368: bool;


M_y = 2;
_tmp361 = (M_y == 2);
assert _tmp361;
M_y = default(int);
_tmp362 = (M_y == 0);
assert _tmp362;
M_b = true;
_tmp363 = (M_b == true);
assert _tmp363;
M_b = default(bool);
_tmp364 = (M_b == false);
assert _tmp364;
M_e = E;
_tmp365 = (M_e == E);
assert _tmp365;
M_e = default(event);
_tmp366 = (M_e == null);
assert _tmp366;
M_mac = this;
M_mac = default(machine);
_tmp367 = (M_mac == null);
assert _tmp367;
M_a = true;
M_a = default(any);
_tmp368 = (M_a == null);
if(_tmp368)
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
fun M_S_exit0_rand_661809543()
{


;

}start  state M_S
{entry  {
M_S_entry22();
}
exit  {
M_S_exit0_rand_661809543();
}
}
}

