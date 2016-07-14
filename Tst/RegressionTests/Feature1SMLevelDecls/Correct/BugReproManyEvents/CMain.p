event halt;
event null;
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

fun DownloadManagerMachine_Begin_entry0_rand_219705180()
{


;


}
fun DownloadManagerMachine_Begin_exit0_rand_1379169726()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_930975743()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_530503918()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_1966495422()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_1502719491()
{


;


}
fun DownloadManagerMachine_Downloading_entry0_rand_2124440800()
{


;


}
fun DownloadManagerMachine_Downloading_exit0_rand_2041005402()
{


;


}
fun DownloadManagerMachine_Canceling_entry0_rand_273583111()
{


;


}
fun DownloadManagerMachine_Canceling_exit0_rand_428466101()
{


;


}
fun DownloadManagerMachine_Complete_entry108()
{


raise halt;


}
fun DownloadManagerMachine_Complete_exit0_rand_384962905()
{


;


}
fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_665704463()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1992752699()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_772351238()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_975495149()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_117101789()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_165669114()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_297138505()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_38793930()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_1158196032()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1429437061()
{


;


}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_2076947831()
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1654755625()
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_417381304()
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_1833268153()
{


;


}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_312330057()
{


;


}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_45765288()
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1366236484()
{


;


}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1950016175()
{


;


}start  state DownloadManagerMachine_Begin
{entry  {
DownloadManagerMachine_Begin_entry0_rand_219705180();
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_1379169726();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry  {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_930975743();
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_530503918();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry  {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_1966495422();
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_1502719491();
}
}
 state DownloadManagerMachine_Downloading
{entry  {
DownloadManagerMachine_Downloading_entry0_rand_2124440800();
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_2041005402();
}
}
 state DownloadManagerMachine_Canceling
{entry  {
DownloadManagerMachine_Canceling_entry0_rand_273583111();
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_428466101();
}
}
 state DownloadManagerMachine_Complete
{entry  {
DownloadManagerMachine_Complete_entry108();
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_384962905();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_2117851264()
{


;


}
fun MainMachine_Init_exit0_rand_499320433()
{


;


}start  state MainMachine_Init
{entry  {
MainMachine_Init_entry0_rand_2117851264();
}
exit  {
MainMachine_Init_exit0_rand_499320433();
}
}
}

