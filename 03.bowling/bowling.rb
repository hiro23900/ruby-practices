#!/usr/bin/env ruby
# frozen_string_literal: true

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

frames = shots.each_slice(2).to_a
p frames
p frames[9..]
p frames[9..].flatten

point = frames.map.with_index do |frame, i|
  if i <= 8
    if frame[0] == 10 && frames[i + 1][0] == 10
      10 + 10 + frames[i + 2][0]
    elsif frame[0] == 10 && frames[i + 1][0] != 10
      10 + frames[i + 1].sum
    elsif frame.sum == 10
      10 + frames[i + 1][0]
    else
      frame.sum
    end
  elsif i == 9
    frames[9..].flatten.sum
  else
    0
  end
end
puts point.sum
