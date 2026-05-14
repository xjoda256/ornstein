#!/usr/bin/env bash
set -euo pipefail

USER_HOME="${1:-$(eval echo ~joda)}"
DOCS_ETC="$USER_HOME/docs/etc"

while IFS= read -r -d '' f; do
  rel="${f#$DOCS_ETC/}"
  src="/etc/$rel"
  if [[ -f "$src" ]]; then
    cp "$src" "$f"
  fi
done < <(find "$DOCS_ETC" -type f -print0)

chown -R --reference="$USER_HOME" "$DOCS_ETC"

echo "✔ Done."
