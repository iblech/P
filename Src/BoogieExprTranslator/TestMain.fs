namespace Microsoft.P2Boogie
module Main = 
  open System.Runtime.Serialization;
  open System.Runtime.Serialization.Formatters;
  open System.Runtime.Serialization.Formatters.Binary;
  open System.IO;

  open Syntax
  open Helper

  let file = @"C:\Users\t-suchav\Desktop\Crt.txt"
  //let sr = new System.IO.StreamReader(file)
  
  let printProgram pFile = 
    begin
      let formatter = new BinaryFormatter()
      let fileName = (sprintf "%s.dat" pFile)
      let stream = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.None)
      let prog = formatter.Deserialize(stream) :?> Syntax.ProgramDecl
      System.Console.WriteLine("*****************************************************************************");
      System.Console.WriteLine(pFile);
      let OpFile = new System.IO.StreamWriter(pFile)
      Helper.print_prog prog OpFile
      OpFile.Close()
    end


  [<EntryPoint>]
  let main argv = 
    File.ReadLines(file) |> Seq.iter (printProgram)
    0

