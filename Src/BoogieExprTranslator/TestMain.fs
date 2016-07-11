namespace Microsoft.P2Boogie
module Main = 
  open System.Runtime.Serialization;
  open System.Runtime.Serialization.Formatters;
  open System.Runtime.Serialization.Formatters.Binary;
  open System.IO;

  open Syntax
  open Helper
  open ProgramTyping

  let file = @"C:\Users\t-suchav\Desktop\Correct.txt"
  //let sr = new System.IO.StreamReader(file)
  
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
    //File.ReadLines(file) |> Seq.iter (printProgram)
    let prog = getProgram @"C:\Users\t-suchav\P\Tst\RegressionTests\Feature2Stmts\Correct\receive1\receive1.p"
    typecheck_program prog
    0

