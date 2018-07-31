
module cutitup_female(cut_lower,cut_upper,overlap){
  translate([0, 0, -cut_lower]) {
    difference() {
      intersect(d=d,w=w,cut_lower=cut_lower,cut_upper=cut_upper+overlap);
      intersect(d=d,w=(w+c)/2,cut_lower=cut_lower,cut_upper=cut_lower+overlap, slope=overlap);
    }
  }
}

module cutitup_both(cut_lower,cut_upper,overlap){
  translate([0, 0, -cut_lower]) {
    difference() {
      union(){
        intersect(d=d,w=(w-c)/2,cut_lower=cut_upper,cut_upper=cut_upper+overlap,slope=overlap);
        intersect(d=d,w=w,cut_lower=cut_lower,cut_upper=cut_upper);
      }
      intersect(d=d,w=(w+c)/2,cut_lower=cut_lower,cut_upper=cut_lower+overlap, slope=overlap);
    }
  }
}

module cutitup_male(cut_lower,cut_upper,overlap){
    translate([0, 0, -cut_lower]) {
      intersect(d=d,w=w,cut_lower=cut_lower,cut_upper=cut_upper);
      intersect(d=d,w=(w-c)/2,cut_lower=cut_upper,cut_upper=cut_upper+overlap,slope=overlap);
    }
}

module intersect(d,w,cut_lower,cut_upper,slope=0){
  intersection(){
    object(w=w);
    translate([0, 0, cut_lower]) {
      translate([-d*5, -d*5, slope]){
        cube(size=[d*10, d*10, cut_upper-cut_lower-slope*2]);
      }
      double_cone(height=cut_upper-cut_lower,d=d,slope=slope);
    }
  }
}

module double_cone(d,height,slope) {
  translate([0, 0, height-slope]) {
    cylinder(d1=d+slope*2, d2=d-slope*2, h=slope*2);
  }
  translate([0, 0, -height-slope]) {
    cylinder(d2=d+slope*2, d1=d-slope*2, h=slope*2);
  }
}
