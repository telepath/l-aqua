include <lib/b-hydro/lib/siphon2.scad>
include <conf/config.scad>

di=7.5;
fdo=25;

rotate([0, 180, 0]) {
  screw_siphon();
}
translate([fdo*2, 0, 0]) {
  rotate([0, 180, 0]) {
    cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h,h0=0);
  }
}
