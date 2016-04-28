#!/usr/bin/env bash

FROM=${1:-7100}
TO=${2:-8000}
SEARCH='cat:astro-ph.GA+OR+cat:astro-ph.CO+OR+cat:astro-ph.EP+OR+cat:astro-ph.HE+OR+cat:astro-ph.IM+OR+astro-ph.SR+OR+cat:gr-qc'

python fetch_papers.py  --start_index=$FROM  --break_on_no_added=0 --max_index $TO --search_query $SEARCH
