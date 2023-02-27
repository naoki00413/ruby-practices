# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X' # ストライク
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = []
shots.each_slice(2) do |s|
  frames << if s[0] == 10
              [s.shift] # 配列[10,0]から０を消す
            else
              s
            end
end

point = 0
frames[0..8].each_with_index do |frame, i|
  if frame[0] == 10 # ストライクの処理
    if frames[i + 1][0] != 10 # ストライクが続かなった時の処理
      point += 10 + frames[i + 1][0] + frames[i + 1][1]
    elsif frames[i + 1][0] == 10 # ストライクが続いた時の処理
      point += 10 + frames[i + 1][0] + frames[i + 2][0]
    end
  elsif frame.sum == 10 # スペアの処理
    point += 10 + frames[i + 1][0]
  else
    point += frame.sum
  end
end
# 10投目以降の処理
frames[9].concat(frames[10]) if frames[10]
frames[9].concat(frames[11]) if frames[11]
frames.slice!(10, 11)

# 10投目の計算
point += if frames[9].sum == 30 # ストライク
           30
         elsif frames[9][0] + frames[9][1] == 10 # スペア
           10 + frames[9][2]
         else
           frames[9][0] + frames[9][1] + frames[9][2].to_i
         end

puts point
