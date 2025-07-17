function _fnm_auto_switch --on-variable PWD --description 'Enhanced fnm auto-switching'
    status --is-command-substitution; and return
    
    # Look for .nvmrc in current directory and up the tree
    set -l current_dir (pwd)
    set -l found_nvmrc false
    
    while test "$current_dir" != "/"
        if test -f "$current_dir/.nvmrc"
            set found_nvmrc true
            break
        end
        set current_dir (dirname "$current_dir")
    end
    
    # If no .nvmrc found, use default version (set via fnm default)
    if not $found_nvmrc
        fnm use default 2>/dev/null
    end
end