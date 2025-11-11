unalias gam
alias gam="git commit -a --amend"
alias gi="git ch -b"

function gpc() {
	C_BRANCH=$(git branch | grep \* | awk '{print $2}')
	git push origin $C_BRANCH "${@:1}"
}

function gpo() {
	C_BRANCH=$(git branch | grep \* | awk '{print $2}')
	git pull origin $C_BRANCH
}

unalias gfo

function gfo() {
	C_BRANCH=$(git branch | grep \* | awk '{print $2}')
	if [ -n "$1" ]; then
		git fetch origin $1
		git checkout $1
		gpo
	fi
}

function gff() {
        M_BRANCH="master"
        if [ -n "$1" ]; then
                M_BRANCH=$1
        fi
	C_BRANCH_TO_DEL=$(git branch | grep \* | awk '{print $2}')
	if [ "$C_BRANCH_TO_DEL" = "$M_BRANCH" ]; then
		echo "ERROR: gff: Cannot finalize $M_BRANCH"
		return 1
	fi
	gfo $M_BRANCH
	git branch -D $C_BRANCH_TO_DEL
}

