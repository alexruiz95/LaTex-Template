# Author:
#      Marin Lauber
# Copyright:
#      Copyright (c) 2019 Marin Lauber
# License:
#      GNU General Public License (see http://www.gnu.org/licenses/gpl-3.0.txt)
#  Note:
# 	   This makefile compile latex documents using pdflatex, it does not produce and *.dvi or **.ps file
#      for this please use latex to compile with dvops and ps2pdf to get the *.pdf file (all figures must
#      be of EPS types to do so).
PROJECT=main

${PROJECT}.pdf: ${PROJECT}.bbl
	pdflatex ${PROJECT}

${PROJECT}.bbl: ${PROJECT}.bcf
	biber ${PROJECT}

${PROJECT}.bcf: ${PROJECT}.tex
	pdflatex ${PROJECT}

.PHONY: clean	# prevents make of getting confused if you have a file called clean
clean:
	-rm -f *.aux
	-rm -f *.bbl
	-rm -f *.bcf
	-rm -f *.blg
	-rm -f *.lof
	-rm -f *.log
	-rm -f *.lot
	-rm -f *.out
	-rm -f *.run.xml
	-rm -f *.toc

.PHONY: cleanall	# prevents make of getting confused if you have a file called cleanall
cleanall: clean
	-rm -f *.pdf
	-rm -rf ./make
