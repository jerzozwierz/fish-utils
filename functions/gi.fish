function gi
    if not git status >/dev/null 2>&1
        echo gi: not a git repository
        return 1
    end
    git ch -b $argv[1]
end
