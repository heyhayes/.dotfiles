
function cx
    cd $argv; and l
end

function fcd
    cd (find . -type d -not -path '*/.*' | fzf); and l
end

function f
    find . -type f -not -path '*/.*' | fzf | pbcopy
end

function fv
    nvim (find . -type f -not -path '*/.*' | fzf)
end
