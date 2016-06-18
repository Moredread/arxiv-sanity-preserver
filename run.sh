REMOTE_PATH=arxiv@mc.nolife.de:/home/arxiv/arxiv-sanity-preserver
REMOTE_PORT=2342

source ./env/bin/activate

# pull the database (by default stored in as.db) from remote to local
rsync -e "ssh -p $REMOTE_PORT" -v --progress $REMOTE_PATH/as.db as.db

# now perform the update and recomputation:
sh fetch_new.sh
python download_pdfs.py
python parse_pdf_to_text.py
python thumb_pdf.py
python analyze.py
python buildsvm.py

# now rsync the results and new thumbnails from local to remote
rsync -e "ssh -p $REMOTE_PORT" -v --progress db.p tfidf_meta.p sim_dict.p user_sim.p $REMOTE_PATH
rsync -e "ssh -p $REMOTE_PORT" -vaL --progress static/thumbs $REMOTE_PATH/static
