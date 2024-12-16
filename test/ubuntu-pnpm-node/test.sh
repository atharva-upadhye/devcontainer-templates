#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "pnpm version" pnpm -v
check "node version" node -v

# Report result
reportResults
