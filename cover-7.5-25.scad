include <b-hydro/siphon2.scad>
include <conf/config.scad>

di=7.5;
fdo=25;

rotate([180, 0, 0]) {
  cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h,h0=0);
}
