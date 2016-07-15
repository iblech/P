event Ping  assert 1: machine;
event Pong  assert 1;
event Success;
event PingIgnored;

main machine PING
{
var PING_pongId: machine;
var PING_count: int;

fun PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_329969015()
{


;

}
fun PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_2104847515()
{


;

}
fun PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_37050492()
{


;

}
fun PING_Ping_Init_entry14()
{
var Tmp587: machine;


Tmp587 = new PONG(null);
PING_pongId = Tmp587;
raise Success;
}
fun PING_Ping_Init_exit0_rand_1774108840()
{


;

}
fun PING_Ping_SendPing_entry22()
{
var Tmp588: bool;
var Tmp589: bool;


PING_count = (PING_count + 1);
Tmp588 = (PING_count == 1);
if(Tmp588)
{

send PING_pongId, Ping, this;

}
else
{

;


}

Tmp589 = (PING_count == 2);
if(Tmp589)
{

send PING_pongId, halt;
send PING_pongId, PingIgnored;

}
else
{

;


}

raise Success;
}
fun PING_Ping_SendPing_exit0_rand_432400603()
{


;

}
fun PING_Ping_WaitPong_entry0_rand_825346921()
{


;

}
fun PING_Ping_WaitPong_exit0_rand_546556521()
{


;

}
fun PING_Done_entry0_rand_1477711080()
{


;

}
fun PING_Done_exit0_rand_1730779179()
{


;

}start 
 state PING_Ping_Init
{
entry  {
PING_Ping_Init_entry14();
}
exit  {
PING_Ping_Init_exit0_rand_1774108840();
}
on Success goto PING_Ping_SendPing with   {
PING_Ping_Init_on_Success_goto_PING_Ping_SendPing0_rand_329969015();
}
}

 state PING_Ping_SendPing
{
entry  {
PING_Ping_SendPing_entry22();
}
exit  {
PING_Ping_SendPing_exit0_rand_432400603();
}
on Success goto PING_Ping_WaitPong with   {
PING_Ping_SendPing_on_Success_goto_PING_Ping_WaitPong0_rand_2104847515();
}
}

 state PING_Ping_WaitPong
{
entry  {
PING_Ping_WaitPong_entry0_rand_825346921();
}
exit  {
PING_Ping_WaitPong_exit0_rand_546556521();
}
on Pong goto PING_Ping_SendPing with   {
PING_Ping_WaitPong_on_Pong_goto_PING_Ping_SendPing0_rand_37050492();
}
}

 state PING_Done
{
entry  {
PING_Done_entry0_rand_1477711080();
}
exit  {
PING_Done_exit0_rand_1730779179();
}
}
}

machine PONG
{

fun PONG_Pong_WaitPing_do_PingIgnored48()
{


assert false;
}
fun PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_103768896()
{


;

}
fun PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1108494716()
{


;

}
fun PONG_Pong_WaitPing_entry0_rand_48686652()
{


;

}
fun PONG_Pong_WaitPing_exit0_rand_1721828807()
{


;

}
fun PONG_Pong_SendPong_entry53(PONG_Pong_SendPong_entry53_payload: machine)
{


send PONG_Pong_SendPong_entry53_payload, Pong;
raise Success;
}
fun PONG_Pong_SendPong_exit0_rand_810999487()
{


;

}start 
 state PONG_Pong_WaitPing
{
entry  {
PONG_Pong_WaitPing_entry0_rand_48686652();
}
exit  {
PONG_Pong_WaitPing_exit0_rand_1721828807();
}
on PingIgnored do   {
PONG_Pong_WaitPing_do_PingIgnored48();
}
on Ping goto PONG_Pong_SendPong with  (payload: machine) {
PONG_Pong_WaitPing_on_Ping_goto_PONG_Pong_SendPong0_rand_103768896();
}
}

 state PONG_Pong_SendPong
{
entry (payload: machine) {
PONG_Pong_SendPong_entry53(payload);
}
exit  {
PONG_Pong_SendPong_exit0_rand_810999487();
}
on Success goto PONG_Pong_WaitPing with   {
PONG_Pong_SendPong_on_Success_goto_PONG_Pong_WaitPing0_rand_1108494716();
}
}
}

