function gf
    if not git status >/dev/null 2>&1
        echo gf: not a git repository
        return 1
    end
    if test "$argv[1]" = "-f"
        set FORCE true
        echo forcing the finalisation
        if test -n "$argv[2]"
            set MASTER_BRANCH $argv[2]
        else
            set MASTER_BRANCH "develop"
        end
    else
        if test -n "$argv[1]"
            set MASTER_BRANCH $argv[1]
        else
            set MASTER_BRANCH "develop"
        end
    end
    set c_branch (git branch | grep \* | awk '{print $2}')
    if test $c_branch = $MASTER_BRANCH
        echo gf: cannot finalize $MASTER_BRANCH
        return 1
    end
    git fetch origin $MASTER_BRANCH
    if test "$FORCE" != true; and not git branch -r --merged "origin/$MASTER_BRANCH" | grep -q "origin/$c_branch"
        echo gf: $c_branch is not merged into $MASTER_BRANCH yet
        return 1
    end
    git checkout $MASTER_BRANCH
    git pull origin $MASTER_BRANCH --tags
    if test "$FORCE" != true
        git branch -d $c_branch
    else
        git branch -D $c_branch
    end
end
