#/bin/zsh

set -e

yabai --stop-service || true
sudo yabai --uninstall-sa || true

brew unlink koekeishiya/formulae/yabai || true
brew install --HEAD koekeishiya/formulae/yabai
brew link koekeishiya/formulae/yabai --force --overwrite

sleep 1

sudo yabai --load-sa
yabai --uninstall-service || true
yabai --install-service
yabai --start-service
