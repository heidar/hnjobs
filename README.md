# Hacker News Comment Scraper

### Dependencies

Requires `mechanize` and `rest-client` gems.

Tested with Ruby 2.0.0-p353 on OS X and CentOS.

### Finder

Uses the HN Search API to find all the Who's Hiring posts. Returns a JSON 
structure that can be passed into the scraper. Example output can be found in
`posts.json`.

The finder will output JSON. If you wish to save it then pipe it to a file.

`./finder.rb > posts.json`

### Scraper

Run `sraper.rb` with one argument which is the `posts.json` file to get all the
comments for the posts. Be careful though, HN might automatically block your IP
if you do too many requests but the sleep function in the script should
hopefully take care of that.

The scraper will output JSON. If you wish to save it then pipe it to a file.

`./scraper.rb posts.json > comments.json`

### Analyzer

Run `analyzer.rb` with one argument which is `comments.json`. It will tokenize
the comments into words and remove unwanted characters. Then it will do a count
for each month for every word in the search array.

The analyzer will output JSON. If you wish to save it then pipe it to a file.

`./analyzer.rb comments.json > results.json`
