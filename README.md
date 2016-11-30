# Pandoc with Latex/Xelatex + watchdog

Pandoc is a great document converter.  Latex/Xetex is a great typesetting
system.  Unfortunately, installing the above can be tricky.

This image is setup to build PDF sideshows from Markdown source.

Pull down the image with:

```shell
docker pull vpetro/pandoc
```


## Continuous mode

Note that on OS X this only works with the latest version of Docker for Mac. If
you are using Virtualbox/docker-machine based setup, to use this you will have
to upgrade or use the second method below.

Go into the directory that contains the Markdown source for the PDF presentation and run:

```
docker run -d -v `pwd`:/slides vpetro/pandoc
```

The above will create the container that watches the current directory for
changes to Markdown files. Pandoc will run any time there is a change to a
Markdown file in the current directory.


## Run at will mode


Alternatively, the image can be used a big Pandoc executable to be run at will.
Assuming you have a file named `document.md` in the current directory, the
following command will produce a PDF version of the Markdown document.

```
docker run -v `pwd`:/slides pandoc pandoc /slides/document.md --latex-engine=xelatex -o document.pdf
```

or

```
 docker run -v `pwd`:/slides vpetro/pandoc:latest pandoc /slides/slides.md --latex-engine xelatex -o /slides/slides.pdf
 ```
