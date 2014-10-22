report.pdf : report.tex usenix.sty report.out
	pdflatex report.tex

report.out :
	pdflatex report.tex

.PHONY : clean
clean :
	rm -vf report.pdf *.aux *.log *.out *.ent
