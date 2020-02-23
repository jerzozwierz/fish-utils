function gfo
    if not git status >/dev/null 2>&1
        echo gfo: not a git repository
        return 1
    end
    if test -n "$argv[1]"
        git fetch origin "$argv[1]" --tags
        git checkout "$argv[1]"
        gpo
    else
        git fetch origin --tags
    end
end
