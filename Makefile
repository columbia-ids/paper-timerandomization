date = $(shell date '+%Y%m%d')
STYLE_FILES = IEEEtran.cls IEEEtran.bst IEEEabrv.bib
SECTIONS = report abstract intro time-randomization experiment results future related
FIGURES = libsafe-all libsafe-post libsafe-pre libsafe-all libvirt-post libvirt-pre

$(date)TimeRandomization.pdf : $(STYLE_FILES) $(SECTIONS:=.tex) $(addprefix figures/, $(FIGURES:=.png)) references.bib
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	bibtex $(date)TimeRandomization
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	pdflatex -jobname $(date)TimeRandomization report.tex

.PHONY : clean

clean :
	rm -vf *TimeRandomization.pdf *.aux *.log *.out *.ent *.bbl *.blg
