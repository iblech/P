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

fun DownloadManagerMachine_Begin_entry0_rand_288099875(DownloadManagerMachine_Begin_entry0_rand_288099875__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Begin_exit0_rand_640715919()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_1505185431(DownloadManagerMachine_QueryingArtifacts_entry0_rand_1505185431__payload_skip: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_574727098()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_1590434227(DownloadManagerMachine_CloneArtifactPart_entry0_rand_1590434227__payload_skip: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_845831624()
{


;


}
fun DownloadManagerMachine_Downloading_entry0_rand_269214266(DownloadManagerMachine_Downloading_entry0_rand_269214266__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Downloading_exit0_rand_450517007()
{


;


}
fun DownloadManagerMachine_Canceling_entry0_rand_450841230(DownloadManagerMachine_Canceling_entry0_rand_450841230__payload_skip: any)
{


;


}
fun DownloadManagerMachine_Canceling_exit0_rand_86731040()
{


;


}
fun DownloadManagerMachine_Complete_entry108(DownloadManagerMachine_Complete_entry108__payload_18: any)
{


raise halt;


}
fun DownloadManagerMachine_Complete_exit0_rand_1554133836()
{


;


}
fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_418538525(DownloadManagerMachine_Begin_do_BeginDownload0_rand_418538525__payload_0: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1452472358(DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1452472358__payload_1: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_86623455(DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_86623455__payload_2: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_165831643(DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_165831643__payload_3: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_779475242(DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_779475242__payload_4: any)
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_688034493(DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_688034493__payload_5: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1447250804(DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1447250804__payload_6: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_2046374364(DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_2046374364__payload_7: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_1722938030(DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_1722938030__payload_8: any)
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_739399489(DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_739399489__payload_9: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1622253556(DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1622253556__payload_10: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1997020848(DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1997020848__payload_11: any)
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1163516194(DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1163516194__payload_12: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1186978216(DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1186978216__payload_13: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1697607947(DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1697607947__payload_14: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_562235604(DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_562235604__payload_15: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_494242535(DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_494242535__payload_16: any)
{


;


}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1006604315(DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1006604315__payload_17: any)
{


;


}start  state DownloadManagerMachine_Begin
{entry (payload: any) {
DownloadManagerMachine_Begin_entry0_rand_288099875(payload);
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_640715919();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry (payload: any) {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_1505185431(payload);
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_574727098();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry (payload: any) {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_1590434227(payload);
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_845831624();
}
}
 state DownloadManagerMachine_Downloading
{entry (payload: any) {
DownloadManagerMachine_Downloading_entry0_rand_269214266(payload);
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_450517007();
}
}
 state DownloadManagerMachine_Canceling
{entry (payload: any) {
DownloadManagerMachine_Canceling_entry0_rand_450841230(payload);
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_86731040();
}
}
 state DownloadManagerMachine_Complete
{entry (payload: any) {
DownloadManagerMachine_Complete_entry108(payload);
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_1554133836();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_39804208(MainMachine_Init_entry0_rand_39804208__payload_19: any)
{


;


}
fun MainMachine_Init_exit0_rand_950027886()
{


;


}start  state MainMachine_Init
{entry (payload: any) {
MainMachine_Init_entry0_rand_39804208(payload);
}
exit  {
MainMachine_Init_exit0_rand_950027886();
}
}
}

