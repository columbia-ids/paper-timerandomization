date = $(shell date '+%Y%m%d')

$(date)TimeRandomization.pdf : report.tex usenix.sty libsafe-PoC.c references.bib
	pdflatex -jobname $(date)TimeRandomization report.tex
	bibtex $(date)TimeRandomization
	pdflatex -jobname $(date)TimeRandomization report.tex
	pdflatex -jobname $(date)TimeRandomization report.tex

.PHONY : clean
clean :
	rm -vf *TimeRandomization.pdf *.aux *.log *.out *.ent
