#!/usr/bin/env ruby

require 'json'
require 'net/http'
require 'uri'

def get_request(url)
  uri = URI(url)
  http = Net::HTTP.new(uri.host, uri.port)
  if uri.scheme == 'https'
    http.use_ssl = true
  end
  request = Net::HTTP::Get.new(uri.request_uri)
  response = http.request(request)
  puts "Response status: #{response.code} #{response.message}"
  puts 'Response body:'
  body = response.body
  begin
    parsed = JSON.parse(body)
    puts JSON.pretty_generate(parsed)
  rescue JSON::ParserError
    puts body
  end
end
