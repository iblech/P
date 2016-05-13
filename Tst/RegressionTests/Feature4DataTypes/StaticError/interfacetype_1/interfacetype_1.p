event E;
event F: any;
event G: int;

interface I E;
main machine M
receives F
{
   var x: I;
   var y: int;
   start state S
   {
      entry 
      {

      }   
   }
}