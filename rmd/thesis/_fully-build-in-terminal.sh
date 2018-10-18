#!/bin/sh

# start in project directory
# move into writing
cd bottom-up

# render the full book
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"

# back to project root
cd ..

# probably want to do fully specified file paths
