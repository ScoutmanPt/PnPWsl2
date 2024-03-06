#!/bin/bash
# Define the module\section name
modName="MyScripts" 
modSection="MyFirstScript"
# Set the help message
# next line is shellcheck override to avoid SC2034 warning
# shellcheck disable=SC2034
HELP_MESSAGE="MyFirstScript is a script that you can use as a baseline to add your own in PnP.Wsl2."
# Set the long help message(message is formatted using markdown and then passed to the echo-print function to format it for the terminal. 
# Is also prepared to be a faithful markdown file to be used in the documentation)
HELP_MESSAGE_LONG="Simple Hello World!  
  Purpose is to have a .sh baseline.
"
# Set the root folder for the core scripts
SCRIPTS_CORE_ROOT_FOLDER="$(dirname "$0")"
# Source the core script
# next line is shellcheck override to avoid SC1091 warning
# shellcheck disable=SC1091 
source "$SCRIPTS_CORE_ROOT_FOLDER/../_core/core.sh"

# Print a separator with the module name and section
echo-print-separator "$modName"  "$modSection"
# Print the long help message
echo-print "\n $HELP_MESSAGE_LONG"

## script itself 
## installs a packge
echo-print "Hello World!"
echo-print "\n\n"