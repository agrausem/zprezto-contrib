export BASE_LOG_DIR="/tmp"
export DJANGO_SETTINGS_MODULE=main.settings.dotenv


function _generate() {

    usage="$(
cat <<EOF
usage: $0 type path length

args:
  type    type of secret to generate (password, secret_key)
  path    path to file where the secret will be stored
  length  number of characters for the secret to generate
EOF
)"

    local generation_type="$1"
    local directory_path="$2"
    local length="$3"

    if [[ -z "$generation_type" || -z "$directory_path" || -a "$length" ]]; then
      echo "$usage"
      return 1
    fi

    filepath="${directory_path}_${generation_type}.txt"
    parent_dir="$(dirname "$filepath")"

    if [[ ! -d "$parent_dir" ]]; then
        echo "directory $parent_dir does not exist"
        return 2
    fi

    if [[ ! -f "$filepath" ]]; then
        dd if=/dev/urandom bs="$length" count=1 2>/dev/null | openssl base64 > "$filepath"
        echo "$generation_type generated in $filepath."
        chmod 0400 "$filepath"
        echo "permissions 0400 applied to $filepath"
    else
        echo "nothing generated : secret file $filepath exists."
        return 3
    fi
}

function gen_password() {
  local dir_path="$1"

  if [[ -z "$dir_path" ]]
    then
      echo  "Usage: $0 path_to_dir"
      return 1
  fi

  _generate password "$dir_path" 20
}

function gen_secret_key() {
  local dir_path="$1"

  if [[ -z "$dir_path" ]]
    then
      echo  "Usage: $0 path_to_dir"
      return 1
  fi

  _generate secret_key "$dir_path" 32
}
