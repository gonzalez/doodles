#!/bin/bash

 
curl -s -X GET $GRAFANA_URL/api/reports \
-H "Accept: application/json" -H "Content-Type: application/json" \
-H "Authorization: Bearer $GRAFANA_API_TOKEN" \

