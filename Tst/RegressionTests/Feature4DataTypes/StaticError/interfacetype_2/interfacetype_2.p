//This regression generates static errors
event A;
event B;
event E;
event F: machine;
event G: I1;
event H: M;

interface I1 A, B, E;
interface I2 E, F, G, A, B;

main machine M
receives F, G, null;
sends G, null;
{
   var x: I1;
   var y: machine;
   var z: I2;
   start state S
   {
      entry(p : I2)
      {
      	 z = this;
      	 z = new M(this);
      	 y = this;
      	 send y, G, 10;
      	 send y, G, this;
      	 send y, F, this;
      	 send y, H, y as M;
      	 send y, H, y;

      }   
   }
}