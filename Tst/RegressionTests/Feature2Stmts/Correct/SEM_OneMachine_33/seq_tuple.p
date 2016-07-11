event unit;
event seqpayload: seq[int];

main machine Entry
{
var Entry_l: seq[int];
var Entry_i: int;
var Entry_mac: machine;
var Entry_t: (seq[int], int);

fun Entry_init_entry12(Entry_init_entry12__payload_0: any)
{
var _tmp63: (seq[int], int);
var _tmp64: machine;


Entry_l += (0, 12);

Entry_l += (0, 23);

Entry_l += (0, 12);

Entry_l += (0, 23);

Entry_l += (0, 12);

Entry_l += (0, 23);

_tmp63 = (Entry_l, 1);

_tmp64 = new test(_tmp63);

Entry_mac = _tmp64;

send Entry_mac, seqpayload, Entry_l;


}
fun Entry_init_exit0_rand_160618285()
{


;


}start  state Entry_init
{entry (payload: any) {
Entry_init_entry12(payload);
}
exit  {
Entry_init_exit0_rand_160618285();
}
}
}

machine test
{
var test_ii: seq[int];
var test_rec: seq[int];
var test_i: int;

fun test_init_entry30(test_init_entry30_payload: (seq[int], int))
{
var _tmp65: int;
var _tmp66: bool;
var _tmp67: bool;


test_ii = test_init_entry30_payload.0;

_tmp65 = test_init_entry30_payload.0[0];

_tmp66 = (_tmp65 == 23);

assert _tmp66;

_tmp67 = (test_init_entry30_payload.1 == 1);

assert _tmp67;


}
fun test_init_exit0_rand_579801220()
{


;


}
fun test_testitnow_entry39(test_testitnow_entry39_payload: seq[int])
{
var _tmp68: int;
var _tmp69: int;
var _tmp70: bool;


test_rec = test_testitnow_entry39_payload;

test_i = (sizeof(test_rec) - 1);

while((test_i >= 0))
{

_tmp68 = test_rec[test_i];

_tmp69 = test_ii[test_i];

_tmp70 = (_tmp68 == _tmp69);

assert _tmp70;

test_i = (test_i - 1);

assert (test_rec[test_i] == test_ii[test_i]);

test_i = (test_i - 1);



}


}
fun test_testitnow_exit0_rand_2128876318()
{


;


}
fun test_init_on_seqpayload_goto_test_testitnow0_rand_1420773118(test_init_on_seqpayload_goto_test_testitnow0_rand_1420773118__payload_skip: any)
{


;


}start  state test_init
{entry (payload: (seq[int], int)) {
test_init_entry30(payload);
}
exit  {
test_init_exit0_rand_579801220();
}
}
 state test_testitnow
{entry (payload: seq[int]) {
test_testitnow_entry39(payload);
}
exit  {
test_testitnow_exit0_rand_2128876318();
}
}
}

