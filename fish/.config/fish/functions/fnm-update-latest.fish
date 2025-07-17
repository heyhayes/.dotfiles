function fnm-update-latest --description 'Install latest Node and set as default'
    echo "Installing latest Node.js version..."
    fnm install --latest
    
    # Get the latest version number that was just installed
    set latest_version (fnm list | grep -v system | grep -v default | tail -1 | awk '{print $2}')
    
    if test -n "$latest_version"
        echo "Setting $latest_version as default..."
        fnm default $latest_version
        echo "Done! Latest version ($latest_version) is now the default."
    else
        echo "Error: Could not determine latest version"
    end
end