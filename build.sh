#!/usr/bin/env bash
set -euo pipefail

nix-build . -A integer-simple-test.components.exes.integer-simple-test-exe
