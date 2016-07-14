namespace Microsoft.P2Boogie
module Main = 
  open System.Runtime.Serialization;
  open System.Runtime.Serialization.Formatters;
  open System.Runtime.Serialization.Formatters.Binary;
  open System.IO;

  open Syntax
  open Helper
  open ProgramTyping
  open RemoveSideEffects
  
  let getProgram pFile = 
    begin
      let formatter = new BinaryFormatter()
      let fileName = (sprintf "%s.dat" pFile)
      let stream = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.None)
      formatter.Deserialize(stream) :?> Syntax.ProgramDecl
    end
  let printProgram (pFile: string) = 
    begin
      
      System.Console.WriteLine("*****************************************************************************");
      System.Console.WriteLine(pFile);
      let prog = getProgram pFile
      let OpFile = new System.IO.StreamWriter(pFile)
      print_prog prog OpFile
      OpFile.Close()
    end


  [<EntryPoint>]
  let main argv = 
    File.ReadLines(argv.[0]) |> Seq.iter (printProgram)
(*
    let file = @"C:\Users\t-suchav\P\Tst\RegressionTests\Feature1SMLevelDecls\Correct\PingPong\PingPong.p"
    let prog = remove_side_effects_program (getProgram file) 
    let opFile = new System.IO.StreamWriter(@"C:\Users\t-suchav\Desktop\recv12.p")
    print_prog prog opFile
    print_prog prog System.Console.Out
    typecheck_program prog
*)
    0

