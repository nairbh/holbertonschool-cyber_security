#!/usr/bin/env ruby

require 'json'
require 'net/http'
require 'uri'

def post_request(url, body_params)
  uri = URI(url)
  http = Net::HTTP.new(uri.host, uri.port)
  if uri.scheme == 'https'
    http.use_ssl = true
  end

  request = Net::HTTP::Post.new(uri.path)
  request['Content-Type'] = 'application/json'
  request.body = JSON.generate(body_params)

  response = http.request(request)

  puts "Response status: #{response.code} #{response.message}"
  puts 'Response body:'
  puts JSON.pretty_generate(JSON.parse(response.body))
end
