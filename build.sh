#!/usr/bin/env bash
set -euo pipefail
# Usage: ./build.sh — renders docs/ into site/ with pandoc.
cd "$(dirname "$0")"

url_for() {
  local p=${1%.md}
  case "$(basename "$p")" in
    index | _index) p=$(dirname "$p") ;;
  esac
  [[ "$p" == "." ]] && echo "/" || echo "/$p/"
}

rm -rf site
mkdir -p site/css
rsync -a --exclude '*.md' docs/ site/
cp theme/site.css site/css/site.css
touch site/.nojekyll

find docs -name '*.md' | sort | while read -r src; do
  rel=${src#docs/}
  url=$(url_for "$rel")
  mkdir -p "site$url"
  pandoc -f markdown+autolink_bare_uris "$src" -s \
    --metadata-file site.yaml --lua-filter theme/site.lua --css /css/site.css \
    -M src="$rel" -M url="$url" \
    -o "site${url}index.html"
  echo "$rel -> $url"
done
