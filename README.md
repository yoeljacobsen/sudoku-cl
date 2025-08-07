# Sudoku Solver

This project implements a Sudoku solver in Common Lisp, with unit tests, optimization declarations, and a `Makefile` for easy management.

## Getting Started

To get a local copy up and running, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone git@github.com:yoeljacobsen/sudoku-cl.git
    cd sudoku-cl
    ```

2.  **Install Roswell:** If you don't have Roswell installed, follow the instructions on their official website.

3.  **Build the executable:**
    ```bash
    make
    ```

## Usage

*   **Run the solver:**
    ```bash
    make run
    ```
    To solve a specific number of problems (e.g., the first 5 problems from each category):
    ```bash
    NUM_PROBLEMS=5 make run
    ```

*   **Run tests:**
    ```bash
    make test
    ```

*   **Rebuild `problems.json`:** This will fetch new Sudoku problems from `https://github.com/grantm/sudoku-exchange-puzzle-bank` and update `problems.json`.
    ```bash
    make rebuild
    ```
    To limit the number of problems fetched from each category (e.g., 20 problems per category):
    ```bash
    MAX_PROBLEMS_PER_FILE=20 make rebuild
    ```

*   **Clean build artifacts:**
    ```bash
    make clean
    ```
