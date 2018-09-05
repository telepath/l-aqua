include <conf/config.scad>
include <lib/HT40.scad>

/* #large_thread(l=ltl,d=lto,w=w*2); */

rotate([180, 0, 0]) {
    assembly(
    d=bdm,
    w=w*3
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
  %seal(d=lto*1.5,w=w);
  C=3.14*d;
  n=floor(C/(w*3));

  difference() {
    base_plate(
      d=d,
      w=w,
      $fn=n
    );
    seal(d=lto*1.5,w=w);
    translate([-d/3, 0, w])
      rotate(90)
        label(t=1,text1=str(d,"/",ltl,"/",ThreadOuterDiameter,"/",MAT),text2=str(SRC," ",FILE," ",VER));
  }
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
  rotate([180, 0, 0]) {
    HT40_pipeend(h=ltl+30);
  }
  intersection() {
    for (i=[0:n]) {
      rotate(360/n*(i+0.5)) {
        clip(d=d,w=w);
      }
    }
    translate([0, 0, w/2]) {
      cylinder(d=d+w*2, h=w/2);
    }
  }
}
/* !clip(); */
module clip(d,w=w) {
  translate([(d-w)/2, 0, w*0.75]) {
    rotate([0, -20, 0]) {
      rotate([45, 0, 0]) {
        cube(size=[w, w, w], center=true);
      }
    }
  }
}

module seal(d,w) {
  difference() {
    cylinder(d=d, h=w, center=true);
    cylinder(d=d-w*2, h=w*2, center=true);
  }
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
