declare dirs=()
get_parent_dirs() {
  if [[ -d "${1}/" ]]; then dirs+=("$1"); else return; fi
  if [[ "${1}" == "C:" ]]; then
    for _dir in "${dirs[@]}"; do echo $_dir; done
  else
    get_parent_dirs $(dirname "$1")
  fi
}

echo $(get_parent_dirs "C:/Users/brennan/envscripts")
