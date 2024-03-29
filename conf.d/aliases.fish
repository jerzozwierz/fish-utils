alias yml2json='python -c \'import sys, yaml, json; json.dump(yaml.load(sys.stdin, Loader=yaml.FullLoader), sys.stdout, indent=2)\''
alias json2yml='python -c \'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)\''

git config --global alias.ch checkout
git config --global alias.st status

abbr -a gw ./gradlew
abbr -a dps docker ps --all

