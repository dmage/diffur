# Makefile

LATEX=latex
MPOST=mpost --tex=$(LATEX)
MPOST_TMPTEX=.mptmp
DVIPS=dvips

all: diffur

diffur: diffur.dvi diffur.pdf

diffur.dvi: diffur.tex diffur.ind diffur/1.eps diffur/2.eps diffur/3.eps diffur/4.eps
	latex diffur.tex
	latex diffur.tex

diffur.pdf: diffur.tex diffur.ind diffur/1.mps diffur/2.mps diffur/3.mps diffur/4.mps
	pdflatex diffur.tex
	pdflatex diffur.tex

diffur.ind: diffur.tex
	rumakeindex diffur
	cat diffur.ind | iconv -f koi8-r -t utf8 > diffur.tmp
	mv diffur.tmp diffur.ind

diffur/%.eps: diffur.%
	@echo "\input{preheader}" > $(MPOST_TMPTEX).tex
	@echo "\usepackage{graphics}" >> $(MPOST_TMPTEX).tex
	@echo "\DeclareGraphicsRule{*}{eps}{*}{}" >> $(MPOST_TMPTEX).tex
	@echo "\nofiles" >> $(MPOST_TMPTEX).tex
	@echo "\begin{document}" >> $(MPOST_TMPTEX).tex
	@echo "\thispagestyle{empty}" >> $(MPOST_TMPTEX).tex
	@echo "\includegraphics{$<}" >> $(MPOST_TMPTEX).tex
	@echo "\end{document}" >> $(MPOST_TMPTEX).tex
	@$(LATEX) $(MPOST_TMPTEX)
	@$(DVIPS) -E -o $@ $(MPOST_TMPTEX)
	@rm $(MPOST_TMPTEX).*
diffur/%.mps: diffur.%
	cp $< $@

diffur.1: diffur.mp
	$(MPOST) diffur.mp
diffur.2: diffur.mp
	$(MPOST) diffur.mp
diffur.3: diffur.mp
	$(MPOST) diffur.mp
diffur.4: diffur.mp
	$(MPOST) diffur.mp

clean:
