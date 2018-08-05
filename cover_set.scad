include <b-hydro/siphon2.scad>
include <config.scad>
include <cut_set_4.scad>

d=cdi;

module object(w) {
  translate([0, 0, 0]) {
    cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h-cr-w,h0=0);
  }
}
