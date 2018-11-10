include <lib/b-hydro/lib/siphon2.scad>
include <conf/config.scad>

difference() {
  union() {
    translate([0, 0, LidHeight]) {
      rotate([0, 180, 0]) {
        screw_siphon();
      }
    }
    translate([fdo*2, 0, (h+fdo/2-LidHeight*2)-h+cr+w])
    /* translate([0, 0, -LidHeight*2.3]) */
    {
      rotate([0, 180, 0]) {
        cover_snorkel(cdi=cdi,di=di/2,cr=cr,w=w,h=h+fdo/2-LidHeight*2,fdo=fdo,h0=0);

        /* translate([0, 0, h+fdo/2-LidHeight*2+cr+w]) {
          %cube(size=[100, 100, 1], center=true);
        } */
      }
    }
  }
  /* // half cut view
  translate([-50, 0, -500]) {
    cube([100,100,1000]);
  } */
}
/*
translate([0, 0, -h-LidHeight]) {
  %cube(size=[100, 100, 1], center=true);
} */
