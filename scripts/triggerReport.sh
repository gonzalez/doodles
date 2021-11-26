#!/bin/bash

curl -s -X POST $GRAFANA_URL/api/reports/email \
-H "Accept: application/json" -H "Content-Type: application/json" \
-H "Authorization: Bearer $GRAFANA_API_TOKEN" \
-d '{"id":"2","useEmailsFromReport": true}'
