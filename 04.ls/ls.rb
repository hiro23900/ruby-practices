#!/usr/bin/env ruby
# frozen_string_literal: true

COL_SPACE = 2

def main(cols_count)
  files = Dir.glob('*')
  rows_count = (files.length % cols_count).zero? ? files.length / cols_count : files.length / cols_count + 1

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

cols_count = 3
main(cols_count)
