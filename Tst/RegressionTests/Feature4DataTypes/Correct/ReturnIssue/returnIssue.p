
main machine Manager
{

fun Manager_foo()
{
var Manager_foo_s: int;


;

Manager_foo_s = Manager_bar0();
;

Manager_foo_s = Manager_bar1(1);
;

Manager_foo_s = Manager_bar2(0, 0);
}
fun Manager_bar0(): int
{


;

return (default(int));
}
fun Manager_bar1(Manager_bar1_Settings: int): int
{


;

return (default(int));
}
fun Manager_bar2(Manager_bar2_Settings: int, Manager_bar2_Settings1: int): int
{


;

return ((0 + default(int)));
}
fun Manager_Init_entry0_rand_2132096986(Manager_Init_entry0_rand_2132096986__payload_skip: any)
{


;

;

return;
}
fun Manager_Init_exit0_rand_2091738268(Manager_Init_exit0_rand_2091738268__payload_skip: any)
{


;

;

return;
}start 
 state Manager_Init
{
entry (payload: any) {
Manager_Init_entry0_rand_2132096986(payload);
}exit {
Manager_Init_exit0_rand_2091738268(null);
}}
}

