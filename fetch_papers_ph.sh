#!/usr/bin/env bash

FROM=${1:-7100}
TO=${2:-8000}

python fetch_papers.py  --start_index=$FROM  --break_on_no_added=0 --max_index $TO --search_query 'cat:physics.acc-ph+OR+cat:physics.ao-ph+OR+cat:physics.atom-ph+OR+cat:physics.atm-clus+OR+cat:physics.bio-ph+OR+cat:physics.chem-ph+OR+cat:physics.class-ph+OR+cat:physics.comp-ph+OR+cat:physics.data-an+OR+cat:physics.flu-dyn+OR+cat:physics.gen-ph+OR+cat:physics.geo-ph+OR+cat:physics.hist-ph+OR+cat:physics.ins-det+OR+cat:physics.med-ph+OR+cat:physics.optics+OR+cat:physics.ed-ph+OR+cat:physics.soc-ph+OR+cat:physics.plasm-ph+OR+cat:physics.pop-ph+OR+cat:physics.space-ph'
