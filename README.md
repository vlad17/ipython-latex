# ipython-latex

## How to install

1. Add this repo to your path (or run `install.sh` which does just that).

## How to use with latex content in Jupyter

1. Put desired packages, definitions, etc. into the `template.tplx` file in this repo.
2. Run `convertpdf.sh title src.ipynb` to convert your Jupyter notebook into a PDF with the code (and outputs) inlined, make sure to call it in the directory of the notebook. The title will be `title`, duh.
3. The resulting PDF with `src.pdf` in the cwd, along with other random latex junk.

This isn't any additional functionality over jupyter, just a convenient wrapper.

## How to add latex content to Jupyter

Take a typical ipython notebook:

![typical ipython](/typical.png)

With a cell highlighted, click on the cell menu > cell type > raw.

![menu sel](/cell.png)

Then an ipython notebook like this:

![ipy after](/full-ipy.png)

Will look like this PDF after running `convertpdf.sh "Homework 2" solutions2.ipynb`:

![ipy result](/result.png)

Yes, I hardcoded my name. Change `template.tplx` accordingly.

