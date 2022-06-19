OBJS = $(shell find code/ -name '*.s' | sed "s/code/build/" | sed "s/\.s/.o/")
RAM_OBJS = build/wram.o

all: megaManX3.sfc

build/wram.o: include/wram.s
	wla-65816 -o $@ $<

build/%.o: code/%.s
	wla-65816 -D HACK -o $@ $<

megaManX3.sfc: $(OBJS) $(RAM_OBJS)
	wlalink -S linkfile $@
