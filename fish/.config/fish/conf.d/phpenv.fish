
# Set PHPENV path
set -x PHPENV_ROOT $HOME/.phpenv
set -x PATH $PHPENV_ROOT/bin $PHPENV_ROOT/shims $PATH

# Manual rehash
if type -q phpenv
    phpenv rehash > /dev/null 2>&1
end

# Helper: find .php-version in current or parent dirs
function find_php_version_file
    set dir (pwd)
    while test $dir != "/"
        if test -f "$dir/.php-version"
            echo "$dir/.php-version"
            return
        end
        set dir (dirname $dir)
    end
end

# Auto use .php-version or fallback to latest
function phpenv_auto_use --on-variable PWD
    if not type -q phpenv
        return
    end

    set php_version_file (find_php_version_file)

    if test -n "$php_version_file"
        set phpenv_version (string trim (cat $php_version_file))
    else
        set phpenv_version (phpenv versions --bare | head -n 1)
    end

    if test -n "$phpenv_version"
        set -x PHPENV_VERSION $phpenv_version
        phpenv rehash > /dev/null 2>&1
    end
end
