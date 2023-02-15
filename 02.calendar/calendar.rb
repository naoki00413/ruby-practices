require "date"
require 'optparse'

params = ARGV.getopts("", "y:#{Date.today.year}", "m:#{Date.today.month}")
year = params.values[0].to_i
month = params.values[1].to_i

year_month = "#{month}月 #{year}"
puts year_month.center(20)

puts "日 月 火 水 木 金 土"

first_wday = Date.new(year, month, 1).wday
last_day = Date.new(year, month, -1).day
print "   " * first_wday

(1..last_day).each { |day|
  printf("%2d ", day)
    if (first_wday + day) % 7 == 0 || day == last_day
    print "\n"
    end
}
