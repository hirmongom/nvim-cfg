#!/bin/sh

NVIM_DATA="${KDG_DATA_HOME:-$HOME/.local/share}/nvim"
PACK_DIR="$NVIM_DATA/site/pack/thirdparty"
DB_FILE="$(dirname "$0")/plugins.db"

START_DIR="$PACK_DIR/start"
OPT_DIR="$PACK_DIR/opt"

mkdir -p "$START_DIR" "$OPT_DIR"
echo "== Neovim plugin setup =="

while IFS="$(printf ',')" read -r name type dir repo
do
  case "$name" in
    ""|\#*) continue ;;
  esac

  case "$type" in
    start) target="$START_DIR/$dir" ;;
    opt) target="$OPT_DIR/$dir" ;;
    *)
      echo "[error] $name: unknow type '$type'"
      continue ;;
  esac
  
  echo ""
  echo "------------------------------"
  echo "Plugin: $name"
  echo "Type:   $type"
  echo "Repo:   $repo"
  echo "Target: $target"
  echo ""
  if [ -d "$target/.git" ]; then
    echo "Status: already installed"
    echo "Action: update"
    git -C "$target" pull --ff-only
  elif [ -d "$target" ]; then
    echo "Status: directory exists but not a git repo"
    echo "Action: manual inspection required"
  else
    echo "Status: not installed"
    echo "Action: install"
    git clone "$repo" "$target"
  fi

done < "$DB_FILE"

echo ""
echo "== Setup complete =="
