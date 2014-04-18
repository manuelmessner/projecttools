#
# Which mpost program
#
MP=$(shell which mpost)

#
# Mpost flags
#
MP_FLAGS=-halt-on-error

#
# The Objects which should be result from compiling the umls
#
OBJS=$(patsubst %.mp, %.1, $(wildcard *.mp))

#
# The test-pdfs to generate
#
PDFS=$(patsubst %.mp, %.pdf, $(wildcard *.mp))

#
# The location of the uml-to-tex script
#
GEN_TEST_PDF=../scripts/gen/uml_test_pdf.gen.sh

#
# Removeables
#
REMOVEABLE_EXT=1 log aux pdf tex

#
# Standard task
#
all: $(OBJS)

#
# Test-task
#
test_uml: $(PDFS)

#
# Compiling one uml to .1 file
#
%.1: %.mp
	@$(ECHO) "\t[MP]\t$^"
	@$(MP) $(MP_FLAGS) $^ >> $(MAKELOG)

#
# Generate TeX files for testing
#
%.tex: %.1
	@echo -e "\t[GEN]\t$@"
	@$(GEN_TEST_PDF) $@ $<

#
# Generate PDFs for testing
#
%.pdf: %.tex
	@echo -e "\t[LATEX]"
	@$(LATEX) $(LATEX_FLAGS) $< >> $(basename $@).log


#
# Keep TeX files although they are intermediate files
#
.SECONDARY: $(patsubst %.pdf, %.tex, $(PDFS))


#
# Clean this directory
#
clean:
	@for x in $(REMOVEABLE_EXT); do \
		$(ECHO) "\t[RM]\t*.$$x";	\
		$(RM) *.$$x;				\
	done
