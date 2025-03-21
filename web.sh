#!/bin/bash

# Perform path traversal on target host.
function brute_force () {
    # Host name
    HOST_NAME=$1
    # File path to word list
    WORD_LIST_PATH=$2
    # Remove the first / from each word in word list
    sed -i 's|^/||' "$WORD_LIST_PATH"
	# Split file contents by \n and store in array
	mapfile -t WORD_LIST < "$WORD_LIST_PATH"
	# Iterate over word list array and return status code with URL redirects 
	for WORD in "${WORD_LIST[@]}"; do	
		STATUS_CODE=$( curl -s -o /dev/null -w "%{http_code} %{url_effective} --> %{redirect_url}" -L "$HOST_NAME/$WORD" )
		echo "$STATUS_CODE $HOST_NAME/$WORD"
	done
}

if [[ "$1" == 'h' || "$1" == 'help' ]]; then
    echo -e "web.sh <command>\n"
    echo -e "Usage:\n"
    echo "./web.sh (h)elp ..Get information on how to use this script"
    echo "./web.sh (b)rute-force http(s)://host.tld /path/to/wordlist/text/file ..Perform path traversal on target host"
    exit 0
elif [[ "$1" == "b" || "$1" == "brute-force" ]]; then
    brute_force "$2" "$3"
else
    echo "Unknown command. Please consult the h or help command for guidance."
fi
