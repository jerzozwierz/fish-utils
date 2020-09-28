function gm
    if not git status >/dev/null 2>&1
        echo gm: not a git repository
        return 1
    end
    if test -n "$argv[1]"
        set BRANCH "$argv[1]"
    else
        set BRANCH develop
    end
    git fetch origin $BRANCH --tags
    git merge "origin/$BRANCH"
end
