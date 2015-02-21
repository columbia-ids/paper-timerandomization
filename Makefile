date = $(shell date '+%Y%m%d')
SECTIONS = report abstract intro time-randomization experiment results future related conclusion
CODE_FILES = libsafe-PoC.c nonatomic.py
FIGURES = libsafe-all-zoom libsafe-all libsafe-post libsafe-pre libvirt-post libvirt-pre nonatomic-post

$(date)TimeRandomization.pdf : usenix.sty $(SECTIONS:=.tex) $(CODE_FILES) $(addprefix figures/, $(FIGURES:=.png)) references.bib
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	bibtex $(date)TimeRandomization
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	pdflatex -jobname $(date)TimeRandomization report.tex

.PHONY : clean

clean :
	rm -vf *TimeRandomization.pdf *.aux *.log *.out *.ent *.bbl *.blg
