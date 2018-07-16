THEME_URL="ui/yaka"
OPTIONS=--theme-url ${THEME_URL} --no-compact-list --current-slide

INPUT_FILE=notes.rst
OUTPUT_FILE=slides.html

all: slides

slides: ${OUTPUT_FILE}

${OUTPUT_FILE}: ${INPUT_FILE}
	rst2s5.py ${OPTIONS} $^ $@
