TITLE=cybernachtstraum
MSCZ_FILES=$(wildcard noten/*.mscz)

all: html epub mobi pdf music-pdf

html: $(TITLE).html

epub: $(TITLE).epub

mobi: $(TITLE).mobi

pdf: $(TITLE).pdf

music-pdf: $(MSCZ_FILES:.mscz=.pdf)

%.html: %.md
	pandoc -s "$<" -o "$@"

%.epub: %.md
	pandoc --toc "$<" -o "$@"

%.mobi: %.epub
	ebook-convert "$<" "$@"

%.pdf: %.odt
	libreoffice --headless --convert-to pdf "$<"

noten/%.pdf: noten/%.mscz
	musescore -o "$@" "$<"

clean:
	rm -f $(TITLE).epub $(TITLE).html $(TITLE).mobi $(TITLE).pdf noten/*.pdf

dist:
	tar -czf $(TITLE).tar.gz Makefile LICENSE $(TITLE).md $(TITLE).odt

.PHONY: all html epub mobi clean dist
