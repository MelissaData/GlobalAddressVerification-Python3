#!/bin/bash

# Runs the Melissa Global Address Verification Cloud API Python 3 sample.
#
# This script runs GlobalAddressVerificationPython3.py with python3, passing along the
# license and (if supplied) the address fields.
#
# Overall flow:
#   1. Parse the command-line options below.
#   2. Resolve the license (--license, then a prompt, then the MD_LICENSE environment variable).
#   3. Run GlobalAddressVerificationPython3.py: with the address fields if any was
#      supplied, otherwise with only the license (the Python program prompts for each
#      field).
#
# Options (each takes a value):
#   --addressline1         Street address to verify.
#   --locality             Locality (city) to verify.
#   --administrativearea   Administrative area (state/province) to verify.
#   --postal               Postal code to verify.
#   --country              Country to verify.
#   --license              License string. If omitted, the script prompts for it; if the prompt
#                          is left blank, it falls back to MD_LICENSE. Running without --license
#                          always prompts, even when MD_LICENSE is set.
#
# Examples:
#   ./GlobalAddressVerificationPython3.sh --license "your-license"
#   ./GlobalAddressVerificationPython3.sh --addressline1 "22382 Avenida Empresa" --locality "Rancho Santa Margarita" --administrativearea "CA" --postal "92688" --country "United States" --license "your-license"

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

# Read each --flag and its value. A flag with no value, or whose value starts with "-",
# is an error. Unrecognized options are ignored.
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
# No address fields supplied -> run with only the license (the program prompts for each field);
# otherwise pass them all through. Unsupplied fields arrive as empty strings, and the
# program prompts for them.
# The postal code is passed as --postal, which argparse accepts as an abbreviation of --postalcode.
if [ -z "$addressline1" ] && [ -z "$locality" ] && [ -z "$administrativearea" ] && [ -z "$postal" ] && [ -z "$country" ];
then
    python3 GlobalAddressVerificationPython3.py --license "$license"
else
    python3 GlobalAddressVerificationPython3.py \
      --license "$license" \
      --addressline1 "$addressline1" \
      --locality "$locality" \
      --administrativearea "$administrativearea" \
      --postal "$postal" \
      --country "$country"
fi

