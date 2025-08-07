SHELL := /bin/bash

.PHONY: run test clean

all: sudoku-cl

run: sudoku-cl
	./sudoku-cl

test:
	ros sudoku-cl-test.ros

sudoku-cl: sudoku-cl.ros
	ros run --lisp sbcl --eval "(load \"sudoku-cl.ros\")" --eval "(sb-ext:save-lisp-and-die \"sudoku-cl\" :toplevel #'sudoku-cl:main :executable t)"

clean:
	rm -f sudoku-cl
