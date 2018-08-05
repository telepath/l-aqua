include <b-hydro/siphon2.scad>
include <cut_set_4.scad>

d=di+w*2;
ThreadHeight=10;

module object(w) {
  screw_siphon(w=w,h=h,t=ThreadHeight);
}
