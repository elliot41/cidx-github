#!/bin/bash
# Salesforce CLI Environment Variables
# https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_cli_env_variables.htm

# By default, the CLI periodically checks for and installs updates.
# Disable (false) this auto-update check to improve performance of CLI commands.
export SFDX_AUTOUPDATE_DISABLE=false

# Set to true if you want to use the generic UNIX keychain instead of the Linux libsecret library or macOS keychain.
# Specify this variable when using the CLI with ssh or "headless" in a CI environment.
export SFDX_USE_GENERIC_UNIX_KEYCHAIN=true

# Specifies the time, in seconds, that the CLI waits for the Lightning Experience custom domain to resolve and become available in a newly-created scratch org.
# If you get errors about My Domain not configured when you try to use a newly-created scratch org, increase this wait time.
export SFDX_DOMAIN_RETRY=300

# For force:package:create, disables automatic updates to the sfdx-project.json file.
export SFDX_PROJECT_AUTOUPDATE_DISABLE_FOR_PACKAGE_CREATE=true

# For force:package:version:create, disables automatic updates to the sfdx-project.json file.
export SFDX_PROJECT_AUTOUPDATE_DISABLE_FOR_PACKAGE_VERSION_CREATE=true

# Install Salesforce CLI
mkdir sfdx
CLIURL=https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz
wget -qO- $CLIURL | tar xJ -C sfdx --strip-components 1
"./sfdx/install"
export PATH=./sfdx/$(pwd):$PATH

# Output CLI version and plug-in information
sfdx update
sfdx --version
sfdx plugins --core

