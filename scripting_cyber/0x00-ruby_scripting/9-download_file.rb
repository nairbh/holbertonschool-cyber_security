#!/usr/bin/env ruby

require 'fileutils'
require 'open-uri'
require 'uri'

if ARGV.length != 2
  puts 'Usage: 9-download_file.rb URL LOCAL_FILE_PATH'
  exit 1
end

url = ARGV[0]
local_path = ARGV[1]

parent = File.dirname(local_path)
if parent != '.'
  FileUtils.mkdir_p(parent)
end

puts "Downloading file from #{url}..."
URI.open(url) do |remote|
  File.binwrite(local_path, remote.read)
end
puts "File downloaded and saved to #{local_path}."
