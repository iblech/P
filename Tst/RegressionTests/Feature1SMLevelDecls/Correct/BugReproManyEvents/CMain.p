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

fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_2009792585()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1876608256()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_2078047060()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1403785465()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1437359912()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1712576037()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1886375292()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_895604017()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_2040363963()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1831854644()
{


;

}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1448419569()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1817313368()
{


;

}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_5006857()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_284769495()
{


;

}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1094197721()
{


;

}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1039067950()
{


;

}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1368335458()
{


;

}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1922711625()
{


;

}
fun DownloadManagerMachine_Begin_entry0_rand_123883925()
{


;

}
fun DownloadManagerMachine_Begin_exit0_rand_1642852805()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_535241946()
{


;

}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_921583596()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_86566877()
{


;

}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_368371454()
{


;

}
fun DownloadManagerMachine_Downloading_entry0_rand_1686647146()
{


;

}
fun DownloadManagerMachine_Downloading_exit0_rand_322199204()
{


;

}
fun DownloadManagerMachine_Canceling_entry0_rand_73333833()
{


;

}
fun DownloadManagerMachine_Canceling_exit0_rand_36727669()
{


;

}
fun DownloadManagerMachine_Complete_entry108()
{


raise halt;
}
fun DownloadManagerMachine_Complete_exit0_rand_272682854()
{


;

}start  state DownloadManagerMachine_Begin
{entry  {
DownloadManagerMachine_Begin_entry0_rand_123883925();
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_1642852805();
}
on BeginDownload do   {
DownloadManagerMachine_Begin_do_BeginDownload0_rand_2009792585();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry  {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_535241946();
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_921583596();
}
on CancelDownload do   {
DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1876608256();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_2078047060();
}

on BeginClonePart do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_1403785465();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1437359912();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_1712576037();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry  {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_86566877();
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_368371454();
}
on CancelDownload do   {
DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1886375292();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_895604017();
}

on BeginDownloadInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_2040363963();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1831854644();
}
}
 state DownloadManagerMachine_Downloading
{entry  {
DownloadManagerMachine_Downloading_entry0_rand_1686647146();
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_322199204();
}
on CancelDownload do   {
DownloadManagerMachine_Downloading_do_CancelDownload0_rand_1448419569();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_1817313368();
}

on DownloadCompleteInternal do   {
DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_5006857();
}
}
 state DownloadManagerMachine_Canceling
{entry  {
DownloadManagerMachine_Canceling_entry0_rand_73333833();
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_36727669();
}
on DownloadCompleteInternal do   {
DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_284769495();
}

on QueryArtifactsOperationComplete do   {
DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1094197721();
}

on ClonePartFromArtifactOperationComplete do   {
DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_1039067950();
}

on DownloadArtifactPartOperationComplete do   {
DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1368335458();
}

on AttemptCancelDownloadOperationComplete do   {
DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1922711625();
}
}
 state DownloadManagerMachine_Complete
{entry  {
DownloadManagerMachine_Complete_entry108();
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_272682854();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_44805362()
{


;

}
fun MainMachine_Init_exit0_rand_1057895076()
{


;

}start  state MainMachine_Init
{entry  {
MainMachine_Init_entry0_rand_44805362();
}
exit  {
MainMachine_Init_exit0_rand_1057895076();
}
}
}

