#!/usr/bin/env ruby

require 'date'
require 'json'
require 'mechanize'
require 'rest_client'


def get_items(query)
  url = 'http://api.thriftdb.com/api.hnsearch.com/items/_search'
  response = JSON.parse(RestClient.get(url, {:params => {q: query, limit: 50 }}))
  items = []
  response['results'].each { |i| items.push(i['item']['id']) }
  return items
end

def has_more?(links)
  links.each do |l|
    return true if l.text == 'More' && !l.href['/x'].nil?
  end
  return false
end

start = Date.parse('September 2010').to_datetime # First post in September 2010
finish = Date.parse(Time.now.strftime('%B %Y')).to_datetime
posts = {}
count = counter = 0

while start <= finish
  queries = [
    "Ask HN: Who's Hiring? (#{start.strftime("%B %Y")})",
    "Ask HN: Who's Hiring? (#{start.strftime("%B %Y")} Edition)",
    "Ask HN: Who Is Hiring? (#{start.strftime("%B %Y")})",
    "Ask HN: Who Is Hiring? (#{start.strftime("%B %Y")} Edition)"
  ]

  all_items = {}
  queries.each do |query|
    items = get_items(query)
    items.each { |item| all_items[item] = [] }
    count = count + items.size
  end
  posts[start.strftime("%B %Y")] = all_items

  start = start >> 1
end

agent = Mechanize.new
url = 'https://news.ycombinator.com/item'

posts.each do |month, items|
  items.each do |item, comments|
    sleep(60)
    counter = counter + 1
    puts "Fetching item #{counter}/#{count}..."
    page = agent.get("#{url}?id=#{item}")
    while true
      page.parser.css('span.comment').each do |c|
        comments.push(c.text)
      end
      sleep(60)
      has_more?(page.links) ? page = page.link_with(:text => 'More').click : break
    end
  end
end

puts JSON.pretty_generate(posts)