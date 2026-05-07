#!/usr/bin/env ruby

require 'digest'

if ARGV.length != 2
  puts 'Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE'
  exit 1
end

target = ARGV[0]
dict_path = ARGV[1]

found = false
File.foreach(dict_path) do |line|
  word = line.strip
  if word.empty?
    next
  end
  digest = Digest::SHA256.hexdigest(word)
  if digest == target
    puts "Password found: #{word}"
    found = true
    break
  end
end

if found == false
  puts 'Password not found in dictionary.'
end
