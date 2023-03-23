# frozen_string_literal: true

def file_list
  file_names = Dir.glob('*') # ファイルデータを取得
  divide_file = file_names.count.divmod(3)
  chunk_size = divide_file[1].zero? ? divide_file[0] : divide_file[0] + 1
  chunked_files = file_names.each_slice(chunk_size).to_a
  file_sort = chunked_files[0].zip(*chunked_files[1..]) # ファイルの並び替え
  space_output = file_names.max_by(&:length) # ファイルの最大文字数を取得
  file_sort.each do |reorder|
    reorder.compact.each { print _1.ljust(space_output.length + 3) }
    puts # ファイルの最大文字数＋３で出力
  end
end

file_list
