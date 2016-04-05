REMOTE_PATH=arxiv@v22016041720733360.quicksrv.de:/home/arxiv/arxiv-sanity-preserver

# pull the database (by default stored in as.db) from remote to local
rsync -v --progress $REMOTE_PATH/as.db as.db

# now perform the update and recomputation:
sh fetch_new.sh
python download_pdfs.py
python parse_pdf_to_text.py
python thumb_pdf.py
python analyze.py
python buildsvm.py

# now rsync the results and new thumbnails from local to remote
rsync -v --progress db.p tfidf_meta.p sim_dict.p user_sim.p $REMOTE_PATH
rsync -vr --progress static/thumbs $REMOTE_PATH/static
