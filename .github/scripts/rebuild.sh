#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for thecodingmachine/react-native-boilerplate
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.
# Assumes CWD is the documentation/ directory of the repo.

# --- Node version ---
export NVM_DIR="${HOME}/.nvm"
if [ -f "${NVM_DIR}/nvm.sh" ]; then
  # shellcheck disable=SC1091
  source "${NVM_DIR}/nvm.sh"
  nvm use 20 2>/dev/null || nvm install 20
fi

echo "Node version: $(node --version)"
echo "npm version: $(npm --version)"

# --- Install dependencies with yarn v1 classic ---
yarn install --frozen-lockfile

# --- Build ---
yarn build

echo "[DONE] Build complete."
