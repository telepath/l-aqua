include <lib/b-hydro/lib/siphon2.scad>
include <conf/config.scad>

r=3;
m=36;
SW=SW36;
f=1;
h0=LidHeight;
h1=LidHeight * 2;
h2=h/2;

%screw_siphon();

hull() {
  pole(n=0,r=r,h=h0);
  pole(n=1,r=r*2,h=h2);
}
hull() {
  pole(n=1,r=r*2,h=h2);
  pole(n=2,r=r*3,h=h);
}
hull() {
  pole(n=2,r=r*3,h=h);
  pole(n=3,r=r*2,h=h2);
}
hull() {
  pole(n=3,r=r*2,h=h2);
  pole(n=4,r=r,h=h0);
}

/*
hull() {
  translate([-m/4, m/2 + f + r, 0]) {
    cylinder(r=r, h=h0);
    translate([0, 0, h0]) {
      sphere(r=r);
    }
  }
  translate([m/4, m/2 + f + r * 2, 0]) {
    cylinder(r=r*2, h=h1);
    translate([0, 0, h1]) {
      sphere(r=r*2);
    }
  }
}

translate([-m/4, -( m/2 + f + r ), 0]) {
  cylinder(r=r, h=h0);
} */

module pole(n=0,r=r,h=h0) {
  rotate([0, 0, 30 - 60 * n]) {
    translate([0, SW/2 + f + r, 0]) {
      cylinder(r=r, h=h-r);
      translate([0, 0, h-r]) {
        sphere(r=r);
      }
    }
  }
}
