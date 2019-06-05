sed 's/\s/\n/g'| sed  -f ./scripts/corpora-cleanup.sed | hfst-lookup malayalam.analyser | awk '/inf$/ {print $1}' | sort -u
