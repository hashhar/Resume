# This makefile invokes make from the SRC directory to ensure that LaTeX tools
# find the class, style and font files properly.

# The directory which contains the main tex file, class, style and font files.
SRC=src
# The rule to be invoked (meant to be the same as the name of the tex file).
RESUMEBASE=resume-base

all:
	$(MAKE) -C $(SRC) $(RESUMEBASE).pdf

cleanall:
	$(MAKE) -C $(SRC) cleanall

clean:
	$(MAKE) -C $(SRC) clean

debug:
	$(MAKE) -C $(SRC) debug

force:
	$(MAKE) -C $(SRC) force

watch:
	$(MAKE) -C $(SRC) watch

.PHONY: all clean cleanall debug force watch
