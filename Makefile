all: dwm dmenu st

dwm: dwm/config.h
	@cd $@ && make
dmenu: dmenu/config.h
	@cd $@ && make
st: st/config.h
	@cd $@ && make

dwm/config.h:
	@ln config/dwm.h $@

dmenu/config.h:
	@ln config/dmenu.h $@

st/config.h:
	@ln config/st.h $@

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

.PHONY: dwm dmenu st clean install
