.PHONY: all tools compare clean tidy

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:

ROM := alleyway.gb
OBJS := main.o wram.o
MD5 := md5sum -c

all: $(ROM)

compare: $(ROM)
	@$(MD5) rom.md5

tidy:
	rm -f $(ROM) $(OBJS) $(ROM:.gb=.sym) $(ROM:.gb=.map)
	$(MAKE) -C tools clean

clean: tidy
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pcm' \) -exec rm {} +

tools:
	$(MAKE) -C tools/

ifeq (,$(filter clean tools,$(MAKECMDGOALS)))
$(info $(shell $(MAKE) -C tools))
endif


%.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -o $@ -p 0x00 $<

$(ROM): $(OBJS)
	rgblink -n $(ROM:.gb=.sym) -m $(ROM:.gb=.map) -o $@ $(OBJS)
	rgbfix -v -p 0xFF -l 0x01 -t "ALLEY WAY" $@

gfx/font.2bpp: tools/gfx += --trim-whitespace
gfx/mario.2bpp: tools/gfx += --trim-whitespace

%.2bpp: %.png
	rgbgfx -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	rgbgfx -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)