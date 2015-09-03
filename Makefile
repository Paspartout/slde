all: dwm dmenu st

dwm:
	@cp config/$@.h $@/config.h
	@cd $@ && make
dmenu:
	@cp config/$@.h $@/config.h
	@cd $@ && make
st:
	@cp config/$@.h $@/config.h
	@cd $@ && make

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
