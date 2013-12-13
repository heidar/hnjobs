# HN Comment Scraper & Analyzer

## Dependencies

Requires `mechanize` and `rest-client` gems.

Tested with Ruby 2.0.0-p353 on OS X and CentOS.

## Usage

All of these scripts will output JSON. Pipe the results to a file to save.

### Finder `finder.rb`

Uses the HN Search API to find all the Who's Hiring posts. It returns a JSON 
structure that can be passed into the scraper. Example output can be found in
`posts-sample.json`.

`./finder.rb > posts-sample.json`

### Scraper `scraper.rb`

Run `sraper.rb` with one argument which is your `posts-sample.json` file to get
all the comments for the posts. Be careful though, HN might automatically block
your IP if you do too many requests but the sleep function in the script should
hopefully take care of that.

`./scraper.rb posts-sample.json > comments-sample.json`

### Analyzer `analyzer.rb`

Run `analyzer.rb` with one argument which is your `comments-sample.json` file.
It will tokenize the comments into words and remove unwanted characters. Then it
will do a count for each month for every word in the search array.

`./analyzer.rb comments-sample.json > results-sample.json`
