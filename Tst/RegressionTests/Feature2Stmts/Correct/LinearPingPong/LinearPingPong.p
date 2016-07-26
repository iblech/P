event PING  assert 1: int;
event PONG  assert 1: int;
event SUCCESS: int;

main machine Client
{
var Client_server: machine;
var Client_count: int;

fun Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_1438425415(Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_1438425415__payload_skip: any)
{


;

;

return;
}
fun Client_SendPing_on_PONG_goto_Client_SendPing0_rand_960946291(Client_SendPing_on_PONG_goto_Client_SendPing0_rand_960946291__payload_skip: any)
{


;

;

return;
}
fun Client_Init_entry10(Client_Init_entry10__payload_0: null)
{
var Tmp45: machine;


;

Client_count = 0;
;

Tmp45 = new Server(this);
Client_server = Tmp45;
;

raise SUCCESS, 0;
return;
}
fun Client_Init_exit0_rand_520761659(Client_Init_exit0_rand_520761659__payload_skip: any)
{


;

;

return;
}
fun Client_SendPing_entry19(Client_SendPing_entry19_v: int)
{


;

if((Client_count < 10))
{

;

send Client_server, PING, Client_SendPing_entry19_v;
;

Client_count = (Client_count + 1);

}
else
{

;

;


}

return;
}
fun Client_SendPing_exit0_rand_1869596435(Client_SendPing_exit0_rand_1869596435__payload_skip: any)
{


;

;

return;
}start 
 state Client_Init
{
entry (payload: null) {
Client_Init_entry10(payload);
}exit {
Client_Init_exit0_rand_520761659(null);
}on SUCCESS goto Client_SendPing with (payload: int) {
Client_Init_on_SUCCESS_goto_Client_SendPing0_rand_1438425415(payload);
}}

 state Client_SendPing
{
entry (payload: int) {
Client_SendPing_entry19(payload);
}exit {
Client_SendPing_exit0_rand_1869596435(null);
}on PONG goto Client_SendPing with (payload: int) {
Client_SendPing_on_PONG_goto_Client_SendPing0_rand_960946291(payload);
}}
}

machine Server
{
var Server_client: machine;

fun Server_Init_on_PING_goto_Server_SendPong0_rand_283696927(Server_Init_on_PING_goto_Server_SendPong0_rand_283696927__payload_skip: any)
{


;

;

return;
}
fun Server_SendPong_on_PING_goto_Server_SendPong0_rand_1990448458(Server_SendPong_on_PING_goto_Server_SendPong0_rand_1990448458__payload_skip: any)
{


;

;

return;
}
fun Server_Init_entry33(Server_Init_entry33_x: machine)
{


;

Server_client = Server_Init_entry33_x;
return;
}
fun Server_Init_exit0_rand_841760087(Server_Init_exit0_rand_841760087__payload_skip: any)
{


;

;

return;
}
fun Server_SendPong_entry40(Server_SendPong_entry40_v: int)
{


;

send Server_client, PONG, Server_SendPong_entry40_v;
return;
}
fun Server_SendPong_exit0_rand_1393212475(Server_SendPong_exit0_rand_1393212475__payload_skip: any)
{


;

;

return;
}start 
 state Server_Init
{
entry (payload: machine) {
Server_Init_entry33(payload);
}exit {
Server_Init_exit0_rand_841760087(null);
}on PING goto Server_SendPong with (payload: int) {
Server_Init_on_PING_goto_Server_SendPong0_rand_283696927(payload);
}}

 state Server_SendPong
{
entry (payload: int) {
Server_SendPong_entry40(payload);
}exit {
Server_SendPong_exit0_rand_1393212475(null);
}on PING goto Server_SendPong with (payload: int) {
Server_SendPong_on_PING_goto_Server_SendPong0_rand_1990448458(payload);
}}
}

