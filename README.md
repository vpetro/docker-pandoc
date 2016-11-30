# Pandoc with Latex/Xetex + watchdog

Pandoc is a great document converter.  Latex/Xetex is a great typesetting
system.  Unfortunately, installing the above can be tricky.

This image is setup to build PDF sideshows from Markdown source.

Pull down the image with:

```shell
docker pull vpetro/pandoc
```

Go into the directory that contains the Markdown source for the PDF presentation and run:

```
docker run -d -v `pwd`:/slides pandoc
```

The above will create the container that watches the current directory for
changes to Markdown files. Pandoc will run any time there is a change to a
Markdown file in the current directory.


Alternatively, the image can be used a big Pandoc executable to be run at will.
Assuming you have a file named `document.md` in the current directory, the
following command will produce a PDF version of the Markdown document.

```
docker run -v `pwd`:/slides pandoc pandoc /slides/document.md --latex-engine=xelatex -o document.pdf
```


