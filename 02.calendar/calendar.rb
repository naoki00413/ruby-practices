require "date"
require 'optparse'

params = ARGV.getopts("", "y:#{Date.today.year}", "m:#{Date.today.month}")
year = params.values[0].to_i
month = params.values[1].to_i

year_month = "#{month}月 #{year}"
puts year_month.center(20)

puts "日 月 火 水 木 金 土"

first_date = Date.new(year, month, 1).wday
last_date = Date.new(year, month, -1).day
print "   " * first_date

(1..last_date).each do |wday|
  printf("%2d ", wday)
  if (first_date + wday) % 7 == 0 || wday == last_date
    print "\n"
  end
end
