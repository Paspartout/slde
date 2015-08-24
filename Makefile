all: dwm dmenu st

dwm:
	cd $@ && make
dmenu:
	cd $@ && make
st:
	cd $@ && make

.PHONY: dwm dmenu st