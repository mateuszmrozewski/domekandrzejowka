#!/usr/bin/env bash
# Run ONCE from the root of your repo, after unzipping the Jekyll files over it.
# Removes the old hand-written HTML + helper files that Jekyll replaces.
set -euo pipefail
[ -f _config.yml ] || { echo "Run this from the repo root (no _config.yml here)"; exit 1; }

# .nojekyll tells GitHub to SKIP Jekyll, so it must go.
git rm -rq --ignore-unmatch .nojekyll .idea
# Old generated pages (replaced by *.md / galeria.html in the root)
git rm -rq --ignore-unmatch index.html atrakcje cennik galeria kalendarz kontakt lokalizacja o-domku regulamin 404.html
# Old assets and files that moved or are now generated
git rm -q  --ignore-unmatch style.css nav.js gallery.js sitemap.xml gallery.txt fetch-images.sh
echo "Done. Now: git add -A && git commit -m 'Convert to Jekyll' && git push"
