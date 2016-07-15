event PING  assert 1: int;
event PONG  assert 1: int;
event SUCCESS: int;

main machine Client
{
var Client_server: machine;
var Client_count: int;

fun Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_770704646()
{


;

}
fun Client_SendPing_on_PONG_goto_Client_SendPing0_rand_894712846()
{


;

}
fun Client_Init_entry10()
{
var Tmp34: machine;


Client_count = 0;
Tmp34 = new Server(this);
Client_server = Tmp34;
raise SUCCESS, 0;
}
fun Client_Init_exit0_rand_201418520()
{


;

}
fun Client_SendPing_entry19(Client_SendPing_entry19_v: int)
{


if((Client_count < 10))
{

send Client_server, PING, Client_SendPing_entry19_v;
Client_count = (Client_count + 1);

}
else
{

;


}

}
fun Client_SendPing_exit0_rand_512669891()
{


;

}start 
 state Client_Init
{
entry  {
Client_Init_entry10();
}
exit  {
Client_Init_exit0_rand_201418520();
}
on SUCCESS goto Client_SendPing with  (payload: int) {
Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_770704646();
}
}

 state Client_SendPing
{
entry (payload: int) {
Client_SendPing_entry19(payload);
}
exit  {
Client_SendPing_exit0_rand_512669891();
}
on PONG goto Client_SendPing with  (payload: int) {
Client_SendPing_on_PONG_goto_Client_SendPing0_rand_894712846();
}
}
}

machine Server
{
var Server_client: machine;

fun Server_Init_on_PING_goto_Server_SendPong0_rand_58329089()
{


;

}
fun Server_SendPong_on_PING_goto_Server_SendPong0_rand_2126455177()
{


;

}
fun Server_Init_entry33(Server_Init_entry33_x: machine)
{


Server_client = Server_Init_entry33_x;
}
fun Server_Init_exit0_rand_1657554687()
{


;

}
fun Server_SendPong_entry40(Server_SendPong_entry40_v: int)
{


send Server_client, PONG, Server_SendPong_entry40_v;
}
fun Server_SendPong_exit0_rand_1630201036()
{


;

}start 
 state Server_Init
{
entry (payload: machine) {
Server_Init_entry33(payload);
}
exit  {
Server_Init_exit0_rand_1657554687();
}
on PING goto Server_SendPong with  (payload: int) {
Server_Init_on_PING_goto_Server_SendPong0_rand_58329089();
}
}

 state Server_SendPong
{
entry (payload: int) {
Server_SendPong_entry40(payload);
}
exit  {
Server_SendPong_exit0_rand_1630201036();
}
on PING goto Server_SendPong with  (payload: int) {
Server_SendPong_on_PING_goto_Server_SendPong0_rand_2126455177();
}
}
}

