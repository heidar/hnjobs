#!/usr/bin/env ruby

require 'date'
require 'json'
require 'mechanize'

def has_more?(links)
  links.each do |l|
    return true if l.text == 'More' && !l.href['/x'].nil?
  end
  return false
end

agent = Mechanize.new
url = 'https://news.ycombinator.com/item'
posts = JSON.parse(IO.read(ARGV[0]))

posts.each do |month, items|
  items.each do |item, comments|
    sleep(60)
    counter = counter + 1
    page = agent.get("#{url}?id=#{item}")
    while true
      page.parser.css('span.comment').each do |c|
        comments.push(c.text)
      end
      sleep(30)
      has_more?(page.links) ? page = page.link_with(:text => 'More').click : break
    end
  end
end

puts JSON.pretty_generate(posts)