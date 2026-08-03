#!/usr/bin/env ruby

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

#            0       1       2       3       4        5       6       7        8        9       10       11
# frames = [[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10, 0], [9, 1], [8, 0], [10, 0], [10, 0], [10, 0], [10, 0]]
# frames = [[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10, 0], [9, 1], [8, 0], [10, 0], [10, 0], [5, 3]]
#            0       1       2       3       4        5       6       7        8        9       10       11
# frames_with_index = frames.map.with_index do |frame, i|
#  [i, frame]
# end
# p frames_with_index
# [[0, [6, 3]], [1, [9, 0]], [2, [0, 3]], [3, [8, 2]], [4, [7, 3]], [5, [10, 0]], [6, [9, 1]], [7, [8, 0]],
#  [8, [10, 0]], [9, [10, 0]], [10, [10, 0]], [11, [10, 0]]]

# binding.irb
point = frames.map.with_index do |frame, i|
  if i <= 8
    if frame[0] == 10 and frames[i + 1][0] == 10
      10 + 10 + frames[i + 2][0]
    elsif frame[0] == 10 and frames[i + 1][0] != 10
      10 + frames[i + 1].sum
    elsif frame.sum == 10
      10 + frames[i + 1][0]
    else
      frame.sum
    end
  elsif i == 9
    if frame[0] == 10 and frames[10][0] == 10
      10 + 10 + frames[11].sum
    elsif frame[0] == 10 and frames[10][0] != 10
      10 + frames[10].sum
    elsif frame.sum == 10
      10 + frames[10][0]
    else
      frame.sum
    end
  else
    0
  end
end
p point
puts point.sum
