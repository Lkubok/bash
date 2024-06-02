#!/usr/bin/env bash

wget -c https://downloads.codingcoursestv.eu/055%20-%20bash/wget/download-slow/ -b

wget -v https://downloads.codingcoursestv.eu/055%20-%20bash/wget/download-slow/ --content-disposition

wget https://downloads.codingcoursestv.eu/055%20-%20bash/wget/folder/ -r -l 5 -np -A jpg -e robots=off

wget https://downloads.codingcoursestv.eu/055%20-%20bash/wget/gym -r -l 5 -np -e robots=off -p -k
