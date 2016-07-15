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

fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_2068466695()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_261479541()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1138917280()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1816821154()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1867212734()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1738548775()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_488091099()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1354194262()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_2059341463()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1817653029()
{


;

}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_447364409()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1400104242()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_616084677()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_845670537()
{


;

}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_408102421()
{


;

}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1959190451()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_716869747()
{


;

}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_486369534()
{


;

}
fun DownloadManagerMachine_Begin_entry0_rand_1249955157()
{


;

}
fun DownloadManagerMachine_Begin_exit0_rand_1764836486()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_504135931()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_1980254517()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_1541533061()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_2073749414()
{


;

}
fun DownloadManagerMachine_Downloading_entry0_rand_828959005()
{


;

}
fun DownloadManagerMachine_Downloading_exit0_rand_1017130683()
{


;

}
fun DownloadManagerMachine_Canceling_entry0_rand_190207236()
{


;

}
fun DownloadManagerMachine_Canceling_exit0_rand_1997364441()
{


;

}
fun DownloadManagerMachine_Complete_entry108()
{


raise halt;
}
fun DownloadManagerMachine_Complete_exit0_rand_1055750923()
{


;

}start 
 state DownloadManagerMachine_Begin
{
entry  {
DownloadManagerMachine_Begin_entry0_rand_1249955157();
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_1764836486();
}
on BeginDownload do   {
DownloadManagerMachine_Begin_do_BeginDownload0_rand_2068466695();
}
}

 state DownloadManagerMachine_QueryingArtifacts
{
entry  {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_504135931();
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_1980254517();
}
on CancelDownload do   {
DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_261479541();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1138917280();
}

on BeginClonePart do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1816821154();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1867212734();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1738548775();
}
}

 state DownloadManagerMachine_CloneArtifactPart
{
entry  {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_1541533061();
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_2073749414();
}
on CancelDownload do   {
DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_488091099();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_1354194262();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_2059341463();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1817653029();
}
}

 state DownloadManagerMachine_Downloading
{
entry  {
DownloadManagerMachine_Downloading_entry0_rand_828959005();
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_1017130683();
}
on CancelDownload do   {
DownloadManagerMachine_Downloading_do_CancelDownload0_rand_447364409();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1400104242();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_616084677();
}
}

 state DownloadManagerMachine_Canceling
{
entry  {
DownloadManagerMachine_Canceling_entry0_rand_190207236();
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_1997364441();
}
on DownloadCompleteInternal do   {
DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_845670537();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_408102421();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1959190451();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_716869747();
}

on AttemptCancelDownloadOperationComplete do   {
DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_486369534();
}
}

 state DownloadManagerMachine_Complete
{
entry  {
DownloadManagerMachine_Complete_entry108();
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_1055750923();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_462517772()
{


;

}
fun MainMachine_Init_exit0_rand_1827074393()
{


;

}start 
 state MainMachine_Init
{
entry  {
MainMachine_Init_entry0_rand_462517772();
}
exit  {
MainMachine_Init_exit0_rand_1827074393();
}
}
}

