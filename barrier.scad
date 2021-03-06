use <lib/b-hydro/boxInset_large.scad>
include <conf/config.scad>

mesh_divider(height=100);

module slanted_ring(
  d1,
  d2,
  h1,
  h2,
  a=360
) {
  w=(d2-d1)/2;
  rotate_extrude(){
    translate([d1/2, 0, 0]) {
      polygon(points=[[0,0],[w,0],[w,h2],[0,h1]]);
    }
  }
}

module mesh_divider(
  d=bdm,
  height=100,
  twist=180,
  w=w,
  wl=w*3,
  overlap=8,
  cut=100
) {
  mesh(d=d,height=height,twist=twist,w=w,wl=wl,overlap=overlap,cut=cut);
  mesh(d=d,height=height,twist=-twist,w=w,wl=wl,overlap=overlap,cut=cut);
}

module mesh(
  d=cdi*2,
  height=100,
  twist=180,
  w=w,
  wl=w*3,
  overlap=8,
  cut=50
) {
  C=3.14*d;
  n=floor(C/(wl*3));
  echo(str("n=",n));
  /* n=1; */

  for (i=[0:n]) {
    rotate(360/n*i) {
      final_mesh(d=d,w=w,height=height,twist=twist,overlap=overlap,cut=cut);
    }
  }
}

module final_mesh(d,w,height,twist,overlap,cut) {
  difference() {
    linear_extrude(height=height+overlap, twist=twist){
      translate([d/2, 0, 0]) {
        /* square(size=[w, (C/n)/3], center=true); */
        scale([2, 3, 1]) {
          circle(d=w,$fn=12);
        }
      }
    }
    translate([0, 0, -f]) {
      slanted_ring(d1=d,d2=d+w*3,h1=overlap,h2=overlap+w,a=30);
    }
    translate([0, 0, cut+overlap+f]) {
      rotate([180, 0, 0]) {
        slanted_ring(d1=d-w*3,d2=d,h1=overlap+w,h2=overlap,a=30);
      }
      cylinder(d=d*2, h=height);
    }
  }
}
