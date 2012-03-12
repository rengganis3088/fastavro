# Makefile for fastavro project
#
# Since we distribute the generated C file for simplicity (and so that end users
# won't need to install cython). You can re-create the C file using this
# Makefile.

c_file = fastavro/cfastavro.c
py_file = fastavro/pyfastavro.py
pyc_file = fastavro/cfastavro.py

ifndef PYTHON
    PYTHON=python
endif

all: $(c_file)

$(c_file): $(py_file)
	cp $(py_file) $(pyc_file)
	cython $(pyc_file)
	rm $(pyc_file)

clean:
	rm -f $(c_file)
	rm -f $(pyc_file)

fresh: clean all

.PHONY: all clean fresh

