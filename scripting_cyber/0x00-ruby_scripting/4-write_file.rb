#!/usr/bin/env ruby

require 'json'

def merge_json_files(file1_path, file2_path)
  src = JSON.parse(File.read(file1_path))
  dst = JSON.parse(File.read(file2_path))
  merged = dst + src
  text = JSON.pretty_generate(merged)
  File.write(file2_path, text.chomp + "\n")
end
