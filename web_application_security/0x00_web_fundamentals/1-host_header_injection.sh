#!/bin/bash
curl -s -X POST -H "Host: $$1" --data-urlencode "$$2" "$3"