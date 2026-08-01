#!/usr/bin/env bash
# Usage: ./update_link.sh https://xxxx.gradio.live
set -euo pipefail
NEW_URL="$1"
cd "$(dirname "$0")"
sed -i.bak -E "s#https://[a-z0-9]+\.gradio\.live#${NEW_URL}#g" index.html
rm -f index.html.bak
git add index.html
git commit -m "Update redirect target to ${NEW_URL}"
git push origin main
