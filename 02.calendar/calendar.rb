require "date"
require 'optparse'
# 年月の初期設定
params = ARGV.getopts("", "y:#{Date.today.year}", "m:#{Date.today.month}")
year = params.values[0].to_i
month = params.values[1].to_i
# 年月の出力
year_month = month.to_s + "月" .center(2)+ year.to_s
# 出力して年月を中央寄せにする
puts year_month.center(18)
# 曜日の出力
puts "日 月 火 水 木 金 土"
# 日付の出力
first_wday = Date.new(year,month,1).wday
last_day = Date.new(year, month,-1).day
print "   " * first_wday

(1..last_day).each { |day|
    printf("%2d ", day)
     if (first_wday + day) % 7 == 0 || day == last_day
      puts "\n"
     end
    }