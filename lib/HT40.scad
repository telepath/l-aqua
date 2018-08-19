/* include <../conf/config.scad> */
include <conf/config.scad>

HT40_do=40;
HT40_w=2;

/* HT40_pipeend(); */
module HT40_pipeend(
  do=HT40_do,
  w=HT40_w,
  h=50
) {
  di=do-w*2;
  hh=w*5;
  NAME=str("HT",do,"/",h);

  difference() {
    cylinder(d=do, h=h);
    translate([0,0,-1]) {
      cylinder(d=di, h=h+2);
    }
    translate([0, 0, h-hh/2]) {
      difference() {
        cylinder(d=do+w, h=hh);
        cylinder(d1=do, d2=do-w*2, h=hh);
      }
    }
    writecylinder(text=str(NAME," ",MAT," ",VER),radius=do/2,height=h,up=h/2+w*2);
  }
}
