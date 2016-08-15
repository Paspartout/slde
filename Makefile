colorfile ?= colors/google.yml
BINPATH ?= /usr/local/bin

all: dwm dmenu st bin/notify

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

bin/notify: bin/notify.tpl
	./bin/colortpl ${colorfile} $< >$@
	@chmod +x $@

install: all
	@cd dwm && make $@
	@cd dmenu && make $@
	@cd st && make $@
	@cp bin/notify ${BINPATH}/notify
	@chmod 755 ${BINPATH}/notify

clean:
	@cd dwm && make $@ && rm -f config.h
	@cd dmenu && make $@ && rm -f config.h
	@cd st && make $@ && rm -f config.h

.PHONY: dwm dmenu st clean install
