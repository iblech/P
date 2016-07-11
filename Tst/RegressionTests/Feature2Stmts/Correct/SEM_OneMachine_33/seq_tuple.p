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
var _tmp64: (seq[int], int);
var _tmp65: machine;


Entry_l += (0, 12);
;
Entry_l += (0, 23);
;
Entry_l += (0, 12);
;
Entry_l += (0, 23);
;
Entry_l += (0, 12);
;
Entry_l += (0, 23);
;
_tmp64 = (Entry_l, 1);
;
_tmp65 = new test(_tmp64);
;
Entry_mac = _tmp65;
;
send Entry_mac, seqpayload, Entry_l;


}
fun Entry_init_exit0_rand_279827602()
{


;


}start  state Entry_init
{entry (payload: any) {
Entry_init_entry12(payload);
}
exit  {
Entry_init_exit0_rand_279827602();
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
var _tmp66: int;
var _tmp67: bool;
var _tmp68: bool;


test_ii = test_init_entry30_payload.0;
;
_tmp66 = test_init_entry30_payload.0[0];
;
_tmp67 = (_tmp66 == 23);
;
assert _tmp67;
;
_tmp68 = (test_init_entry30_payload.1 == 1);
;
assert _tmp68;


}
fun test_init_exit0_rand_489404650()
{


;


}
fun test_testitnow_entry39(test_testitnow_entry39_payload: seq[int])
{
var _tmp69: int;
var _tmp70: int;
var _tmp71: bool;


test_rec = test_testitnow_entry39_payload;
;
test_i = (sizeof(test_rec) - 1);
;
while((test_i >= 0))
{

_tmp69 = test_rec[test_i];
;
_tmp70 = test_ii[test_i];
;
_tmp71 = (_tmp69 == _tmp70);
;
assert _tmp71;
;
test_i = (test_i - 1);
;
assert (test_rec[test_i] == test_ii[test_i]);
;
test_i = (test_i - 1);



}


}
fun test_testitnow_exit0_rand_1837551144()
{


;


}
fun test_init_on_seqpayload_goto_test_testitnow0_rand_389109676(test_init_on_seqpayload_goto_test_testitnow0_rand_389109676__payload_skip: any)
{


;


}start  state test_init
{entry (payload: (seq[int], int)) {
test_init_entry30(payload);
}
exit  {
test_init_exit0_rand_489404650();
}
}
 state test_testitnow
{entry (payload: seq[int]) {
test_testitnow_entry39(payload);
}
exit  {
test_testitnow_exit0_rand_1837551144();
}
}
}

