# How this works

This starts with TJ Mahr's [`buckydown`](https://github.com/tjmahr/buckydown) package, which itself is inspired by earlier memoir-based thesis classes by Wisconsin and Washington students of years past. 

The goal: build a thesis using `bookdown`, pdflatex, but extract and modify Mahr's `template.tex` file for my own aesthetic and structural tweaks.

If you are not already familiar with the templating system, here's how it works. 

- parameters/variables in `index.Rmd`'s YAML are passed into the template file. You can futz with these variables however you'd like in the template file, create your own, etc.
- the template has conditions for different build engines, but the bookdown default pdf book uses pdflatex. If you want font flexibility, you can add an argument to `pdf_book` in the YAML to build with `xelatex`, but the typography is a little less good than with `pdflatex`. If you are happy w/ fonts then don't mess with this. (The main reason why I wanted to use `bookdown`'s built-in sauce rather than `buckydown` was simply because I wanted pdflatex and not xelatex...no offense to TJ!). 
- The aesthetics of the template file are the main differences from Mahr's template.

Here's how building happens

- `index.Rmd` is the "main" document. This is what gets built into the book.
- building chapters:
  + individual `rmd` files can be built into HTML files whenever you want. This is how you can build and examine one chapter at a time without fussing with dependencies in the whole document.
- Building the book:
  + I don't like Rstudio, so I need to manually mess with building more. I put together the `_fully-build-in-terminal.sh` file for this purpose. With Sublime open, I can build the book in the terminal by highlighting all the text in the file and sending it to the terminal using SendCode or some other Sublime package. I also created by own build system in Sublime that takes care of this, so this `.sh` file is really only here to give people a foundation for how they might build their stuff their own way. 
  + The full build is controlled by the `_bookdown.yml` file. This file says which Rmd's get pieced together in what order (overrides the default, which is grabbing every RMD in the directory in alphabetical order)
  + book gets built into a directory called `book_filename`
  + `new_session` controls whether bookdown runs one single R session to build all documents, or separate. Default is no new session, which is more integrated but seems dangerous to me.

