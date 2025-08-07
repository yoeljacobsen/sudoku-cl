SHELL := /bin/bash

.PHONY: run test clean rebuild

all: sudoku-cl

run:
	NUM_PROBLEMS=$(NUM_PROBLEMS) ./sudoku-cl

test:
	ros sudoku-cl-test.ros

sudoku-cl: sudoku-cl.ros
	ros run --lisp sbcl --eval "(load \"sudoku-cl.ros\")" --eval "(sb-ext:save-lisp-and-die \"sudoku-cl\" :toplevel #'sudoku-cl:main :executable t)"

rebuild:
	if [ -d "sudoku-exchange-puzzle-bank" ]; then (cd sudoku-exchange-puzzle-bank && git pull); else git clone https://github.com/grantm/sudoku-exchange-puzzle-bank.git sudoku-exchange-puzzle-bank; fi
	MAX_PROBLEMS_PER_FILE=$(MAX_PROBLEMS_PER_FILE) ros rebuild-problems.ros
	git add problems.json GEMINI.md
	git diff-index --quiet HEAD || git commit -m "Rebuild problems.json from grantm/sudoku-exchange-puzzle-bank and update checkpoint."


clean:
	rm -f sudoku-cl
	rm -rf sudoku-exchange-puzzle-bank