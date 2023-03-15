# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
shots.count
scores.each do |s|
  if s == 'X' # ストライク
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).to_a
point = frames[0..8].each_with_index.sum do |frame, i|
  if frame[0] == 10 # ストライクの処理
    if frames[i + 1][0] != 10 # ストライクが続かなった時の処理
      10 + frames[i + 1][0] + frames[i + 1][1]
    elsif frames[i + 1][0] == 10 # ストライクが続いた時の処理
      10 + frames[i + 1][0] + frames[i + 2][0]
    end
  elsif frame.sum == 10 # スペアの処理
    10 + frames[i + 1][0]
  else
    frame.sum
  end
end
# 10投目以降の処理
frames[9..].flatten
# 10投目の計算
point += frames[9..].sum(&:sum)
puts point
