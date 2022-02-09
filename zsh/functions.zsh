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
	if [ -n $1 ]; then
		git fetch origin $1
		git checkout $1
		gpo
	fi
}

function gff() {
	C_BRANCH=$(git branch | grep \* | awk '{print $2}')
	if [ "$C_BRANCH" = "master" ]; then
		echo "ERROR: gff: Cannot finalize master"
		return 1
	fi
	gfo master
	git branch -D $C_BRANCH
}

