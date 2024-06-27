curl -sSL https://raw.githubusercontent.com/nunsez/.dotfiles/master/install.sh | bash -

# Install nix package manager
bash <(curl -L https://nixos.org/nix/install) --no-daemon

# Ensure that the necessary environment variables are set:
. /home/alex/.nix-profile/etc/profile.d/nix.sh

Add the following to ~/.config/nix/nix.conf or /etc/nix/nix.conf:
`experimental-features = nix-command flakes`

# Switch
./switch
