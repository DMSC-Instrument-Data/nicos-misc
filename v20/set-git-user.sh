#!/usr/bin/env bash
# Make git use predefined credentials for this shell session only
# This script should be sourced in .bashrc or similar
# Usage: set_git_user <username>

# To add new users:
# 1. Generate an rsa key and register it with your git account:
#      $ ssh-keygen -t rsa -f ~/.ssh/id_rsa.<username>.nicos -C "v20_nicos"
#
# 2. Add a Host entry for yourself in ~/.ssh/config, e.g.:
#      Host             <username>.nicos
#        Hostname         forge.frm2.tum.de
#        Port             29418
#        User             <gerrit_login_user>
#        IdentityFile     ~/.ssh/id_rsa.<username>.nicos
#        ProxyCommand     ssh -W %h:%p <hzb_user>@display
#
#      After adding this, you can test it by running:
#      $ ssh <username>.nicos
#
#      You will need to supply your HZB password every time.
#      The first time, you'll likely need to accept ssh fingerprints.
#
# 3. Add user details in the case statement below
#      - Start with <username>) and end with ;;
#      - git_name and git_mail should match your git account
#      - ssh_host must match the "Host" value in ~/.ssh/config

function set_git_user() {
    if [ $# -ne 1 ]; then
        echo "ERROR: Exactly one argument expected, received: $#."
        echo 'Usage: set_git_user <username>'
        return 1
    fi

    #================
    # Add users here
    #================
    case "$1" in
        mhart)
            git_name='Michael Hart'
            git_mail='michael.hart@stfc.ac.uk'
            ssh_host='mhart.nicos'
            ;;
        nbiyani)
            git_name='Nikhil Biyani'
            git_mail='nikhil.biyani@psi.ch'
            ssh_host='nbiyani.nicos'
            ;;

        *)
            echo "ERROR: User '$1' not found."
            echo "Edit this script ($BASH_SOURCE) to add new users."
            return 1
    esac

    git_cmd='git'
    git_cmd="$git_cmd -c user.name=\"$git_name\""
    git_cmd="$git_cmd -c user.email=\"$git_mail\""
    git_cmd="$git_cmd -c url.ssh://$ssh_host.insteadOf=\"ssh://forge.frm2.tum.de\""

    alias git="$git_cmd"
}
