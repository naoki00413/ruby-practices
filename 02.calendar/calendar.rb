require "date"
require 'optparse'

params = ARGV.getopts("", "y:#{Date.today.year}", "m:#{Date.today.month}")
year = params.values[0].to_i
month = params.values[1].to_i

year_month = "#{month}月 #{year}"
puts year_month.center(20)

puts "日 月 火 水 木 金 土"

first_date = Date.new(year, month, 1).day
last_date = Date.new(year, month, -1).day
first_day = Date.new(year, month, 1).wday
print "   " * first_day

(first_date..last_date).each do |date|
  printf("%2d ", date)
  if (first_day + date) % 7 == 0
    print "\n"
  end
end
