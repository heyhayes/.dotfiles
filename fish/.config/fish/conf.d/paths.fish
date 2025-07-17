set -x PATH $HOME/.local/bin $PATH
set -x GOPATH $HOME/go

# Platform-specific paths
if test (uname) = "Darwin"
    # macOS paths
    set -x PATH "$HOME/Library/Application Support/Herd/bin" $PATH /opt/homebrew/bin
    set -x PATH $PATH /opt/homebrew/opt/mysql@8.4/bin
    set -x PATH $PATH $HOME/software/nvim-macos-arm64/bin
    set -x PATH $PATH $HOME/software/emacs30/build/nextstep
    
    # Set PHP ini path based on current Herd PHP version (macOS only)
    if command -v herd >/dev/null
        set php_version (php -v | head -1 | string match -r '(\d+\.\d+)' | head -1 | string replace '.' '')
        set -x PHPRC "$HOME/Library/Application Support/Herd/config/php/$php_version"
    end
else
    # Linux paths
    set -x PATH $PATH /usr/local/bin
    set -x PATH $PATH $HOME/software/nvim-linux64/bin
    set -x PATH $PATH $HOME/software/emacs/bin
end

# Common paths for both platforms
set -x PATH $PATH \
    $GOPATH/bin \
    $HOME/software/lua-language-server/bin \
    $HOME/.config/tmux/plugins/tmuxifier/bin \
    $HOME/scripts

set -x TMUXIFIER_LAYOUT_PATH "$HOME/.config/tmux/layouts"
set -x FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow'
set -x TERM xterm-256color

# Set editor based on platform
if command -v nvim >/dev/null
    set -x EDITOR (command -v nvim)
    set -x VISUAL $EDITOR
else
    set -x EDITOR vim
    set -x VISUAL vim
end

