#!/usr/bin/env ruby

require 'date'
require 'json'
require 'rest_client'

start = Date.parse('September 2010').to_datetime
finish = Date.parse(Time.now.strftime('%B %Y')).to_datetime
posts = {}

def get_items(query)
  url = 'http://api.thriftdb.com/api.hnsearch.com/items/_search'
  response = JSON.parse(RestClient.get(url, {:params => {q: query, limit: 50 }}))
  items = []
  response['results'].each { |i| items.push(i['item']['id']) }
  return items
end

while start <= finish
  queries = [
    "Ask HN: Who's Hiring? (#{start.strftime("%B %Y")})",
    "Ask HN: Who's Hiring? (#{start.strftime("%B %Y")} Edition)",
    "Ask HN: Who Is Hiring? (#{start.strftime("%B %Y")})",
    "Ask HN: Who Is Hiring? (#{start.strftime("%B %Y")} Edition)"
  ]

  all_items = {}
  queries.each do |q|
    items = get_items(q)
    items.each { |i| all_items[i] = nil }
  end
  posts[start.strftime("%B %Y")] = all_items

  start = start >> 1
end

posts.each do |p|
  # get all comments for each post
end