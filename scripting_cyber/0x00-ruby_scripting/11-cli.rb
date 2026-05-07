#!/usr/bin/env ruby

require 'optparse'

TASKS_FILE = 'tasks.txt'

options = {}
parser = OptionParser.new do |opts|
  opts.banner = 'Usage: cli.rb [options]'
  opts.on('-a', '--add TASK', String, 'Add a new task') do |task|
    options[:add] = task
  end
  opts.on('-l', '--list', 'List all tasks') do
    options[:list] = true
  end
  opts.on('-r', '--remove INDEX', Integer, 'Remove a task by index') do |index|
    options[:remove] = index
  end
  opts.on('-h', '--help', 'Show help') do
    puts opts
    exit 0
  end
end

parser.parse!

if options.key?(:add)
  File.open(TASKS_FILE, 'a') do |f|
    f.puts(options[:add])
  end
  puts "Task '#{options[:add]}' added."
elsif options[:list]
  if File.exist?(TASKS_FILE)
    raw_lines = File.readlines(TASKS_FILE)
    lines = []
    raw_lines.each do |line|
      ch = line.chomp
      if ch.empty?
        next
      end
      lines << ch
    end
    lines.each_with_index do |task, i|
      puts "#{i + 1}. #{task}"
    end
  end
elsif options.key?(:remove)
  idx = options[:remove]
  if File.exist?(TASKS_FILE)
    raw_lines = File.readlines(TASKS_FILE)
    lines = []
    raw_lines.each do |line|
      lines << line.chomp
    end
    index_zero = idx - 1
    if index_zero >= 0
      if index_zero < lines.length
        removed = lines[index_zero]
        lines.delete_at(index_zero)
        if lines.empty?
          File.write(TASKS_FILE, '')
        else
          File.write(TASKS_FILE, lines.join("\n") + "\n")
        end
        puts "Task '#{removed}' removed."
      end
    end
  end
end
