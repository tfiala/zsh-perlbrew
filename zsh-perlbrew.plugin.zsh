[[ -z "$PERLBREW_ROOT" ]] && export PERLBREW_ROOT="$HOME/.perlbrew/perl5"

# Adjust PATH
export PATH="$PERLBREW_ROOT/bin:$PATH"

_zsh_perlbrew_install() {
    echo "Installing perlbrew..."

    # Try installing one of the methods listed in perlbrew's
    # detailed installation instructions. This should work
    # on Linux and FreeBSD systems. 
    if command -v curl &> /dev/null; then
      curl -L https://install.perlbrew.pl | bash
    elif command -v wget &> /dev/null; then
      wget -O - https://install.perlbrew.pl | bash
    elif command -v fetch &> /dev/null; then
      fetch -o- https://install.perlbrew.pl | sh
    fi
}

_zsh_perlbrew_load() {
    source $PERLBREW_ROOT/etc/bashrc
}

# Download and install perlbrew if it doesn't exist
if ! command -v perlbrew &>/dev/null; then
    _zsh_perlbrew_install
fi

# Initialize perlbrew if it does exist
if command -v perlbrew &>/dev/null; then
    _zsh_perlbrew_load
fi

