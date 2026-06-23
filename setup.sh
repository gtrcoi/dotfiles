#!/usr/bin/env bash

set -e

echo "=== Initializing Python Virtual Environment ==="

if [ ! -d ".venv" ]; then
  echo "Creating .venv..."
  python3 -m venv .venv
else
  echo ".venv already exists, skipping creation."
fi

source .venv/bin/activate

echo "Installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r pip-packages.txt

echo "=== Setup Complete! ==="
echo "To activate the environment, run: source .venv/bin/activate"
