event halt;
event null;
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
var _tmp350: bool;
var _tmp351: bool;
var _tmp352: bool;
var _tmp353: bool;
var _tmp354: bool;
var _tmp355: bool;
var _tmp356: bool;
var _tmp357: bool;
var _tmp358: bool;


M_y = 2;

_tmp350 = (M_y == 2);

assert _tmp350;

M_y = default(int);

_tmp351 = (M_y == 0);

assert _tmp351;

M_b = true;

_tmp352 = (M_b == true);

assert _tmp352;

M_b = default(bool);

_tmp353 = (M_b == false);

assert _tmp353;

M_e = E;

_tmp354 = (M_e == E);

assert _tmp354;

M_e = default(event);

_tmp355 = (M_e == null);

assert _tmp355;

M_mac = this;

M_mac = default(machine);

_tmp356 = (M_mac == null);

assert _tmp356;

M_a = true;

M_a = default(any);

_tmp357 = (M_a == null);

assert _tmp357;

_tmp358 = (M_a == null);

if(_tmp358)
{

M_a = 1;

M_a = 1;



}
else
{

;

;



}

;

raise halt;


}
fun M_S_exit0_rand_2017427729()
{


;


}start  state M_S
{entry  {
M_S_entry23();
}
exit  {
M_S_exit0_rand_2017427729();
}
}
}

