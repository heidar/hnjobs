#!/usr/bin/env ruby

require 'json'

# Not including assembly, shells and Maple/MATLAB/Mathematica/R.
languages = [
  'ActionScript',
  'BASIC',
  'C',
  'C++',
  'C#',
  'Clojure',
  'COBOL',
  'CoffeeScript',
  'D',
  'Dart',
  'Erlang',
  'Go',
  'Haskell',
  'Java',
  'JavaScript',
  'Lua',
  'Objective-C',
  'Perl',
  'PHP',
  'Python',
  'Ruby',
  'Rust',
  'Scala',
  'Scheme',
  'Tcl',
  'VBA',
  'VBScript',
  'Visual Basic'
]

words = languages

posts = JSON.parse(IO.read(ARGV[0]))

posts.each do |month, items|
  items.each do |item, comments|
    comments.each do |comment|
      puts comment
    end
  end
end