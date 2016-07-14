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
event E1;
event E2;
event E3;
event E4;
event E5;
event E6;
event E7;
event E8;
event E9;
event E10;
event E11;
event E12;
event E13;

machine DownloadManagerMachine
{

fun DownloadManagerMachine_Begin_entry0_rand_1995240114()
{


;


}
fun DownloadManagerMachine_Begin_exit0_rand_1054830274()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_entry0_rand_625933573()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_exit0_rand_161044605()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_entry0_rand_108923361()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_exit0_rand_1842395216()
{


;


}
fun DownloadManagerMachine_Downloading_entry0_rand_1164815944()
{


;


}
fun DownloadManagerMachine_Downloading_exit0_rand_744407786()
{


;


}
fun DownloadManagerMachine_Canceling_entry0_rand_2045781533()
{


;


}
fun DownloadManagerMachine_Canceling_exit0_rand_1940149471()
{


;


}
fun DownloadManagerMachine_Complete_entry121()
{


raise halt;


}
fun DownloadManagerMachine_Complete_exit0_rand_983336721()
{


;


}
fun DownloadManagerMachine_Begin_do_BeginDownload0_rand_139373274()
{


;


}
fun DownloadManagerMachine_Begin_do_E60_rand_1166059474()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_CancelDownload0_rand_1499596804()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_QueryArtifactsOperationComplete0_rand_1548398686()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginClonePart0_rand_838459878()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_BeginDownloadInternal0_rand_1983919543()
{


;


}
fun DownloadManagerMachine_QueryingArtifacts_do_DownloadCompleteInternal0_rand_503599365()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_halt0_rand_1483232311()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_null0_rand_1813520007()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_CancelDownload0_rand_1614647316()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_ClonePartFromArtifactOperationComplete0_rand_685278571()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_BeginDownloadInternal0_rand_859516496()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_DownloadCompleteInternal0_rand_1212960665()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E10_rand_992019010()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E50_rand_439379371()
{


;


}
fun DownloadManagerMachine_CloneArtifactPart_do_E130_rand_1298612248()
{


;


}
fun DownloadManagerMachine_Downloading_do_CancelDownload0_rand_2020025440()
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadArtifactPartOperationComplete0_rand_159597385()
{


;


}
fun DownloadManagerMachine_Downloading_do_DownloadCompleteInternal0_rand_1879618244()
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadCompleteInternal0_rand_557486031()
{


;


}
fun DownloadManagerMachine_Canceling_do_QueryArtifactsOperationComplete0_rand_1604694232()
{


;


}
fun DownloadManagerMachine_Canceling_do_ClonePartFromArtifactOperationComplete0_rand_51664189()
{


;


}
fun DownloadManagerMachine_Canceling_do_DownloadArtifactPartOperationComplete0_rand_1084789931()
{


;


}
fun DownloadManagerMachine_Canceling_do_AttemptCancelDownloadOperationComplete0_rand_1451390331()
{


;


}
fun DownloadManagerMachine_Canceling_do_E20_rand_367504540()
{


;


}
fun DownloadManagerMachine_Canceling_do_E80_rand_707372386()
{


;


}
fun DownloadManagerMachine_Canceling_do_E110_rand_886033839()
{


;


}start  state DownloadManagerMachine_Begin
{entry  {
DownloadManagerMachine_Begin_entry0_rand_1995240114();
}
exit  {
DownloadManagerMachine_Begin_exit0_rand_1054830274();
}
}
 state DownloadManagerMachine_QueryingArtifacts
{entry  {
DownloadManagerMachine_QueryingArtifacts_entry0_rand_625933573();
}
exit  {
DownloadManagerMachine_QueryingArtifacts_exit0_rand_161044605();
}
}
 state DownloadManagerMachine_CloneArtifactPart
{entry  {
DownloadManagerMachine_CloneArtifactPart_entry0_rand_108923361();
}
exit  {
DownloadManagerMachine_CloneArtifactPart_exit0_rand_1842395216();
}
}
 state DownloadManagerMachine_Downloading
{entry  {
DownloadManagerMachine_Downloading_entry0_rand_1164815944();
}
exit  {
DownloadManagerMachine_Downloading_exit0_rand_744407786();
}
}
 state DownloadManagerMachine_Canceling
{entry  {
DownloadManagerMachine_Canceling_entry0_rand_2045781533();
}
exit  {
DownloadManagerMachine_Canceling_exit0_rand_1940149471();
}
}
 state DownloadManagerMachine_Complete
{entry  {
DownloadManagerMachine_Complete_entry121();
}
exit  {
DownloadManagerMachine_Complete_exit0_rand_983336721();
}
}
}

main machine MainMachine
{

fun MainMachine_Init_entry0_rand_2086215392()
{


;


}
fun MainMachine_Init_exit0_rand_1175300824()
{


;


}start  state MainMachine_Init
{entry  {
MainMachine_Init_entry0_rand_2086215392();
}
exit  {
MainMachine_Init_exit0_rand_1175300824();
}
}
}

