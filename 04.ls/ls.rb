# frozen_string_literal: true

require 'optparse'

def fetch_file_list
  Dir.glob('*')
end

def branch_condition_option
  params = ARGV.getopts('r')
  if params['r']
    fetch_file_list.reverse
  else
    fetch_file_list
  end
end

def file_list
  file_names = branch_condition_option
  quotient, remainder = file_names.count.divmod(3)
  chunk_size = remainder.zero? ? quotient : quotient + 1
  chunked_files = file_names.each_slice(chunk_size).to_a
  transposed_files = chunked_files[0].zip(*chunked_files[1..]) # ファイルの並び替え
  get_max_length_file = file_names.max_by(&:length) # 最大文字数名のファイルを取得
  transposed_files.each do |reorder|
    reorder.compact.each { print _1.ljust(get_max_length_file.length + 3) }
    puts # ファイルの最大文字数＋３で出力
  end
end

file_list
