<#
.SYNOPSIS
    Runs the Melissa Global Address Verification Cloud API Python 3 sample.

.DESCRIPTION
    This script runs GlobalAddressVerificationPython3.py with python3, passing along
    the license and (if supplied) the address fields.

    Overall flow:
      1. Resolve the license (parameter, prompt, or MD_LICENSE environment variable).
      2. Run GlobalAddressVerificationPython3.py: with the address fields if any was
         supplied, otherwise with only the license (the Python program prompts for each field).

.PARAMETER addressline1
    Street address to verify.

.PARAMETER locality
    Locality (city) to verify.

.PARAMETER administrativearea
    Administrative area (state/province) to verify.

.PARAMETER postal
    Postal code to verify.

.PARAMETER country
    Country to verify.

.PARAMETER license
    License string. Resolved in this order:
      1. This parameter.
      2. An interactive prompt, if the parameter was not supplied.
      3. The MD_LICENSE environment variable, if the prompt was left blank.
    Note that the environment variable is the last resort, not the first: running
    without -license always prompts, even when MD_LICENSE is set.

.PARAMETER quiet
    Accepted for parity with other sample scripts; not currently used to suppress output.

.EXAMPLE
    .\GlobalAddressVerificationPython3.ps1 -license "your-license"

.EXAMPLE
    .\GlobalAddressVerificationPython3.ps1 -addressline1 "22382 Avenida Empresa" -locality "Rancho Santa Margarita" -administrativearea "CA" -postal "92688" -country "United States" -license "your-license"
#>

######################### Parameters ##########################
param(
    $addressline1 = '',
    $locality = '',
    $administrativearea = '',
    $postal = '',
    $country = '',
    $license = '',
    [switch]$quiet = $false
    )

########################## Main ############################
Write-Host "`n========== Melissa Global Address Verification Cloud API =============`n"

# Get license (either from parameters or user input)
if ([string]::IsNullOrEmpty($license) ) {
  $license = Read-Host "Please enter your license string"
}

# Check for License from Environment Variables 
if ([string]::IsNullOrEmpty($license) ) {
  $license = $env:MD_LICENSE
}

if ([string]::IsNullOrEmpty($license)) {
  Write-Host "`nLicense String is invalid!"
  Exit
}

# Run project
# No address fields supplied -> run with only the license (the program prompts); otherwise pass the supplied ones through.
# -postal is passed as --postalcode, the program's full flag name.
if ([string]::IsNullOrEmpty($addressline1) -and [string]::IsNullOrEmpty($locality) -and [string]::IsNullOrEmpty($administrativearea) -and [string]::IsNullOrEmpty($postal) -and [string]::IsNullOrEmpty($country)) {
  python3 GlobalAddressVerificationPython3.py --license $license 
}
else {
  # Only pass flags that have a value. Windows PowerShell drops empty-string arguments to
  # native programs, which would shift the next flag name into this flag's value.
  # Any field left out here is prompted for by the program.
  $runArgs = @('--license', $license)
  if (-not [string]::IsNullOrEmpty($addressline1))       { $runArgs += '--addressline1', $addressline1 }
  if (-not [string]::IsNullOrEmpty($locality))           { $runArgs += '--locality', $locality }
  if (-not [string]::IsNullOrEmpty($administrativearea)) { $runArgs += '--administrativearea', $administrativearea }
  if (-not [string]::IsNullOrEmpty($postal))             { $runArgs += '--postalcode', $postal }
  if (-not [string]::IsNullOrEmpty($country))            { $runArgs += '--country', $country }
  python3 GlobalAddressVerificationPython3.py @runArgs
}
