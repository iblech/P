event unit;
event seqpayload: seq[int];

main machine Entry
{
var Entry_l: seq[int];
var Entry_i: int;
var Entry_mac: machine;
var Entry_t: (seq[int], int);

fun Entry_init_entry12(Entry_init_entry12__payload_0: null)
{
var Tmp83: (seq[int], int);
var Tmp84: machine;


;

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

Tmp83 = (Entry_l, 1);
Tmp84 = new test(Tmp83);
Entry_mac = Tmp84;
;

send Entry_mac, seqpayload, Entry_l;
return;
}
fun Entry_init_exit0_rand_1253847031(Entry_init_exit0_rand_1253847031__payload_skip: any)
{


;

;

return;
}start 
 state Entry_init
{
entry (payload: null) {
Entry_init_entry12(payload);
}exit {
Entry_init_exit0_rand_1253847031(null);
}}
}

machine test
{
var test_ii: seq[int];
var test_rec: seq[int];
var test_i: int;

fun test_init_on_seqpayload_goto_test_testitnow0_rand_645293356(test_init_on_seqpayload_goto_test_testitnow0_rand_645293356__payload_skip: any)
{


;

;

return;
}
fun test_init_entry30(test_init_entry30_payload: (seq[int], int))
{
var Tmp85: int;
var Tmp86: bool;
var Tmp87: bool;


;

test_ii = test_init_entry30_payload.0;
;

Tmp85 = test_init_entry30_payload.0[0];
Tmp86 = (Tmp85 == 23);
assert Tmp86;
;

Tmp87 = (test_init_entry30_payload.1 == 1);
assert Tmp87;
return;
}
fun test_init_exit0_rand_1876467334(test_init_exit0_rand_1876467334__payload_skip: any)
{


;

;

return;
}
fun test_testitnow_entry39(test_testitnow_entry39_payload: seq[int])
{
var Tmp88: int;
var Tmp89: int;
var Tmp90: bool;


;

test_rec = test_testitnow_entry39_payload;
;

test_i = (sizeof(test_rec) - 1);
;

while((test_i >= 0))
{

;

Tmp88 = test_rec[test_i];
Tmp89 = test_ii[test_i];
Tmp90 = (Tmp88 == Tmp89);
assert Tmp90;
;

test_i = (test_i - 1);

}

return;
}
fun test_testitnow_exit0_rand_1324252278(test_testitnow_exit0_rand_1324252278__payload_skip: any)
{


;

;

return;
}start 
 state test_init
{
entry (payload: (seq[int], int)) {
test_init_entry30(payload);
}exit {
test_init_exit0_rand_1876467334(null);
}on seqpayload goto test_testitnow with (payload: seq[int]) {
test_init_on_seqpayload_goto_test_testitnow0_rand_645293356(payload);
}}

 state test_testitnow
{
entry (payload: seq[int]) {
test_testitnow_entry39(payload);
}exit {
test_testitnow_exit0_rand_1324252278(null);
}}
}

