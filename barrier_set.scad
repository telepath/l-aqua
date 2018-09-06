include <conf/config.scad>
use <barrier.scad>

/* import("stl/barrier.stl"); */
mesh_divider(height=100);
translate([bdm+10, 0, 0]) {
  /* import("stl/barrier50.stl"); */
  mesh_divider(height=100,cut=50);
}
