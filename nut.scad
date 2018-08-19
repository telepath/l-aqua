include <conf/config.scad>

difference() {
  knob_thread(
    l=ltl/2,
    w=w*2,
    d=lto*2.5,
    td=lto
  );
  labelcircle(r=lto/2+9,t=1,text1=str(lto,"/",lto*2.5,"/",MAT));
}
