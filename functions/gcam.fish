function gcam
    if not git status >/dev/null 2>&1
        echo gcam: not a git repository
        return 1
    end
    git commit -a -m $argv
end
