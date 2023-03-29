# frozen_string_literal: true

require 'optparse'
def option_command
  params = ARGV.getopts('r')
  if params['r']
    Dir.glob('*').reverse
  else
    Dir.glob('*')
  end
end

def file_list
  file_names = option_command # ファイルデータを取得
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
