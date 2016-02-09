date = $(shell date '+%Y%m%d')
STYLE_FILES = IEEEtran.cls IEEEtran.bst IEEEabrv.bib
SECTIONS = report abstract intro time-randomization experiment results future related conclusion
FIGURES = libsafe-all libsafe-post libsafe-pre libsafe-all libvirt-post libvirt-pre

$(date)TimeRandomization.pdf : $(STYLE_FILES) $(SECTIONS:=.tex) $(addprefix figures/, $(FIGURES:=.png)) references.bib
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	bibtex $(date)TimeRandomization
	pdflatex -draftmode -jobname $(date)TimeRandomization report.tex
	pdflatex -jobname $(date)TimeRandomization report.tex

dvi : $(date)TimeRandomization.dvi.pdf

$(date)TimeRandomization.dvi.pdf : $(date)TimeRandomization.dvi.dvi
	dvipdfm $(date)TimeRandomization.dvi.dvi

$(date)TimeRandomization.dvi.dvi : $(STYLE_FILES) $(SECTIONS:=.tex) $(addprefix figures/, $(FIGURES:=.png)) references.bib
	latex -draftmode -jobname $(date)TimeRandomization.dvi report.tex
	bibtex $(date)TimeRandomization.dvi
	latex -draftmode -jobname $(date)TimeRandomization.dvi report.tex
	latex -jobname $(date)TimeRandomization.dvi report.tex

.PHONY : clean

clean :
	rm -vf *TimeRandomization*.pdf *.dvi *.aux *.log *.out *.ent *.bbl *.blg
