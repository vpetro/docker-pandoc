FROM ubuntu:yakkety

RUN apt-get update && \
    apt-get install pandoc texlive texlive-xetex xzdec wget lmodern fonts-lmodern python-pip -y --no-install-recommends && \
    tlmgr init-usertree && \
    tlmgr update --all && \
    pip install --upgrade pip && \
    pip install setuptools && \
    pip install watchdog

CMD cd slides && \
    watchmedo shell-command --patterns="*.md" --command='echo "running.." && find . -name *.md | xargs -I file pandoc -t beamer --latex-engine xelatex -V theme:metropolis -o file.pdf file'
