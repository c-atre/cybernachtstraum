TITLE=cybernachtstraum
MSCZ_FILES=$(wildcard noten/*.mscz)

TEMPLATE_PATH:=./templates

HTML_FLAGS:=-s --toc --template=$(TEMPLATE_PATH)/c-atre.html5 -t html5
HTML_FLAGS+=--css=$(TEMPLATE_PATH)/data/html.css

EPUB_FLAGS:=--toc --template=$(TEMPLATE_PATH)/c-atre.epub3 -t epub3
EPUB_FLAGS+=--epub-stylesheet=$(TEMPLATE_PATH)/data/epub.css
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/montserrat/fonts/otf/Montserrat-Regular.otf
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/montserrat/fonts/otf/Montserrat-Italic.otf
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/montserrat/fonts/otf/Montserrat-Bold.otf
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/montserrat/fonts/otf/Montserrat-BoldItalic.otf
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/arvo/Arvo-Regular_201.ttf
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/arvo/Arvo-Italic_201.ttf
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/arvo/Arvo-Bold_201.ttf
EPUB_FLAGS+=--epub-embed-font=$(TEMPLATE_PATH)/fonts/arvo/Arvo-BoldItalic_201.ttf

ODT_FLAGS:=--toc --template=$(TEMPLATE_PATH)/c-atre.opendocument
ODT_FLAGS+=--data-dir=$(TEMPLATE_PATH)/data

PDF_FLAGS:=--toc --template=$(TEMPLATE_PATH)/c-atre.latex
PDF_FLAGS+=--latex-engine=xelatex -V template-path:$(TEMPLATE_PATH)/

.PHONY: dep all html epub mobi odt pdf music-pdf

all: html epub mobi odt pdf music-pdf

dep:
	@git submodule update --init --recursive --depth 1

html: $(TITLE).html

epub: $(TITLE).epub

mobi: $(TITLE).mobi

odt: $(TITLE).odt

pdf: $(TITLE).pdf

music-pdf: $(MSCZ_FILES:.mscz=.pdf)

%.html: %.md
	pandoc $(HTML_FLAGS) "$<" -o "$@"

%.epub: %.md
	pandoc $(EPUB_FLAGS) "$<" -o "$@"

%.mobi: %.epub
	ebook-convert "$<" "$@"

%.odt: %.md
	pandoc $(ODT_FLAGS) "$<" -o "$@"

%.pdf: %.md
	pandoc $(PDF_FLAGS) "$<" -o "$@"

noten/%.pdf: noten/%.mscz
	musescore -o "$@" "$<"

clean:
	rm -f $(TITLE).epub $(TITLE).html $(TITLE).mobi $(TITLE).pdf $(TITLE).odt noten/*.pdf

dist:
	tar -czf $(TITLE).tar.gz Makefile LICENSE $(TITLE).md
