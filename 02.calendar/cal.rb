#!/usr/bin/env ruby

require "date"
require "optparse"

default_year = Date.today.year.to_s
default_month = Date.today.month.to_s

options = ARGV.getopts("y:m:", "y:#{default_year}", "m:#{default_month}")
year = options["y"].to_i
month = options["m"].to_i

first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

# タイトルを出力
puts (month.to_s + "月" + " " + year.to_s).center(20)

# 曜日を出力
puts "日 月 火 水 木 金 土"

# 日を出力
(first_day..last_day).each do |d|
  if d.day == 1
    print d.day.to_s.rjust(2 + first_day.wday * 3)
    if d.saturday?
      print "\n"
    end
    next
  end

  if d.saturday?
    print d.day.to_s.rjust(3) + "\n"
  elsif d.sunday?
    print d.day.to_s.rjust(2)
  else
    print d.day.to_s.rjust(3)
  end

  if d == last_day
    print "\n"
  end
end

