include <config.scad>
include <cutitup.scad>

h=150;
c=0; // clearing
o=7;
d=cdi;

$fn=24;

cutitup_male(cut_lower=0,cut_upper=50,overlap=o);

translate([cdi*1.5, 0, 0])
  translate([0, 0, 50]) {
    rotate([180, 0, 0]) {
      cutitup_female(cut_lower=h-50,cut_upper=h,overlap=o);
    }
  }
translate([0, cdi*1.5, 0]) {
  cutitup_both(cut_lower=h-60,cut_upper=h-40,overlap=o);
}
translate([cdi*1.5, cdi*1.5, 0]) {
  cutitup_both(cut_lower=h-100,cut_upper=h-50,overlap=o);
}

// overwrite this with your object
module object(w) {
  cylinder(d=d+w+w*2, h=h);
}
