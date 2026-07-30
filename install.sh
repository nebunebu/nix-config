#!/usr/bin/env bash
# Installs the "fonseca" host from a live NixOS ISO.
#
# Usage: sudo ./install.sh /dev/nvme0n1
#
# Run this from a live NixOS environment after cloning this repo, e.g.:
#   git clone https://github.com/<you>/.nix-config.git
#   cd .nix-config
#   sudo ./install.sh /dev/nvme0n1
#
# This WIPES the given disk. Everything on it is destroyed.

set -euo pipefail

HOST="fonseca"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DISKO_FILE="$REPO_DIR/hosts/$HOST/nixos/disko.nix"
FACTER_FILE="$REPO_DIR/hosts/$HOST/nixos/facter.json"

if [[ $EUID -ne 0 ]]; then
  echo "error: must be run as root (use sudo)" >&2
  exit 1
fi

if [[ ! -e /etc/NIXOS ]]; then
  echo "error: this doesn't look like a NixOS live environment (/etc/NIXOS missing)" >&2
  exit 1
fi

DISK="${1:-}"
if [[ -z "$DISK" ]]; then
  echo "usage: $0 <disk device, e.g. /dev/nvme0n1>" >&2
  echo >&2
  echo "available disks:" >&2
  lsblk -d -o NAME,SIZE,MODEL >&2
  exit 1
fi

if [[ ! -b "$DISK" ]]; then
  echo "error: $DISK is not a block device" >&2
  exit 1
fi

echo "About to WIPE and partition: $DISK"
lsblk "$DISK"
read -r -p "Type 'yes' to continue: " confirm
if [[ "$confirm" != "yes" ]]; then
  echo "Aborted."
  exit 1
fi

echo "==> Resolving a stable /dev/disk/by-id path for $DISK"
DISK_ID=""
for link in /dev/disk/by-id/*; do
  if [[ "$(readlink -f "$link")" == "$(readlink -f "$DISK")" ]]; then
    DISK_ID="$link"
    break
  fi
done
if [[ -z "$DISK_ID" ]]; then
  echo "warning: no /dev/disk/by-id link found for $DISK, falling back to $DISK" >&2
  DISK_ID="$DISK"
fi
echo "Using disk id: $DISK_ID"

echo "==> Writing disk id into $DISKO_FILE"
sed -i "s#/dev/disk/by-id/CHANGE_ME#${DISK_ID}#" "$DISKO_FILE"

echo "==> Probing hardware with nixos-facter (writes $FACTER_FILE)"
nix run --extra-experimental-features "nix-command flakes" github:nix-community/nixos-facter -- -o "$FACTER_FILE"

echo "==> Partitioning and formatting with disko"
nix run --extra-experimental-features "nix-command flakes" github:nix-community/disko/latest -- \
  --mode disko \
  --flake "$REPO_DIR#$HOST"

echo "==> Installing NixOS"
nixos-install --flake "$REPO_DIR#$HOST" --no-root-passwd

cat <<EOF

==> Install complete. Before rebooting:
    - Reboot into fonseca, then log in and check that everything came up.

==> Manual follow-up (cannot be scripted from the live ISO):
    1. On fonseca, get its host age key:
         nix run --extra-experimental-features "nix-command flakes" nixpkgs#ssh-to-age -- -i /etc/ssh/ssh_host_ed25519_key.pub
    2. Add it to .sops.yaml (repo root) as a new "&fonseca" anchor, both
       under 'keys:' and in 'creation_rules[0].key_groups[0].age'.
    3. From a machine that can already decrypt secrets, run:
         sops updatekeys sops/secrets/secrets.yaml
    4. Commit and push, then rebuild fonseca to pick up decryptable secrets:
         nixos-rebuild switch --flake .#fonseca
EOF
