function gpo
    if not git status >/dev/null 2>&1
        echo gpo: not a git repository
        return 1
    end
    set c_branch (git branch | grep \* | awk '{print $2}')
    if test -n "$argv[1]"
        set BRANCH $argv[1]
    else
        set BRANCH $c_branch
    end
    git pull origin $BRANCH
end
