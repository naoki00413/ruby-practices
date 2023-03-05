# frozen_string_literal: true

require 'optparse'

def option_process
  optparse = ARGV.getopts('', 'ls:')
  puts optparse
end

def file_data_list
  lsfile_date = Dir.glob('*')
  filename = lsfile_date.each_slice(2).to_a
  file_sort = filename[0].zip(*filename[1..])
  file_sort.each do |linefeed|
    linefeed.each { print _1.ljust(10) }
    puts
  end
end

file_data_list
