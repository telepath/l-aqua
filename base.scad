include <config.scad>

/* #large_thread(l=ltl,d=lto,w=w*2); */

rotate([180, 0, 0]) {
    assembly(
    d=bdm,
    w=w*2
  );
}
/* projection(cut=true)
{
  translate([0,0,w+1]) {
    rotate(45*2)
      assembly(
        d=bdm,
        w=w*2
      );
    translate([0, 0, -ltl/2])
        knob_thread(
          l=ltl/2,
          w=w*2,
          d=lto*2.5,
          td=lto
        );
  }
} */

module assembly(d,w) {
  base_plate(
    d=d,
    w=w
  );
  large_thread(
    l=ltl,
    d=lto,
    w=w
  );
  bottle_thread(
    l=LidHeight,
    d=ThreadOuterDiameter,
    w=w
  );
}

module base_plate(d,w) {
  difference() {
    cylinder(d=d, h=w);
    cylinder(d=ThreadOuterDiameter+w, h=w*4, center=true);
  }
}

module large_thread(l,d,w) {
  translate([0, 0, -l]) {
    inner_thread(l=l,d=d,w=w);
  }
}
module bottle_thread(l,d,w) {
  translate([0, 0, -l+w]) {
    outer_thread(l=l,d=d,w=w);
  }
}
