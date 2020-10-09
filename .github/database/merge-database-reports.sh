#!/bin/bash

if test -f database-reports/expected-results-database.json; then
    rm database-reports/expected-results-database.json
fi

echo "Merging the board-related json files from the database into a single report"

jq -s '.[0].boards=([.[].boards]|flatten)|.[0]' database-reports/*.json >> database-reports/expected-results-database.json

jq 'del(.boards[].sketches[].sizes)' database-reports/expected-results-database.json >> database-reports/modified-results-database.json

mv database-reports/modified-results-database.json database-reports/expected-results-database.json

exit 0
