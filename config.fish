# Path
fish_add_path -P "$HOME/bin"
fish_add_path -P "$HOME/.config/bspwm/scripts"
fish_add_path -P "$HOME/.config/polybar/scripts"
fish_add_path -P "$HOME/.config/rofi/scripts"

# Cdpath
set -x CDPATH ""
set -a CDPATH "$HOME"
set -a CDPATH "$HOME/dev"
set -a CDPATH "$HOME/dev/dotfiles"

# File editing
if command -q nvim
    set -x EDITOR nvim
    set -x VISUAL $EDITOR
    abbr -ag nv nvim
else
    echo "Nvim not found"
end
abbr -ag se sudoedit

# Paging
set -x LESS "--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --tabs=4"
set -x LESSHISTFILE /dev/null
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANROFFOPT -c
abbr -ag cat bat
abbr -ag c clear

# File listing
abbr -ag la lse -a
abbr -ag ll lse -l
abbr -ag lal lse -al
abbr -ag tree lse --tree
abbr -ag atree lse -a -I .git --tree
abbr -ag ltree lse -l --tree
abbr -ag altree lse -a -I .git -l --tree

# System management
abbr -ag bctl bluetoothctl
abbr -ag nctl networkctl
abbr -ag rctl resolvectl
abbr -ag ip ip --color=auto
abbr -ag pm podman
abbr -ag pmc podman-compose

# Git
abbr -ag g git

# Fzf
if command -q fzf
    abbr -ag fzp fzf --preview \"fprev {}\"
    set -x FZF_DEFAULT_COMMAND "fd --follow"
    set -x FZF_DEFAULT_OPTS "--reverse --cycle --height 90% --marker='->' --multi"
else
    echo "Fzf not found"
end

if functions -q fzf_configure_bindings
    fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs \
        --history=\cr --processes=\cp --variables=\cv
    set -x fzf_fd_opts --follow
    set -x fzf_preview_dir_cmd fprev
    set -x fzf_preview_file_cmd fprev
else
    echo "Fzf.fish not found"
end

# Zoxide
if command -q zoxide
    set -x _ZO_EXCLUDE_DIRS "$HOME/.cache/*:$HOME/.local/*:/mnt/*"
    set -x _ZO_FZF_OPTS "--cycle --height 50% --preview 'fprev {2}'"
    zoxide init fish | source
else
    echo "Zoxide not found"
end

# Npm
if command -q npm
    set -x NPM_CONFIG_USERCONFIG "$HOME/.config/npm/npmrc"
    fish_add_path -P "$HOME/.local/share/npm/bin"
else
    echo "Npm not found"
end

# Cargo
if command -q cargo
    set -x CARGO_HOME "$HOME/.cache/cargo"
    fish_add_path -P "$HOME/.cache/cargo/bin"
else
    echo "Cargo not found"
end

if status is-login
    # Auth
    set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR"/ssh-agent.socket
    exit
end

if status is-interactive
    # Kitty integration
    abbr -ag cik clone-in-kitty --type os-window
    abbr -ag eik edit-in-kitty --type os-window
    abbr -ag rgk kitty +kitten hyperlinked_grep
    # Theming
    source $HOME/.config/fish/themes/tokyonight.fish
    starship init fish | source
end
