# Hacker News Comment Scraper

### Scraper

This scraper uses the HN search API to search for posts according to the `queries`
array. It's designed to loop through every month right now but that is easily
modified.

Run `sraper.rb` with no arguments to get all the comments for the who's hiring
posts. Be careful though, HN might automatically block your IP if you do too
many requests but the sleep function in the script should hopefully take care of
that.

### Analyzer

TODO