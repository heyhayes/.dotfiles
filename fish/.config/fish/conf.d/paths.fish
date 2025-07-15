set -x PATH $HOME/.local/bin $PATH
set -x GOPATH $HOME/go
set -x PATH $PATH \
    $GOPATH/bin \
    $HOME/software/lua-language-server/bin \
    $HOME/software/nvim-macos-arm64/bin \
    $HOME/.config/tmux/plugins/tmuxifier/bin \
    /opt/homebrew/opt/mysql@8.4/bin \
    $HOME/software/emacs30/build/nextstep \
    "$HOME/Library/Application Support/Herd/bin" \
    $HOME/scripts

set -x TMUXIFIER_LAYOUT_PATH "$HOME/.config/tmux/layouts"
set -x EDITOR /opt/homebrew/bin/nvim
set -x VISUAL $EDITOR
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow'
set -x TERM xterm-256color

