#!/usr/bin/env ruby

# [[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10, 0], [9, 1], [8, 0], [10, 0], [6, 4]]
# [[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10, 0], [9, 1], [8, 0], [10, 0], [10, 0], [6, 4]]
#   1       2       3       4       5        6       7       8        9       10       11

frames = [[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10, 0], [9, 1], [8, 0], [10, 0], [6, 4]]
frames_with_index = frames.map.with_index do |frame, i|
  [i, frame]
end

# (1) 単純に足す 22:44
point = 0
frames_with_index.each do |frame_with_index|
  point += frame_with_index[1].sum
end
p frames_with_index
puts point
