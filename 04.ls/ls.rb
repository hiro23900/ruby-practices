#!/usr/bin/env ruby
# frozen_string_literal: true

COL_SPACE = 2

def main
  files = Dir.glob('*')
  rows_count = (files.length % 3).zero? ? files.length / 3 : files.length / 3 + 1

  alined_files = []
  files.each do |file|
    alined_files << file.ljust(12 + COL_SPACE)
  end

  arys = []
  alined_files.each_slice(rows_count) do |ary|
    arys << if ary.length == rows_count
              ary
            else
              ary.values_at(0..(rows_count - 1))
            end
  end

  arys.transpose.each do |list|
    puts list.join(' ')
  end
end

main
