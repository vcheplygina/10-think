LATEX=pdflatex
BIBTEX=bibtex
STEM=rules

all : commands

## commands   : show all commands.
commands :
	@grep -E '^##' Makefile | sed -e 's/## //g'

## pdf        : re-generate PDF
pdf :
	${LATEX} ${STEM}
	${BIBTEX} ${STEM}
	${LATEX} ${STEM}
	${LATEX} ${STEM}
	${LATEX} ${STEM}

## count      : count the number of rules.
count :
	@fgrep rulemajor rules.tex | grep -v newcommand
	@fgrep rulemajor rules.tex | grep -v newcommand | wc -l

## clean      : clean up junk files.
clean :
	@rm -f *~ *.aux *.bak *.bbl *.blg *.dvi *.log *.out
