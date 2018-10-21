include <conf/config.scad>
use <lib/base.scad>

//thin wall thickness, look up in slicer
ff=0.87;

/* seal(); */
seal(d=lto*1.5-w*0.2,w=w*1.9,h=w*2,ff=ff);
/* seal(d=lto*1.5-w*0.2,w=w*1.9*1.5,h=w*2,ff=ff); */
