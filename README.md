# Melissa - Global Address Verification Cloud API Python3

## Purpose
This code showcases the Melissa Global Address Verification Cloud API using Python3.

Please feel free to copy or embed this code to your own project. Happy coding!

For the latest Melissa Global Address Verification release notes, please visit: https://releasenotes.melissa.com/cloud-api/global-address-verification/

For further documentation, please visit: https://www.melissa.com/quickstart-guides/global-address

The console will ask the user for:

- AddressLine1
- Locality
- AdministrativeArea
- PostalCode
- Country

And return information of the address such as:

- Results
- FormattedAddress
- AddressLines[1-8]
- DoubleDependentLocality
- DependentLocality
- Locality
- SubAdministrativeArea
- AdministrativeArea
- PostalCode Information
- AddressType
- AddressKey
- SubNationalArea
- CountryName
- CountrySubdivisionCode
- Thoroughfare Information
- DependentThoroughfare Information
- Building
- Premises Information
- SubPremises Information
- PostBox
- Latitude and Longitude
- DeliveryIndicator
- MelissaAddressKey (MAK)
- MelissaAddressKeyBase
- PostOfficeLocation
- SubPremiseLevel Information
- SubBuilding Information
- UTC
- DST
- DeliveryPointSuffix
- CensusKey
- Extras

## Tested Environments
- Windows 10 64-bit Python 3.10.4, Powershell 5.1
- Ubuntu Linux 20.04.04 LTS 64-bit Python 3.10.4
- Global Address Verification Cloud API Version 3.0.1.174

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Download this project
```
$ git clone https://github.com/MelissaData/GlobalAddressVerification-Python3
$ cd GlobalAddressVerification-Python3
```

## Windows

#### Install Python3
Before starting, make sure that Python3 has been correctly installed on your machine and your environment paths are configured. 

You can download Python here: 
https://www.python.org/downloads/

To set up your Path to correctly to use the python3 command, execute the following steps:
1) Run Powershell as an administrator 
2) Execute the command: 
`New-Item -ItemType SymbolicLink -Path "Link" -Target "Target"`

    where "Target" is the path to py.exe (by default this should be "C:\Windows\py.exe")\
    and "Link" is the path to py.exe, but "py.exe" is replaced with "python3.exe"\
    For Example:\
    `New-Item -ItemType SymbolicLink -Path "C:\Windows\python3.exe" -Target "C:\Windows\py.exe"`

If you are unsure, you can check by opening a command prompt window and typing the following:
`python3 --version`

![alt text](/screenshots/python_version.png)

#### Run Powershell Script
Parameters:
- -addressline1: an input addressline1
- -locality: an input locality
- -administrativearea: an input administrative area
- -postalcode: an input postal code
- -country: an input country

  This is convenient when you want to get results for a specific request in one run instead of testing multiple records in interactive mode.  

- -license (optional): a license string to test the Cloud API

There are two modes:

- Interactive 

	The script will prompt the user for input(s), then use the provided input(s) to call the Cloud API. For example:
	```
	$ .\GlobalAddressVerificationPython3.ps1
	```

- Command Line 

	You can pass a company, addressline1, locality, administrative area, postal code, country and a license string into `-addressline1`, `-locality`, `-administrativearea`, `-postal`, `-country` and `-license` parameters respectively to test the Cloud API. For example:
	```
    $ .\GlobalAddressVerificationPython3.ps1 -addressline1 "22382 Avenida Empresa" -locality "Rancho Santa Margarita" -administrativearea "CA" -postal "92688" -country "United States"
    $ .\GlobalAddressVerificationPython3.ps1 -addressline1 "22382 Avenida Empresa" -locality "Rancho Santa Margarita" -administrativearea "CA" -postal "92688" -country "United States" -license "<your_license_string>"
    ```

This is the expected output from a successful setup for interactive mode:

![alt text](/screenshots/output.png)

## Linux

#### Install Python3
Before starting, check to see if you already have the Python3 already installed by entering this command:

`python3 --version`

If the Python3 is already installed, you should see it in the following list:

![alt text](/screenshots/python_version2.png)

As long as the above list contains version `3.xx.xx` (underlined in red), then you can skip to the next step. If your list does not contain version 3, or you get any kind of error message, then you will need to download and install Python3.

To download, run the following commands to add the Microsoft package signing key to your list of trusted keys and add the package repository.

```
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

Next, you can now run this command to install the Python3:

```
sudo apt-get update && \
  sudo apt-get install -y python3
```

Once all of this is done, you should be able to verify that the Python3 is installed with the `Python3 --version` command.

#### Run Bash Script
Parameters:
- --addressline1: an input addressline1
- --locality: an input locality
- --administrativearea: an input administrative area
- --postalcode: an input postal code
- --country: an input country

  This is convenient when you want to get results for a specific request in one run instead of testing multiple records in interactive mode.    

- --license (optional): a license string to test the Cloud API

There are two modes:

- Interactive 

	The script will prompt the user for input(s), then use the provided input(s) to call the Cloud API. For example:
	```
	$ ./GlobalAddressVerificationPython3.sh
	```

- Command Line 

	You can pass an address line 1, locality, administrative area, postal code, country, and a license string into `--addressline1`, `--locality`, `--administrativearea`, `--postal`, `--country` and `--license` parameters respectively to test the Cloud API. For example:
	```
    $ ./GlobalAddressVerificationPython3.sh --addressline1 "22382 Avenida Empresa" --locality "Rancho Santa Margarita" --administrativearea "CA" --postal "92688" --country "United States"
    $ ./GlobalAddressVerificationPython3.sh --addressline1 "22382 Avenida Empresa" --locality "Rancho Santa Margarita" --administrativearea "CA" --postal "92688" --country "United States" --license "<your_license_string>"
    ```

This is the expected output from a successful setup for interactive mode:

![alt text](/screenshots/output2.png)


## Result Codes
For details about the result codes please refer to https://wiki.melissadata.com/index.php?title=Result_Code_Details#Global_Address_Verification

## Contact Us
For free technical support, please call us at 800-MELISSA ext. 4 (800-635-4772 ext. 4) or email us at tech@melissa.com.

To purchase this product, contact the Melissa sales department at 800-MELISSA ext. 3 (800-635-4772 ext. 3).
