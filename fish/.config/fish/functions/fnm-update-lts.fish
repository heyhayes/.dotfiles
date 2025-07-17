function fnm-update-lts --description 'Install latest LTS Node and set as default'
    echo "Installing latest LTS Node.js version..."
    fnm install --lts
    
    # Get the LTS version that was just installed
    set lts_version (fnm list | grep lts-latest | awk '{print $2}')
    
    if test -n "$lts_version"
        echo "Setting $lts_version as default..."
        fnm default $lts_version
        echo "Done! Latest LTS version ($lts_version) is now the default."
    else
        echo "Error: Could not determine LTS version"
    end
end