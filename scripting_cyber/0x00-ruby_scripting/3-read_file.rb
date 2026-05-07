#!/usr/bin/env ruby

require 'json'

def count_user_ids(path)
  content = File.read(path)
  data = JSON.parse(content)
  counts = Hash.new(0)
  data.each do |item|
    uid = item['userId']
    counts[uid] += 1
  end
  counts.keys.sort.each do |uid|
    puts "#{uid}: #{counts[uid]}"
  end
end
