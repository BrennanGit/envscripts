#!/bin/bash

# search back up the directory tree
OPT_REVERSE='false'
# the maximum depth of a downward search
OPT_DEPTH=4
# search for a file and change to that directory
OPT_FILESEARCH='false'

while getopts ":rd:f" opt; do
    case $opt in
        r)
            OPT_REVERSE='true'
            ;;
        d)
            OPT_DEPTH=$OPTARG
            ;;
        f)
            OPT_FILESEARCH='true'
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done


# if $DIR is set echo $DIR
# otherwise echo .
# this is to prevent the command taking the user to home if they ctrl-c out of fzf
echo_dir() {
    if [ -z "$DIR" ]
    then
        echo "."
    else
        echo "$DIR"
    fi
}


# fuzzy cd commandfuzzyD
# ignores hidden directories and /Installs/ directory
search_downward() {
    local declare dirs=()
    get_parent_dirs() {
      if [[ -d "${1}/" ]]; then dirs+=("$1"); else return; fi
      if [[ "${1}" == "C:" ]]; then
        for _dir in "${dirs[@]}"; do echo $_dir; done
      else
        get_parent_dirs $(dirname "$1")
      fi
    }
    DIR=$({ get_parent_dirs $(realpath "${1:-$PWD}") && C:/msys64/usr/bin/find.exe . -maxdepth $OPT_DEPTH -d -type d -not -path '*/\.*' -not -path '*/Installs/*' 2>/dev/null; } | fzf --reverse)
    echo_dir
}


# search for a file and get the directory of the file
file_search_downward() {
    local declare dirs=()
    get_parent_dirs() {
      if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
      if [[ "${1}" == '/' ]]; then
        for _dir in "${dirs[@]}"; do echo $_dir; done
      else
        get_parent_dirs $(dirname "$1")
      fi
    }

    DIR=$(C:/msys64/usr/bin/find.exe . -maxdepth $OPT_DEPTH -depth -type f -not -path '*/\.*' -not -path '*/Installs/*'  2>/dev/null | fzf --reverse)
    DIR=$(dirname $DIR)
    echo_dir
}


# fr - fuzzy cd to selected parent directory
search_upward() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}/" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == "C:" ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf --reverse --tac)
  echo_dir
}

if [ "$OPT_REVERSE" == 'true' ]
then
    search_upward
elif [ "$OPT_FILESEARCH" == 'true' ]
then
    file_search_downward
else
    search_downward
fi