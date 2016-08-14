colorfile ?= colors/google.yml

all: dwm dmenu st

dwm: dwm/config.h
	@cd $@ && make
dmenu: dmenu/config.h
	@cd $@ && make
st: st/config.h
	@cd $@ && make

dwm/config.h: config/dwm.h
	./bin/colortpl ${colorfile} $< >$@

dmenu/config.h: config/dmenu.h
	./bin/colortpl ${colorfile} $< >$@

st/config.h: config/st.h
	./bin/colortpl ${colorfile} $< >$@

install: all
	@cd dwm && make $@
	@cd dmenu && make $@
	@cd st && make $@

clean:
	@cd dwm && make $@ && rm -f config.h
	@cd dmenu && make $@ && rm -f config.h
	@cd st && make $@ && rm -f config.h

.PHONY: dwm dmenu st clean install
