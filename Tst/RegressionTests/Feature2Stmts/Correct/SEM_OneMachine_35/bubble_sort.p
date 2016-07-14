event halt;
event null;

main machine Entry
{
var Entry_sorted: seq[int];
var Entry_rev: seq[int];
var Entry_s: int;
var Entry_t: int;
var Entry_i: int;
var Entry_b: bool;
var Entry_swapped: bool;

model fun Entry_reverse(Entry_reverse_l: seq[int]): seq[int]
{
var _tmp59: int;


Entry_i = 0;

Entry_s = sizeof(Entry_reverse_l);

while((Entry_i < Entry_s))
{

_tmp59 = Entry_reverse_l[Entry_i];

Entry_t = _tmp59;

Entry_reverse_l -= Entry_i;

Entry_reverse_l += (0, Entry_t);

Entry_i = (Entry_i + 1);

Entry_t = Entry_reverse_l[Entry_i];

Entry_reverse_l -= Entry_i;

Entry_reverse_l += (0, Entry_t);

Entry_i = (Entry_i + 1);



}

return (Entry_reverse_l);


}
model fun Entry_BubbleSort(Entry_BubbleSort_l: seq[int]): seq[int]
{
var _tmp60: int;
var _tmp61: int;
var _tmp62: int;
var _tmp63: int;


Entry_swapped = true;

while(Entry_swapped)
{

Entry_i = 0;

Entry_swapped = false;

while((Entry_i < (sizeof(Entry_BubbleSort_l) - 1)))
{

_tmp60 = Entry_BubbleSort_l[Entry_i];

_tmp61 = Entry_BubbleSort_l[(Entry_i + 1)];

if((_tmp60 > _tmp61))
{

_tmp62 = Entry_BubbleSort_l[Entry_i];

Entry_t = _tmp62;

_tmp63 = Entry_BubbleSort_l[(Entry_i + 1)];

Entry_BubbleSort_l[Entry_i] = _tmp63;

Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;

Entry_swapped = true;

Entry_t = Entry_BubbleSort_l[Entry_i];

Entry_BubbleSort_l[Entry_i] = Entry_BubbleSort_l[(Entry_i + 1)];

Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;

Entry_swapped = true;



}
else
{

;

;



}

Entry_i = (Entry_i + 1);

if((Entry_BubbleSort_l[Entry_i] > Entry_BubbleSort_l[(Entry_i + 1)]))
{

Entry_t = Entry_BubbleSort_l[Entry_i];

Entry_BubbleSort_l[Entry_i] = Entry_BubbleSort_l[(Entry_i + 1)];

Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;

Entry_swapped = true;



}
else
{
;

}

Entry_i = (Entry_i + 1);



}

Entry_i = 0;

Entry_swapped = false;

while((Entry_i < (sizeof(Entry_BubbleSort_l) - 1)))
{

if((Entry_BubbleSort_l[Entry_i] > Entry_BubbleSort_l[(Entry_i + 1)]))
{

Entry_t = Entry_BubbleSort_l[Entry_i];

Entry_BubbleSort_l[Entry_i] = Entry_BubbleSort_l[(Entry_i + 1)];

Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;

Entry_swapped = true;



}
else
{
;

}

Entry_i = (Entry_i + 1);



}



}

return (Entry_BubbleSort_l);


}
model fun Entry_IsSorted(Entry_IsSorted_l: seq[int]): bool
{
var _tmp64: int;
var _tmp65: int;


Entry_i = 0;

while((Entry_i < (sizeof(Entry_IsSorted_l) - 1)))
{

_tmp64 = Entry_IsSorted_l[Entry_i];

_tmp65 = Entry_IsSorted_l[(Entry_i + 1)];

if((_tmp64 > _tmp65))
{

return (false);

return (false);



}
else
{

;

;



}

Entry_i = (Entry_i + 1);

if((Entry_IsSorted_l[Entry_i] > Entry_IsSorted_l[(Entry_i + 1)]))
{
return (false);

}
else
{
;

}

Entry_i = (Entry_i + 1);



}

return (true);


}
fun Entry_init_entry52()
{
var _tmp66: bool;
var _tmp67: bool;


Entry_i = 0;

while((Entry_i < 10))
{

Entry_rev += (0, Entry_i);

Entry_sorted += (sizeof(Entry_sorted), Entry_i);

Entry_i = (Entry_i + 1);

Entry_rev += (0, Entry_i);

Entry_sorted += (sizeof(Entry_sorted), Entry_i);

Entry_i = (Entry_i + 1);



}

_tmp66 = (sizeof(Entry_rev) == 10);

assert _tmp66;

Entry_sorted = Entry_reverse(Entry_rev);

Entry_b = Entry_IsSorted(Entry_sorted);

assert Entry_b;

Entry_b = Entry_IsSorted(Entry_rev);

assert !(Entry_b);

Entry_sorted = Entry_BubbleSort(Entry_rev);

_tmp67 = (sizeof(Entry_sorted) == 10);

assert _tmp67;

Entry_b = Entry_IsSorted(Entry_sorted);

assert Entry_b;

Entry_b = Entry_IsSorted(Entry_rev);

assert !(Entry_b);


}
fun Entry_init_exit0_rand_1319002430()
{


;


}start  state Entry_init
{entry  {
Entry_init_entry52();
}
exit  {
Entry_init_exit0_rand_1319002430();
}
}
}

