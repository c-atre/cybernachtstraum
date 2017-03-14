Ein Cybernachtstraum
====================

Der Text zu unserem dritten Theaterstück: Ein Cybernachtstraum

## Dokumente erstellen
Zum Erstellen der auf [unserer Webseite][Docs] Dokumente verwenden wir
[Pandoc] und das Tool `ebook-convert` des E-Book-Managers [Calibre][Calibre]
(zum Erstellen von MOBI- aus EPUB-Datein). Die **MSCZ**-Dateien für die
Musiknoten können mit dem Notensatz-Programm [MuseScore] geöffnet und in
PDF-Dateien umgewandelt werden. Alle Programme sind für alle gängigen
Betriebssysteme verfügbar.

Für Menschen, die mit dem Build-Tool `make` vertraut sind, stellen wir eine
Makefile bereit. Damit könnt ihr den Text umwandeln in

* eine **HTML-Webseite**,

```bash
make html
```

* ein **EPUB-E-Book**,

```bash
make epub
```

* ein **MOBI-E-Book**,

```bash
make mobi
```

* ein **PDF-Dokument** oder 

```bash
make pdf
```

* Musiknoten **PDF** (hierzu wird [MuseScore] benötigt)

```bash
make music-pdf
```

Außerdem können alle Dokumententypen gleichzeitig erstellt werden:

```bash
make
```

[Docs]: http://www.c-base.org/projects/c-atre/?page_id=425#lizenz-und-download
[Pandoc]: http://johnmacfarlane.net/pandoc/
[Calibre]: http://calibre-ebook.com/
[MuseScore]: https://musescore.com/
[LibreOffice]: https://de.libreoffice.org/
