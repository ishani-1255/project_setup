#!/bin/bash

usage() {
    echo "Usage: $0 <language>"
    echo "Example: $0 python"
    exit 1
}

if [ $# -ne 1 ]; then
    usage
fi

language="$1"

case "$language" in
    python )
        if [ -f requirements.txt ]; then
            pip install -r requirements.txt
            echo "Python dependencies installed successfully."
        else
            echo "Error: requirements.txt file not found."
            exit 1
        fi
        ;;
    java )
        if ! command -v mvn &> /dev/null; then
            echo "Error: Maven is not installed. Please install Maven to proceed."
            exit 1
        fi
        if [ -f pom.xml ]; then
            mvn install
            echo "Java dependencies installed successfully."
        else
            echo "Error: pom.xml file not found."
            exit 1
        fi
        ;;
    javascript )
        if [ -f package.json ]; then
            npm install
            echo "JavaScript dependencies installed successfully."
        else
            echo "Error: package.json file not found."
            exit 1
        fi
        ;;
    ruby )
        if ! command -v bundle &> /dev/null; then
            echo "Error: Bundler is not installed. Please install Bundler to proceed."
            exit 1
        fi
        if [ -f Gemfile ]; then
            bundle install
            echo "Ruby dependencies installed successfully."
        else
            echo "Error: Gemfile file not found."
            exit 1
        fi
        ;;
    # Add cases for other languages as needed
    * )
        echo "Error: Language '$language' not supported."
        exit 1
        ;;
esac
