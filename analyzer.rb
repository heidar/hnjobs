#!/usr/bin/env ruby

require 'json'

languages = [
  'assembly',
  'c',
  'css',
  'c++',
  'c#',
  'clojure',
  'coffeescript',
  'erlang',
  'go',
  'haskell',
  'html',
  'java',
  'javascript',
  'lisp',
  'lua',
  'maple',
  'matlab',
  'objective-c',
  'perl',
  'php',
  'python',
  'r',
  'ruby',
  'scala',
  'scheme',
  'shell'
]

search = languages
posts = JSON.parse(IO.read(ARGV[0]))
results = {}

posts.each do |month, items|
  results[month] = Hash[search.map {|key| [key, 0]}]
  items.each do |item, comments|
    comments.each do |comment|
      words = comment.gsub(/[.,0-9()\/]/i, ' ').split()
      words.each do |word|
        results[month][word.downcase] += 1 if languages.include?(word.downcase)
      end
    end
  end
end

puts JSON.pretty_generate(results)