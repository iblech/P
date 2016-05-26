//This regression generates static errors
event A;
event B;
event E;
event F: machine;
event G: I1;
event H: M;

eventset es1 = {A, B, E};
eventset es2 = {E, F, A, B};
type I1() = es1;
type I2() = es2;

main machine M
exports I3;
sends G;
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