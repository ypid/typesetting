MakeConfigDir	= $(HOME)/Dokumente/LaTeX/typesetting/Makefile
include $(MakeConfigDir)/Makefile.rules

JOBNAME		= Dokument

#UPLOADFILE	= "$(JOBNAME).pdf"
## Dateien werden vor einem Upload nach /tmp Kopiert
#UPLOADDIR	= Berufsschuljahr/1
#UPLOAD		?= $(UPLOADCOM) /httpdocs/$(UPLOADDIR) /tmp/$(UPLOADFILE)
## Geht nur bei einer Datei

all: main # gitstats upload

main: $(JOBNAME).pdf log

include $(MakeConfigDir)/Makefile.targets

