#!/usr/bin/env ruby

require 'json'

languages = [
  'ActionScript',
  'Assembly',
  'BASIC',
  'C',
  'C++',
  'C#',
  'Clojure',
  'COBOL',
  'CoffeeScript',
  'Dart',
  'Erlang',
  'Go',
  'Haskell',
  'Java',
  'JavaScript',
  'Lisp',
  'Lua',
  'Maple',
  'MATLAB',
  'Mathematica',
  'Objective-C',
  'Perl',
  'PHP',
  'Python',
  'R',
  'Ruby',
  'Rust',
  'Scala',
  'Scheme',
  'Shell',
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