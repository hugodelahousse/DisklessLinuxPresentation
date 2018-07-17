THEME_URL="ui/yaka"
OPTIONS=--theme-url ${THEME_URL} --no-compact-list --current-slide
BEAMER_OPTIONS=--overlaybullets=true --theme=/custom
OUTPUT_NAME=diskless_linux

INPUT_FILE=notes.rst
HTML_OUTPUT_FILE=build/${OUTPUT_NAME}.html

all: slides beamer beamer_with_notes

slides: ${HTML_OUTPUT_FILE}

${HTML_OUTPUT_FILE}: ${INPUT_FILE}
	rst2s5.py ${OPTIONS} $^ $@

beamer: build/${OUTPUT_NAME}.pdf

beamer_with_notes: build/${OUTPUT_NAME}_with_notes.pdf

build/${OUTPUT_NAME}.pdf: build/${OUTPUT_NAME}.tex
	pdflatex -output-directory build $^

build/${OUTPUT_NAME}_with_notes.pdf: build/${OUTPUT_NAME}_with_notes.tex
	pdflatex -output-directory build $^

build/${OUTPUT_NAME}_with_notes.tex: ${INPUT_FILE}
	rst2beamer ${BEAMER_OPTIONS} $^ $@ --shownotes=true
