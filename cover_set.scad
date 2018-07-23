include <b-hydro/siphon2.scad>
include <config.scad>
include <cutitup.scad>

h=150;

cutitup_male(cut_lower=-LidHeight,cut_upper=50,overlap=10);
translate([cdi*1.5, 0, 0]) {
  cutitup_female(cut_lower=h-50,cut_upper=h+cr+w,overlap=10);
}
translate([0, cdi*1.5, 0]) {
  cutitup_both(cut_lower=h-50,cut_upper=h-40,overlap=10);
}
translate([cdi*1.5, cdi*1.5, 0]) {
  cutitup_both(cut_lower=h-100,cut_upper=h-50,overlap=10);
}

module cover_w(w) {
  translate([0, 0, LidHeight]) {
    cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h-LidHeight);
  }
}

module cutitup_female(cut_lower,cut_upper,overlap){
  d=di*10;
  rotate([180, 0, 0]) {
    translate([0, 0, -cut_upper]) {
      difference() {
        intersect(d=d,w=w,cut_lower=cut_lower,cut_upper=cut_upper);
        intersect(d=d,w=w/2,cut_lower=cut_lower,cut_upper=cut_lower+overlap);
      }
    }
  }
}

module cutitup_both(cut_lower,cut_upper,overlap){
  d=di*10;
  rotate([180, 0, 0]) {
    translate([0, 0, -cut_upper-overlap]) {
      intersect(d=d,w=w,cut_lower=cut_lower,cut_upper=cut_upper);
      intersect(d=d,w=w/2,cut_lower=cut_upper,cut_upper=cut_upper+overlap);
      difference() {
        intersect(d=d,w=w,cut_lower=cut_lower-overlap,cut_upper=cut_upper);
        intersect(d=d,w=w/2,cut_lower=cut_lower-overlap,cut_upper=cut_upper);
      }
    }
  }
}

module cutitup_male(cut_lower,cut_upper,overlap){
  d=di*10;
  rotate([180, 0, 0]) {
    translate([0, 0, -cut_upper-overlap]) {
      intersect(d=d,w=w,cut_lower=cut_lower,cut_upper=cut_upper);
      intersect(d=d,w=w/2,cut_lower=cut_upper,cut_upper=cut_upper+overlap);
    }
  }
}

module intersect(d,w,cut_lower,cut_upper){
  intersection(){
    cover_w(w=w);
    translate([-d/2, -d/2, cut_lower]) {
      cube(size=[d, d, cut_upper-cut_lower]);
    }
  }
}
