# frozen_string_literal: true

def file_data_list
  file_date = Dir.glob('*') # ファイルデータを取得
  file_sort = if (file_date.count % 3).zero?
                file_date.each_slice(file_date.count / 3).to_a # 取得したファイルを３で割る
              else
                file_date.each_slice((file_date.count / 3) + 1).to_a # 割り切れない場合
              end
  vertical_sort = file_sort[0].zip(*file_sort[1..]) # ファイルの並び替え
  file_space = file_date.max_by(&:length) # ファイルの最大文字数を取得
  vertical_sort.each do |vertical|
    vertical.compact.each { print _1.ljust(file_space.length + 3) }
    puts # ファイルの最大文字数＋３で出力
  end
end

file_data_list
