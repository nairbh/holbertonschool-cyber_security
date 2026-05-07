#!/usr/bin/env ruby

require 'json'
require 'net/http'
require 'openssl'
require 'uri'

def post_request(url, body_params)
  uri = URI(url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.open_timeout = 30
  http.read_timeout = 30
  if uri.scheme == 'https'
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end
  request = Net::HTTP::Post.new(uri.request_uri)
  request['Content-Type'] = 'application/json'
  request.body = JSON.generate(body_params)
  response = http.request(request)
  puts "Response status: #{response.code} #{response.message}"
  puts 'Response body:'
  begin
    parsed = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed)
  rescue JSON::ParserError
    puts response.body
  end
end
