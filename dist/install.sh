#!/usr/bin/env bash

# Molly Install Script #
# How to use:
#   curl https://molly.sirikon.me/install.sh | bash

binary_download_url="https://dl.sirikon.me/molly.zip"
temp_download_folder=/tmp/molly_installer

function download_molly {
    mkdir $temp_download_folder
    wget $binary_download_url -O $temp_download_folder/molly.zip
}

function unzip_molly {
    cd $temp_download_folder
    unzip molly.zip
}

function install_molly {
    cd $temp_download_folder
    cp ./molly /usr/bin/molly
    chmod +x /usr/bin/molly
}

function check_command_exists {
    if which $1 >/dev/null;
    then
        echo " - $1: OK"
    else
        echo " - $1: NOT FOUND"
        exit
    fi
}

function check_dependencies {
    echo 'Dependency check:'

    check_command_exists 'zip'
    check_command_exists 'wget'
}

function clean_installation_files {
    rm -rf $temp_download_folder
}

check_dependencies
download_molly
unzip_molly
install_molly
clean_installation_files
