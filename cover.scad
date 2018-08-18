include <lib/b-hydro/lib/siphon2.scad>
include <conf/config.scad>

rotate([0, 180, 0]) {
  cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h,h0=0);
}
