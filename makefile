# explicit wildcard expansion suppresses errors when no files are found
include $(wildcard *.deps)

%.stl: %.scad
	openscad-nightly -m make -o $@ -d $@.deps $<
	mkdir -p img
	openscad-nightly -m make -o img/$@-`date +'%y-%m-%d-%H-%M-%S'`.png --imgsize=2048,2048  -d $@.deps --render $<
