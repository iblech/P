namespace Microsoft.P2Boogie
module Main = 
  open System.Runtime.Serialization;
  open System.Runtime.Serialization.Formatters;
  open System.Runtime.Serialization.Formatters.Binary;
  open System.IO;

  open Syntax
  open Helper

  let file = @"C:\Users\t-suchav\Desktop\Crt.txt"
  let sr = new System.IO.StreamReader(file)

  [<EntryPoint>]
  let main argv = 
    let mutable valid = true
    while(valid) do
      let line = sr.ReadLine()
      ignore 
        (if (line = null) then 
            valid = false
          else begin
            let formatter = new BinaryFormatter()
            let fileName = (sprintf "%s.dat" line)
            let stream = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.None)
            let prog = formatter.Deserialize(stream) :?> Syntax.ProgramDecl
            System.Console.WriteLine("*****************************************************************************");
            System.Console.WriteLine(line);
            System.Console.WriteLine("*****************************************************************************");        
            Helper.print_prog prog System.Console.Out
            valid
        end)
    0
