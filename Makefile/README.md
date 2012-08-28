# My Makefile

This is my Makefile which I use for my LaTeX Documents. I splinted it to three
files.

## Helptext in German:
Dies sind die Grundfunktionen dieses Makefiles:
 help		Zeig diese Hilfe an
 clean		Löscht rekursiv alle temporären Dateien
 gitstats	Erzeugt Statistiken aus Git für LaTeX
 upload		Ermöglicht den Upload über FTP
 echoURL	Zeigt die URL an, über die das PDF abrufbar ist
Eventuell ist nicht jeder Befehl verfügbar

## Bugs

* It compiles documents using pdflatex so it is not taken care of external
  programs that should maybe also run. For example biber and makeindex.
