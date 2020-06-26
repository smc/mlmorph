sed 's/\s/\n/g'| sed  -f ./scripts/corpora-cleanup.sed | mlmorph -a| awk '/?$/ {print $1}' | sort -u
