if status is-interactive
    # Commands to run in interactive sessions can go here
    # Initialize fnm (Fast Node Manager)
    if test -f /home/davidh/.local/share/fnm/fnm
        fnm env --use-on-cd --shell fish | source
    end
end

# Added by LM Studio CLI (lms) - only on macOS
if test (uname) = "Darwin"
    set -gx PATH $PATH $HOME/.lmstudio/bin
end
# End of LM Studio CLI section

if test -f ~/.config/fish/private.fish; source ~/.config/fish/private.fish; end
