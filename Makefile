.PHONY: build buildn open clean zip

# The file we want to view
view = notes

build: $(view).pdf open
buildn: *.pdf

%.pdf: %.dot
	dot -Tpdf $*.dot > $*.pdf

%.pdf: %.tex
	pdflatex $*.tex

open: $(view).pdf
	if [ `uname` = "Darwin" ];\
		then open $(view).pdf;\
		else see $(view).pdf;\
	fi

clean:
	-rm *.log *.aux *.out