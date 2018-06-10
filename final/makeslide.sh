#!/bin/bash

pandoc -t beamer -o slide.md.pdf --pdf-engine=xelatex slide.md
#pandoc -t beamer -o slide.md.pdf  slide.md
evince slide.md.pdf
