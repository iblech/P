event ArtifactManagerGoalStateAcheived;
event ArtifactManagerGoalStateNotAcheived;
event CreateAssemblyManager;
event CreateAssemblyManagerComplete;
event ArtifactManagerInit;
event TerminateArtifactManager;
event UpdateArtifactManager;
event ArtifactManagerGoalAchieved;
event ArtifactComplete;
event ArtifactStarted;
event ArtifactRequiredNow;
event ReconcileArtifacts;
event BeginArtifact;
event ArtifactAssemblyFailed;
event BeginRemoveStaleArtifactParts;
event BeginArtifactPart;
event CancelArtifact;
event BeginArtifactMerge;
event RemoveStaleArtifactPartsComplete;
event DownloadStarted;
event DownloadComplete;
event DownloadCompleteInternal;
event ArtifactMergeComplete;
event BeginDownload;
event BeginDownloadInternal;
event CancelDownload;
event BeginClonePart;
event InitializeOperationManager;
event OperationStatusUpdate;
event OperationListUpdate;
event TerminateOperationManager;
event QueryArtifactsOperation;
event DeleteArtifactOperation;
event UpdateArtifactOperation;
event QueryArtifactPartsOperation;
event DeleteArtifactPartOperation;
event AssembleArtifactOperation;
event ClonePartFromArtifactOperation;
event DownloadArtifactPartOperation;
event AttemptCancelDownloadOperation;
event QueryArtifactsOperationComplete;
event DeleteArtifactOperationComplete;
event UpdateArtifactOperationComplete;
event QueryArtifactPartsOperationComplete;
event DeleteArtifactPartOperationComplete;
event AssembleArtifactOperationComplete;
event ClonePartFromArtifactOperationComplete;
event DownloadArtifactPartOperationComplete;
event AttemptCancelDownloadOperationComplete;

