date = $(shell date '+%Y%m%d')

$(date)TimeRandomization.pdf : report.tex abstract.tex intro.tex time-randomization.tex experiment.tex results.tex future.tex related.tex conclusion.tex usenix.sty libsafe-PoC.c nonatomic.py references.bib
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	bibtex $(date)TimeRandomization
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	pdflatex -jobname $(date)TimeRandomization report.tex

abstract.pdf : abstract.tex abstract-only.tex
	pdflatex -jobname abstract abstract-only.tex

.PHONY : abstract clean

abstract : abstract.pdf

clean :
	rm -vf *TimeRandomization.pdf abstract.pdf *.aux *.log *.out *.ent *.bbl *.blg
