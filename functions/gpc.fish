function gpc
    if not git status >/dev/null 2>&1
        echo gpc: not a git repository
        return 1
    end
    set c_branch (git branch | grep \* | awk '{print $2}')
    git push $argv origin $c_branch
end
