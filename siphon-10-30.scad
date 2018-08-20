include <lib/b-hydro/lib/siphon2.scad>
include <conf/config.scad>

di=10;
fdo=30;

rotate([0, 180, 0]) {
  screw_siphon();
}
translate([fdo*2, 0, -LidHeight+cr+w])
/* translate([0, 0, -cdi/3])  */
{
  rotate([0, 180, 0]) {
    cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h,h0=0);
  }
}