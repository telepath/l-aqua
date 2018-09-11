include <nut.scad>
use <lib/base.scad>

translate([-bdm, 0, w*3]) {
  rotate([180, 0, 0]) {
    assembly(
      d=bdm,
      w=w*3
    );
  }
}

/* include <conf/config.scad>
render()
import("stl/nut.stl");
translate([-bdm, 0, w*3]) {
  render()
  import("stl/base.stl");
} */
