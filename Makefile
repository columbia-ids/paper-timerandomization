report.pdf : report.tex usenix.sty libsafe-PoC.c
	pdflatex report.tex
	pdflatex report.tex

.PHONY : clean
clean :
	rm -vf report.pdf *.aux *.log *.out *.ent
