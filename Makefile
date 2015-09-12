colorfile = colors/google.yml

all: dwm dmenu st

dwm: dwm/config.h
	@cd $@ && make
dmenu: dmenu/config.h
	@cd $@ && make
st: st/config.h
	@cd $@ && make

dwm/config.h: config/dwm.h
	@ln config/dwm.h $@

dmenu/config.h: config/dmenu.h
	@ln config/dmenu.h $@

st/config.h: config/st.h
	@ln config/st.h $@

config/dwm.h:
	./bin/colortpl $(colorfile) config/dwm-tpl.h >$@

config/dmenu.h:
	./bin/colortpl $(colorfile) config/dmenu-tpl.h >$@

config/st.h:
	./bin/colortpl $(colorfile) config/st-tpl.h >$@

install:
	@cd dwm && make $@
	@cd dmenu && make $@
	@cd st && make $@

clean:
	@cd dwm && make $@
	@cd dwm && rm config.h
	@cd dmenu && make $@
	@cd dmenu && rm config.h
	@cd st && make $@
	@cd st && rm config.h
	@rm -f config/dwm.h
	@rm -f config/dmenu.h
	@rm -f config/st.h

.PHONY: dwm dmenu st clean install
