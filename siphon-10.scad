include <lib/b-hydro/lib/siphon2.scad>
include <conf/config.scad>

di=10;

rotate([180, 0, 0]) {
  screw_siphon(dhex=SW36);
}
