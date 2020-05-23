#!/bin/bash

if [ ${1}=="" ];
then
        echo "Usage ${0} Filename"
        exit 1
fi

ZEUGNISART="Notenmitteilung"

mkdir pages

pdftk ${1} burst output pages/Seite_%03d.pdf 

cd pages

for pdffile in $(ls *pdf);
do
        echo ""
        echo "Convert ${pdffile} to Textfile"
        textfile=${pdffile%pdf}txt
        echo "pdftotext ${pdffile} ${textfile}"
        pdftotext ${pdffile} ${textfile}
        echo "Get pupils name from textfile"
        name=$(grep -A 1 ${ZEUGNISART} ${textfile} | tail -1 | sed -e {'s/ /_/g'})
        echo ${name}
        mv -v ${pdffile} ${name}.pdf
        rm -v ${textfile}
done

