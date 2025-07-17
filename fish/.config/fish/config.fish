if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Added by LM Studio CLI (lms) - only on macOS
if test (uname) = "Darwin"
    set -gx PATH $PATH $HOME/.lmstudio/bin
end
# End of LM Studio CLI section

