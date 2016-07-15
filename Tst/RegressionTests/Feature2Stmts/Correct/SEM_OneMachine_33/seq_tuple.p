event unit;
event seqpayload: seq[int];

main machine Entry
{
var Entry_l: seq[int];
var Entry_i: int;
var Entry_mac: machine;
var Entry_t: (seq[int], int);

fun Entry_init_entry12()
{
var _tmp39: (seq[int], int);
var _tmp40: machine;


Entry_l += (0, 12);
Entry_l += (0, 23);
Entry_l += (0, 12);
Entry_l += (0, 23);
Entry_l += (0, 12);
Entry_l += (0, 23);
_tmp39 = (Entry_l, 1);
_tmp40 = new test(_tmp39);
Entry_mac = _tmp40;
send Entry_mac, seqpayload, Entry_l;
}
fun Entry_init_exit0_rand_433482644()
{


;

}start  state Entry_init
{entry  {
Entry_init_entry12();
}
exit  {
Entry_init_exit0_rand_433482644();
}
}
}

machine test
{
var test_ii: seq[int];
var test_rec: seq[int];
var test_i: int;

fun test_init_on_seqpayload_goto_test_testitnow0_rand_1735570229()
{


;

}
fun test_init_entry30(test_init_entry30_payload: (seq[int], int))
{
var _tmp41: int;
var _tmp42: bool;
var _tmp43: bool;


test_ii = test_init_entry30_payload.0;
_tmp41 = test_init_entry30_payload.0[0];
_tmp42 = (_tmp41 == 23);
assert _tmp42;
_tmp43 = (test_init_entry30_payload.1 == 1);
assert _tmp43;
}
fun test_init_exit0_rand_1020931406()
{


;

}
fun test_testitnow_entry39(test_testitnow_entry39_payload: seq[int])
{
var _tmp44: int;
var _tmp45: int;
var _tmp46: bool;


test_rec = test_testitnow_entry39_payload;
test_i = (sizeof(test_rec) - 1);
while((test_i >= 0))
{

_tmp44 = test_rec[test_i];
_tmp45 = test_ii[test_i];
_tmp46 = (_tmp44 == _tmp45);
assert _tmp46;
test_i = (test_i - 1);

}

}
fun test_testitnow_exit0_rand_1910346734()
{


;

}start  state test_init
{entry (payload: (seq[int], int)) {
test_init_entry30(payload);
}
exit  {
test_init_exit0_rand_1020931406();
}
on seqpayload goto test_testitnow with  (payload: seq[int]) {
test_init_on_seqpayload_goto_test_testitnow0_rand_1735570229();
}
}
 state test_testitnow
{entry (payload: seq[int]) {
test_testitnow_entry39(payload);
}
exit  {
test_testitnow_exit0_rand_1910346734();
}
}
}

