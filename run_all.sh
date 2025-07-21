#!/bin/bash

# Run Node script
node append_svt_to_news.js 106 150
node append_svt_to_news.js 303 329

# Specify country code (default SE for Sweden)
python process_and_summarize_news_latest.py --country=SE
# Run aggregation and summarization script
python aggregate_and_summarize_Version2.py
# Update HTML file
node generate_html.js

# Add index.html to staging
git add index.html

git commit -m "Update index.html"

git push --set-upstream origin trunk:main