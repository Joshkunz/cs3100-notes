.PHONY: build buildn open clean zip

# The file we want to view
view = notes
images = images

texsrc = $(shell ls *.tex)
dotsrc = $(shell ls *.dot)
dotpdf = $(patsubst %.dot,$(images)/%.pdf,$(dotsrc))

build: $(view).pdf open
buildn: *.pdf

$(view).pdf: $(view).tex $(texsrc) $(dotpdf)

$(images)/%.pdf: %.dot
	dot -Tpdf $*.dot > $(images)/$*.pdf

%.pdf: %.tex
	pdflatex $*.tex

open: $(view).pdf
	if [ `uname` = "Darwin" ];\
		then open $(view).pdf;\
		else see $(view).pdf;\
	fi

clean:
	-rm *.log *.aux *.out
