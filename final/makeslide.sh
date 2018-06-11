#!/bin/bash

pandoc -t beamer -o slide.md.pdf --pdf-engine=xelatex -V CJKmainfont="Source Han Sans CN Normal" slide.md

evince slide.md.pdf

# Reference: https://jdhao.github.io/2017/12/10/pandoc-markdown-with-chinese/
