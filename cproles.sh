#!/bin/sh

ROLES_DIR="roles"
OUTPUT_FILE="inventory/host_vars/laptop.yml"

if [ ! -d "$ROLES_DIR" ]; then
  echo "Error: Roles directory not found." >&2
  exit 1
fi

echo "host_roles:" >"$OUTPUT_FILE"

find "$ROLES_DIR" -mindepth 1 -maxdepth 1 -type d -print0 |
  xargs -0 -I {} basename {} |
  sort |
  sed 's/^/  - /' >>"$OUTPUT_FILE"

echo "Successfully generated $OUTPUT_FILE with roles from $ROLES_DIR."

# 5. Display the generated content for verification
echo "==="
cat "$OUTPUT_FILE"
echo "==="
