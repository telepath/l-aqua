include <lib/b-hydro/lib/siphon2.scad>
include <conf/config.scad>
include <lib/cut_set_4.scad>

d=cdi;

module object(w) {
  translate([0, 0, 0]) {
    cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h-cr-w,h0=0);
  }
}
