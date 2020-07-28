#!/usr/bin/env bash
make clean
make latexpdf
cp -vf _build/latex/OMS应急手册.pdf ./OMS应急手册.pdf
git add OMS应急手册.pdf
