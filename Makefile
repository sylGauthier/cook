include config

PREFIX ?= /usr
COOKPATH ?= $(PREFIX)/share/cooking/based.cooking
BINDIR ?= $(PREFIX)/bin

ARTICLES = $(wildcard src/*.md)
MANPAGES = $(patsubst src/%.md,pages/%.1,$(ARTICLES))

.PHONY: install clean

all: $(MANPAGES)

clean:
	rm -rf pages

install: $(MANPAGES)
	mkdir -p $(COOKPATH)
	cp pages/* $(COOKPATH)
	cp cook $(BINDIR)

manpages: $(MANPAGES)

pages:
	mkdir -p $@

pages/%.1: src/%.md pages
	printf ".TH $* 7\n" > $@; \
	sed -e 's/^##* /.SH /' \
		-e 's/^ *- */.IP \\(bu 4\n/' \
		-e 's/^ *\* */.IP \\(bu 4\n/' \
		-e 's/^ *\([0-9][0-9]*\). */.IP \1. 4\n/' \
		-e 's/\*\*\([^*]*\)\*\* */\n.B \1\n/g' \
		-e 's/\*\([^*]*\)\* */\n.I \1\n/g' \
		-e '/!\[.*\](.*)/d' \
		-e 's;\[\([^]]*\)\](\([a-z\-]*\)\.html);\1 (\n.I \2\n);g' \
		-e 's;\[\([^]]*\)\](\([a-z\-]*\));\1 (\n.I \2\n);g' \
		-e 's;\[\([^]]*\)\](\([^ ]*\));\1\n.UR \2\n.UE \n;g' \
		-e 's/^;tags:\(.*\)/.SH Tags:\n.I \1\n/' < $< >> $@
