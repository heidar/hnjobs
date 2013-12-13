#!/usr/bin/env ruby

require 'date'
require 'json'
require 'rest_client'

def get_items(query)
  url = 'http://api.thriftdb.com/api.hnsearch.com/items/_search'
  response = JSON.parse(RestClient.get(url, {:params => {q: query, limit: 50 }}))
  items = []
  response['results'].each { |i| items.push(i['item']['id']) }
  return items
end

start = Date.parse('August 2013').to_datetime # First post in September 2010
finish = Date.parse(Time.now.strftime('%B %Y')).to_datetime
posts = {}

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
  end
  posts[start.strftime("%B %Y")] = all_items
  start = start >> 1
end

puts JSON.pretty_generate(posts)