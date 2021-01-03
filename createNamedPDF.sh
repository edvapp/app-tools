#!/bin/bash

if [ "${1}" == "" ];
then
        echo "Usage ${0} Filename"
        exit 1
fi

ZEUGNISART="Notenmitteilung"

mkdir pages

# split many pages in one document into numberd single pages
pdftk ${1} burst output pages/Seite_%03d.pdf 

cd pages

for pdffile in $(ls *pdf);
do
        echo ""
        textfile=${pdffile%pdf}txt
        echo "Convert PDF to Textfile"
        echo "pdftotext ${pdffile} ${textfile}"
        pdftotext ${pdffile} ${textfile}

        echo "Get class from textfile"
        class=$(grep "Klasse:" ${textfile} | awk '{print $2}')
        if [ ! -d class ];
        then
                mkdir ${class}
        fi

        echo "Get pupils name from textfile"
        # grep -A 1 print one line after matching line
        name=$(grep -A 1 ${ZEUGNISART} ${textfile} | tail -1 | sed -e {'s/ /_/g'})

        echo "Move numberd PDF-file to named PDF-file in class directory"
        echo "mv -v ${pdffile} ${class}/${name}.pdf"
        mv -v ${pdffile} ${class}/${name}.pdf
        echo "remove Textfile"
        rm -v ${textfile}
done

