# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = python -msphinx
SPHINXPROJ    = akka-book
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile



open-html:
	open _build/html/index.html


push:
	git add .
	git commit -a -m 'auto commit'
	git push origin master


publish:
	rm -vrf dafengstudio-books.akka-book|true
	mkdir -p dafengstudio-books.akka-book
	git clone https://yishenggudou:${token}@github.com/dafengstudio-books/akka-book.git dafengstudio-books.akka-book
	cp -vrf _build/html/* dafengstudio-books.akka-book/docs/
	cd dafengstudio-books.akka-book;git config user.name yishenggudou;git config user.email yishenggudou@gmail.com
	cd dafengstudio-books.akka-book;git add docs/* -f ;git commit -a -m 'auto build by github action'; git push origin

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)