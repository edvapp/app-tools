#!/bin/bash

du -h --max-depth=1 /home/pupils/ts/2009 | sort -h >> homedirsize.txt

du -h --max-depth=1 /home/pupils/ts/2010 | sort -h >> homedirsize.txt

du -h --max-depth=1 /home/pupils/brg/2011 | sort -h >> homedirsize.txt

du -h --max-depth=1 /home/pupils/brg/2012 | sort -h >> homedirsize.txt

du -h --max-depth=1 /home/teachers | sort -h >> homedirsize.txt

mv homedirsize.txt /home/teachers/ttfinr/Dokumente/homedirsize.txt

chown 4515:2000  /home/teachers/ttfinr/Dokumente/homedirsize.txt

