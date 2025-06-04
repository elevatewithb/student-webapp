#!/bin/bash

# Exit immediately if any command fails
set -e

# Query the web application and capture the HTTP status code
STATUS=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:8080/student-webapp)

# Fail if the application does not return HTTP 200
if [ "$STATUS" != "200" ]; then
    echo "Application check failed: expected HTTP 200 but got $STATUS" >&2
    exit 1
fi

echo "Application is reachable (HTTP $STATUS)"
