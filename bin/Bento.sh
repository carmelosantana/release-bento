#!/bin/bash
# v0.1.2

# Colors and formatting.
red='\033[0;31m'
green='\033[0;32m'
bold_green='\033[1;32m'
yellow='\033[0;33m'
bold_yellow='\033[1;33m'
blue='\033[0;34m'
bold_blue='\033[1;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
gray='\033[0;90m'
default='\033[0m'
bold='\033[1m'
underline='\033[4m'
reverse='\033[7m'

# Accept args from CLI for working directory, version, and build style.
while getopts ":d:v:p:" opt; do
	case $opt in
	d) DIRECTORY="$OPTARG" ;;
	v) VERSION="$OPTARG" ;;
	p) PARENT="$OPTARG" ;;
	\?) echo "Invalid option: -$OPTARG" >&2 ;;
	esac
done

if [ -n "$DIRECTORY" ]; then
	if [ -d "$DIRECTORY" ]; then
		cd "$DIRECTORY"
	else
		echo -e "${red}Directory not found.${default}"
		exit 1
	fi
fi

# Get package slug.
PACKAGE="$(basename "$(pwd)")"

# Welcome to Bento.
echo -e "
        ${reverse} ╔╗ ┌─┐┌┐┌┌┬┐┌─┐ ${default}
        ${reverse} ╠╩╗├┤ │││ │ │ │ ${default}
        ${reverse} ╚═╝└─┘┘└┘ ┴ └─┘ ${default}
			 			 	 
    A simple package builder.
"

# Ask user for version, if not use current timestamp.
echo -e "${yellow}•${default} Enter version number or leave blank to use current timestamp."
read -r -p "Version: " VERSION
if [ -z "$VERSION" ]; then
	VERSION="$(date +%s)"
fi

# Make destination directory.
BUILDS="_builds"
if [ ! -d "$BUILDS" ]; then
	mkdir "$BUILDS"
fi

# Make package directory.
PACKAGE_DIR="$PWD/$BUILDS/$VERSION"
if [ ! -d "$PACKAGE_DIR" ]; then
	mkdir "$PACKAGE_DIR"
fi

# Package file.
PACKAGE_FILE="$PACKAGE.zip"

# Package directory.
PACKAGE_ZIP="$PACKAGE_DIR/$PACKAGE_FILE"

# Exclude list.
EXCLUDE_LIST="*$BUILDS/* /$BUILDS/* *node_modules/* /node_modules/* Desktop.ini Thumbs.db *.DS_Store .Spotlight-V100 .Trashes .~lock.* *.idea* *.bak *.git* *.old *.log *.sass-cache* *.svn* *.vscode* *.tmp*"

# Prompt user if they want to include $PACKAGE directory as root or files in $PACKAGE directory as root. Show examples of each.
echo -e "
${yellow}•${default} Choose how to package your files.
${bold}1)${default}Package contains ${bold_blue}$PACKAGE${default} ${bold}directory${default} at base. ${gray}(default)${default}
${gray}$PACKAGE.zip${default}
   └── ${underline}$PACKAGE${default}
      ├── ${underline}src${default}
      ├── ${underline}vendor${default}
      └── README.md

${bold}2)${default}Package contains ${bold}files${default} from ${bold_blue}$PACKAGE${default} directory at base.
${gray}$PACKAGE.zip${default}
   ├── ${underline}src${default}
   ├── ${underline}vendor${default}
   └── README.md"

# Ask if user wants to include $PACKAGE directory as root.
read -r -p "Choice: " CHOICE

# Navigate to $PACKAGE or $PACKAGE's parent directory.
if [ "$CHOICE" = "2" ]; then
	ZIP_SRC="./"
else
	cd ..
	ZIP_SRC="$PACKAGE"
fi

# Zip package.
zip -r "$PACKAGE_ZIP" "$ZIP_SRC" -x $EXCLUDE_LIST

# Check if zip file exists.
if [ -f "$PACKAGE_ZIP" ]; then
	echo -e "${green}Build successful!${default}"
	echo -e "${green}✔${default} Package created: ${bold_blue}$PACKAGE_ZIP${default}"
	echo -e "${yellow}•${default} Add ${bold_blue}$BUILDS${default} to ${gray}.gitignore.${default}"
	exit 0
else
	echo -e "${red}Build failed.${default}"
	echo -e "${red}⨯${default} Package failed: ${bold_blue}$PACKAGE_ZIP${default}"
	exit 1
fi