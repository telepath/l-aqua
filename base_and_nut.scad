include <nut.scad>
include <lib/base.scad>

translate([-bdm, 0, w*3]) {
  rotate([180, 0, 0]) {
    assembly(
      d=bdm,
      w=w*3,
      seal=false
    );
  }
}
