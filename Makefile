TOPACK= ausarb.tex hsrmlogo.sty ausarb.bib online.bib \
	zeichnung.odg zeichnung.pdf \
        Makefile

all: ausarb.pdf

fachsemtemplate.zip: $(TOPACK)
	-/bin/rm -r fachsemtemplate
	mkdir fachsemtemplate
	cp $(TOPACK) fachsemtemplate
	zip -r fachsemtemplate.zip fachsemtemplate

ausarb.pdf: ausarb.tex
	pdflatex -interaction=nonstopmode ausarb.tex
	bibtex ausarb1
	bibtex ausarb2
# texen mit neuen Referenzen
	pdflatex -interaction=nonstopmode ausarb.tex 
# Jetzt spätestens sollte alles stimmen
	pdflatex -interaction=nonstopmode ausarb.tex 

clean:
	-/bin/rm ausarb.pdf *.lof *.log *.lot *.aux *.bbl *.toc *.blg
