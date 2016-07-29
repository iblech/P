
main machine Entry
{
var Entry_sorted: seq[int];
var Entry_rev: seq[int];
var Entry_s: int;
var Entry_t: int;
var Entry_i: int;
var Entry_b: bool;
var Entry_swapped: bool;

fun Entry_reverse(Entry_reverse_l: seq[int]): seq[int]
{
var Tmp103: int;


;

Entry_i = 0;
;

Entry_s = sizeof(Entry_reverse_l);
;

while((Entry_i < Entry_s))
{

;

Tmp103 = Entry_reverse_l[Entry_i];
Entry_t = Tmp103;
;

Entry_reverse_l -= Entry_i;
;

Entry_reverse_l += (0, Entry_t);
;

Entry_i = (Entry_i + 1);

}

;

return (Entry_reverse_l);
}
fun Entry_BubbleSort(Entry_BubbleSort_l: seq[int]): seq[int]
{
var Tmp104: int;
var Tmp105: int;
var Tmp106: int;
var Tmp107: int;


;

Entry_swapped = true;
;

while(Entry_swapped)
{

;

Entry_i = 0;
;

Entry_swapped = false;
;

while((Entry_i < (sizeof(Entry_BubbleSort_l) - 1)))
{

;

Tmp104 = Entry_BubbleSort_l[Entry_i];
Tmp105 = Entry_BubbleSort_l[(Entry_i + 1)];
if((Tmp104 > Tmp105))
{

;

Tmp106 = Entry_BubbleSort_l[Entry_i];
Entry_t = Tmp106;
;

Tmp107 = Entry_BubbleSort_l[(Entry_i + 1)];
Entry_BubbleSort_l[Entry_i] = Tmp107;
;

Entry_BubbleSort_l[(Entry_i + 1)] = Entry_t;
;

Entry_swapped = true;

}
else
{

;

;


}

;

Entry_i = (Entry_i + 1);

}


}

;

return (Entry_BubbleSort_l);
}
fun Entry_IsSorted(Entry_IsSorted_l: seq[int]): bool
{
var Tmp108: int;
var Tmp109: int;


;

Entry_i = 0;
;

while((Entry_i < (sizeof(Entry_IsSorted_l) - 1)))
{

;

Tmp108 = Entry_IsSorted_l[Entry_i];
Tmp109 = Entry_IsSorted_l[(Entry_i + 1)];
if((Tmp108 > Tmp109))
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

Entry_i = (Entry_i + 1);

}

;

return (true);
}
fun Entry_init_entry52(Entry_init_entry52__payload_0: null)
{
var Tmp110: bool;
var Tmp111: bool;


;

Entry_i = 0;
;

while((Entry_i < 10))
{

;

Entry_rev += (0, Entry_i);
;

Entry_sorted += (sizeof(Entry_sorted), Entry_i);
;

Entry_i = (Entry_i + 1);

}

;

Tmp110 = (sizeof(Entry_rev) == 10);
assert Tmp110;
;

Entry_sorted = Entry_reverse(Entry_rev);
;

Entry_b = Entry_IsSorted(Entry_sorted);
;

assert Entry_b;
;

Entry_b = Entry_IsSorted(Entry_rev);
;

assert !(Entry_b);
;

Entry_sorted = Entry_BubbleSort(Entry_rev);
;

Tmp111 = (sizeof(Entry_sorted) == 10);
assert Tmp111;
;

Entry_b = Entry_IsSorted(Entry_sorted);
;

assert Entry_b;
;

Entry_b = Entry_IsSorted(Entry_rev);
;

assert !(Entry_b);
return;
}
fun Entry_init_exit0_rand_1657372479(Entry_init_exit0_rand_1657372479__payload_skip: any)
{


;

;

return;
}start 
 state Entry_init
{
entry (payload: null) {
Entry_init_entry52(payload);
}exit {
Entry_init_exit0_rand_1657372479(null);
}}
}