machine DownloadManagerMachine
{

fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_1854006700(DownloadManagerMachine_Begin_do_BeginDownload0_rand_1854006700__payload_0: null)
{


;

;

return;
}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1176373452(DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1176373452__payload_1: null)
{


;

;

return;
}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1107709675(DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1107709675__payload_2: null)
{


;

;

return;
}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_772810346(DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_772810346__payload_3: null)
{


;

;

return;
}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_792641459(DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_792641459__payload_4: null)
{


;

;

return;
}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1259896921(DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1259896921__payload_5: null)
{


;

;

return;
}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_250614996(DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_250614996__payload_6: null)
{


;

;

return;
}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_2049118193(DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_2049118193__payload_7: null)
{


;

;

return;
}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_396422035(DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_396422035__payload_8: null)
{


;

;

return;
}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1461737597(DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1461737597__payload_9: null)
{


;

;

return;
}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1799047676(DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1799047676__payload_10: null)
{


;

;

return;
}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_268924411(DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_268924411__payload_11: null)
{


;

;

return;
}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_101081871(DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_101081871__payload_12: null)
{


;

;

return;
}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1487606581(DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1487606581__payload_13: null)
{


;

;

return;
}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1973798459(DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1973798459__payload_14: null)
{


;

;

return;
}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1124622358(DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1124622358__payload_15: null)
{


;

;

return;
}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_987035972(DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_987035972__payload_16: null)
{


;

;

return;
}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1910225510(DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1910225510__payload_17: null)
{


;

;

return;
}
fun DownloadManagerMachine_Begin_entry0_rand_88944525(DownloadManagerMachine_Begin_entry0_rand_88944525__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_Begin_exit0_rand_1917716287(DownloadManagerMachine_Begin_exit0_rand_1917716287__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_970501115(DownloadManagerMachine_QueryingArtifacts_entry0_rand_970501115__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_84034187(DownloadManagerMachine_QueryingArtifacts_exit0_rand_84034187__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_17926057(DownloadManagerMachine_CloneArtifactPart_entry0_rand_17926057__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_448888509(DownloadManagerMachine_CloneArtifactPart_exit0_rand_448888509__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_Downloading_entry0_rand_673874176(DownloadManagerMachine_Downloading_entry0_rand_673874176__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_Downloading_exit0_rand_695842707(DownloadManagerMachine_Downloading_exit0_rand_695842707__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_Canceling_entry0_rand_1999877675(DownloadManagerMachine_Canceling_entry0_rand_1999877675__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_Canceling_exit0_rand_341310863(DownloadManagerMachine_Canceling_exit0_rand_341310863__payload_skip: any)
{


;

;

return;
}
fun DownloadManagerMachine_Complete_entry108(DownloadManagerMachine_Complete_entry108__payload_18: null)
{


;

raise halt;
return;
}
fun DownloadManagerMachine_Complete_exit0_rand_1704108593(DownloadManagerMachine_Complete_exit0_rand_1704108593__payload_skip: any)
{


;

;

return;
}start 
 state DownloadManagerMachine_Begin
{
entry (payload: any) {
DownloadManagerMachine_Begin_entry0_rand_88944525(payload);
}exit {
DownloadManagerMachine_Begin_exit0_rand_1917716287(null);
}on BeginDownload do (payload: null) {
DownloadManagerMachine_Begin_do_BeginDownload0_rand_1854006700(payload);
}}

 state DownloadManagerMachine_QueryingArtifacts
{
entry (payload: any) {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_970501115(payload);
}exit {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_84034187(null);
}on CancelDownload do (payload: null) {
DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1176373452(payload);
}
on QueryArtifactsOperationComplete do (payload: null) {
DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1107709675(payload);
}
on BeginClonePart do (payload: null) {
DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_772810346(payload);
}
on BeginDownloadInternal do (payload: null) {
DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_792641459(payload);
}
on DownloadCompleteInternal do (payload: null) {
DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1259896921(payload);
}}

 state DownloadManagerMachine_CloneArtifactPart
{
entry (payload: any) {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_17926057(payload);
}exit {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_448888509(null);
}on CancelDownload do (payload: null) {
DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_250614996(payload);
}
on ClonePartFromArtifactOperationComplete do (payload: null) {
DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_2049118193(payload);
}
on BeginDownloadInternal do (payload: null) {
DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_396422035(payload);
}
on DownloadCompleteInternal do (payload: null) {
DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1461737597(payload);
}}

 state DownloadManagerMachine_Downloading
{
entry (payload: any) {
DownloadManagerMachine_Downloading_entry0_rand_673874176(payload);
}exit {
DownloadManagerMachine_Downloading_exit0_rand_695842707(null);
}on CancelDownload do (payload: null) {
DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1799047676(payload);
}
on DownloadArtifactPartOperationComplete do (payload: null) {
DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_268924411(payload);
}
on DownloadCompleteInternal do (payload: null) {
DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_101081871(payload);
}}

 state DownloadManagerMachine_Canceling
{
entry (payload: any) {
DownloadManagerMachine_Canceling_entry0_rand_1999877675(payload);
}exit {
DownloadManagerMachine_Canceling_exit0_rand_341310863(null);
}on DownloadCompleteInternal do (payload: null) {
DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1487606581(payload);
}
on QueryArtifactsOperationComplete do (payload: null) {
DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1973798459(payload);
}
on ClonePartFromArtifactOperationComplete do (payload: null) {
DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1124622358(payload);
}
on DownloadArtifactPartOperationComplete do (payload: null) {
DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_987035972(payload);
}
on AttemptCancelDownloadOperationComplete do (payload: null) {
DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1910225510(payload);
}}

 state DownloadManagerMachine_Complete
{
entry (payload: null) {
DownloadManagerMachine_Complete_entry108(payload);
}exit {
DownloadManagerMachine_Complete_exit0_rand_1704108593(null);
}}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_1070459636(MainMachine_Init_entry0_rand_1070459636__payload_19: null)
{


;

;

return;
}
fun MainMachine_Init_exit0_rand_1254483670(MainMachine_Init_exit0_rand_1254483670__payload_skip: any)
{


;

;

return;
}start 
 state MainMachine_Init
{
entry (payload: null) {
MainMachine_Init_entry0_rand_1070459636(payload);
}exit {
MainMachine_Init_exit0_rand_1254483670(null);
}}
}

