all: slides.html

slides: slides.html

slides.html: notes.rst
	rst2s5.py notes.rst slides.html --theme-url ui/yaka
