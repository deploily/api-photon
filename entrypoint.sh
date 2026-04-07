#!/bin/bash
set -e

# Remove stale Elasticsearch lock files left over from build time
find /var/data/photon_data -name "*.lock" -delete 2>/dev/null || true

exec java -jar /www/app.jar -data-dir /var/data -cors-any "$@"