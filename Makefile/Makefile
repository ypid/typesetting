TEX_DEFAULT_OPTIONS := -shell-escape
TEX_OPTIONS := -halt-on-error $(TEX_DEFAULT_OPTIONS)
BIBLATEX_COMPILER := biber
PDFLATEX_COMPILER := pdflatex $(TEX_OPTIONS)
LUALATEX_COMPILER := lualatex $(TEX_OPTIONS)

LATEXMK_OPTIONS := -pv
# LATEXMK_OPTIONS := -pv -diagnostics
LATEXMK_COMPILER := latexmk $(LATEXMK_OPTIONS)

# RELEASE_LATEX_COMPILER := $(PDFLATEX_COMPILER)
# RELEASE_LATEX_COMPILER := $(LATEXMK_COMPILER) -pdflatex="pdflatex $(TEX_DEFAULT_OPTIONS) %O %S"
RELEASE_LATEX_COMPILER := $(LATEXMK_COMPILER) -pdflatex="lualatex $(TEX_DEFAULT_OPTIONS) %O %S"
# DRAFT_LATEX_COMPILER := $(LATEXMK_COMPILER) -pdflatex="pdflatex $(TEX_DEFAULT_OPTIONS) %O %S"
# DRAFT_LATEX_COMPILER := $(RELEASE_LATEX_COMPILER)
DRAFT_LATEX_COMPILER := $(PDFLATEX_COMPILER)

# 'pdflatex' needed too many passes
# No time to debug :(

.PHONY : FORCE_MAKE all release
Document_draft.pdf: Document_draft.tex FORCE_MAKE
	$(DRAFT_LATEX_COMPILER) "$<"
	$(BIBLATEX_COMPILER) "$(basename $<)"
	# $(DRAFT_LATEX_COMPILER) "$<"
# Document_public_draft.pdf: Document_public_draft.tex FORCE_MAKE
	# $(DRAFT_LATEX_COMPILER) "$<"
	# $(BIBLATEX_COMPILER) "$(basename $<)"
	# # $(DRAFT_LATEX_COMPILER) "$<"

Document.pdf:
Document_print.pdf:
Document_print_twosite.pdf:
Document_public.pdf:
Document_public_draft.pdf:

all: Document.pdf Document_public.pdf

release: qa Document.pdf

%.pdf: %.tex FORCE_MAKE
	$(RELEASE_LATEX_COMPILER) "$<"

.PHONY : qa clean backup

## https://github.com/ypid/typesetting/blob/master/scripts/latex-use-acronyms
qa:
	cd files/ && latex-use-acronyms
	git ls-files | egrep '\.(tex|mk)$$' | xargs sed --in-place 's/\(Hypervisor\|Linux\|Windows\|Monitoring\|Storage\) \(Server\|System\|Lösung\)/\1-\2/g;'

export-for-external-spell-checking:
	cd files/chapters/ && sed 's/\\[A-Za-z]*{\([^}\\{]*\)}/\1/g' *.tex > export-for-external-spell-checking.txt
	# cd files/chapters/ && sed 's/\\[A-Za-z]*\(?:\[[^]]*\]\)\?{\([^}\\{]*\)}/\1/g' *.tex > export-for-external-spell-checking.txt

clean:
	latex-rm-tmpfiles

backup:
	git remote | xargs -L1 git push --all
