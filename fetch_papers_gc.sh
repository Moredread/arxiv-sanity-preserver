#!/usr/bin/env bash

FROM=${1:-0}
TO=${2:-3000}

python fetch_papers.py  --start_index=$FROM  --break_on_no_added=0 --max_index $TO --search_query 'cat:gr-qc' --results_per_iteration=200
