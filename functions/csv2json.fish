function csv2json
    jq -R . | jq --slurp 'map(. / ",")'
end
