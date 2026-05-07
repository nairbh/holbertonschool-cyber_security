#!/usr/bin/env ruby

require 'optparse'

TASKS_FILE = 'tasks.txt'

def tasks_lines_from_file(path)
  lines = []
  if File.exist?(path)
    raw_lines = File.readlines(path)
    raw_lines.each do |line|
      ch = line.chomp
      if ch.empty?
        next
      end
      lines << ch
    end
  end
  lines
end

def print_cli_help
  puts 'Usage: cli.rb [options]'
  puts '    -a, --add TASK                   Add a new task'
  puts '    -l, --list                       List all tasks'
  puts '    -r, --remove INDEX               Remove a task by index'
  puts '    -h, --help                       Show help'
end

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
    print_cli_help
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
  lines = tasks_lines_from_file(TASKS_FILE)
  lines.each_with_index do |task, i|
    puts "#{i + 1}. #{task}"
  end
elsif options.key?(:remove)
  idx = options[:remove]
  if File.exist?(TASKS_FILE)
    lines = tasks_lines_from_file(TASKS_FILE)
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
