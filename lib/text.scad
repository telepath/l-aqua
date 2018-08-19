include <conf/config.scad>
use <lib/Write.scad/Write.scad>

module label(
  t=w/2,
  th=4,
  font="Liberation Sans:style=Bold",
  text1=MAT,
  text2=str(SRC," ",FILE," ",VER)
) {
   {
    linear_extrude(t) {
      text(text1, size=th, font=font, valign="top",halign="center");
      translate([0, -th*2, 0]) {
        text(text2, size=th, font=font, valign="top",halign="center");
      }
    }
  }
}

module labelcircle(
  r,
  face="bottom",
  t=w/2,
  th=4,
  text1=MAT,
  text2=str(SRC," ",FILE," ",VER)
) {
  writecylinder(text=str(text1," ",text2),radius=r,height=1,face=face);
}
