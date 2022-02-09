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
