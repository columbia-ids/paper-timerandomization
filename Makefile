date = $(shell date '+%Y%m%d')

$(date)TimeRandomization.pdf : report.tex abstract.tex intro.tex time-randomization.tex experiment.tex results.tex future.tex related.tex conclusion.tex usenix.sty libsafe-PoC.c nonatomic.py references.bib
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	bibtex $(date)TimeRandomization
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	pdflatex -jobname $(date)TimeRandomization report.tex

.PHONY : clean

clean :
	rm -vf *TimeRandomization.pdf *.aux *.log *.out *.ent *.bbl *.blg
