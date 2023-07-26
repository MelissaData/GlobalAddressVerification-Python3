#!/bin/bash

# Name:    GlobalAddressVerificationCloudAPI
# Purpose: Execute the GlobalAddressVerificationCloudAPI program

######################### Constants ##########################

RED='\033[0;31m' #RED
NC='\033[0m' # No Color

######################### Parameters ##########################

addressline1=""
locality=""
administrativearea=""
postal=""
country=""
license=""

while [ $# -gt 0 ] ; do
  case $1 in
    --addressline1) 
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'addressline1\'.${NC}\n"  
            exit 1
        fi 

        addressline1="$2"
        shift
        ;;
    --locality)  
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'locality\'.${NC}\n"  
            exit 1
        fi 

        locality="$2"
        shift
        ;;
    --administrativearea) 
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'administrativearea\'.${NC}\n"  
            exit 1
        fi 

        administrativearea="$2"
        shift
        ;;
    --postal)         
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'postal\'.${NC}\n"  
            exit 1
        fi 
        
        postal="$2"
        shift
        ;;
    --country) 
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'country\'.${NC}\n"  
            exit 1
        fi 

        country="$2"
        shift
        ;;
    --license) 
        if [ -z "$2" ] || [[ $2 == -* ]];
        then
            printf "${RED}Error: Missing an argument for parameter \'license\'.${NC}\n"  
            exit 1
        fi 

        license="$2"
        shift 
        ;;
  esac
  shift
done

########################## Main ############################
printf "\n================= Melissa Global Address Verification Cloud Service API ================\n"

# Get license (either from parameters or user input)
if [ -z "$license" ];
then
  printf "Please enter your license string: "
  read license
fi

# Check for License from Environment Variables 
if [ -z "$license" ];
then
  license=`echo $MD_LICENSE` 
fi

if [ -z "$license" ];
then
  printf "\nLicense String is invalid!\n"
  exit 1
fi

# Run project
if [ -z "$addressline1" ] && [ -z "$locality" ] && [ -z "$administrativearea" ] && [ -z "$postal" ] && [ -z "$country" ];
then
    python3 GlobalAddressVerificationPython3.py --license $license  
else
    python3 GlobalAddressVerificationPython3.py \
      --license "$license" \
      --addressline1 "$addressline1" \
      --locality "$locality" \
      --administrativearea "$administrativearea" \
      --postal "$postal" \
      --country "$country"
fi

