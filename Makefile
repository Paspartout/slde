colorfile = colors/chalk.yml

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

config/st.h:
	./bin/stcolors $(colorfile) config/st-tpl.h >$@

st/config.h: config/st.h
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
	@rm -f config/st.h

.PHONY: dwm dmenu st clean install
