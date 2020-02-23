function gam
    if not git status >/dev/null 2>&1
        echo gam: not a git repository
        return 1
    end
    git commit -a --amend
end
