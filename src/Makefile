# The LaTeX processor to use and the options to be passed to it.
LATEX=xelatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=batchmode

# The LaTeX compilation tool to use and the options to be passed to it.
LATEXMK=latexmk
LATEXMKOPT=-pdf -xelatex -quiet
CONTINUOUS=-pvc

# The name of the main tex file to compile. This must be the same as the name of
# the directory that contains the included tex files to ensure that the
# RESUMEDEPS variable is computed correctly.
RESUMEBASE=resume-base
RESUMEDEPS := $(foreach dir,$(RESUMEBASE),$(wildcard $(dir)/*.tex))
FIGURES := $(shell find figures/* images/* -type f)
DEPS=$(RESUMEBASE).tex $(RESUMEDEPS) $(FIGURES)

# Rule to compile RESUMEBASE.tex into RESUMEBASE.pdf
$(RESUMEBASE).pdf: $(DEPS)
	$(LATEXMK) $(LATEXMKOPT) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(RESUMEBASE)

# Force recompilation.
force: $(DEPS)
	touch .refresh
	rm $(RESUMEBASE).pdf
	$(LATEXMK) $(LATEXMKOPT) \
		-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(RESUMEBASE)
	rm .refresh

# Clean extra files.
cleanall:
	$(LATEXMK) -C $(RESUMEBASE)
	rm -f $(RESUMEBASE).pdfsync
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk
	rm -f *.html *.htm

# Clean extra files excluding ps, dvi and pdf files.
clean:
	$(LATEXMK) -c $(RESUMEBASE)
	rm -f $(RESUMEBASE).pdfsync
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk

# Run LATEXMK in continuous mode. ie. recompile tex file and reload the PDF
# viewer if the tex file changes.
watch: $(DEPS)
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(RESUMEBASE)

# Run LATEX with verbose messages enabled to be able to debug issues.
debug: $(DEPS)
	$(LATEX) $(LATEXOPT) $(RESUMEBASE)

.PHONY: force clean cleanall watch debug
