#!/usr/bin/env ruby
# frozen_string_literal: true

COL_SPACE = 2

def main(cols_count)
  files = Dir.glob('*')

  alined_files = []
  files.each do |file|
    alined_files << file.ljust(filename_max(files) + COL_SPACE)
  end

  rows_num = rows_count(files, cols_count)
  sliced_files = []
  alined_files.each_slice(rows_num) do |ary|
    sliced_files << if ary.length == rows_num
                      ary
                    else
                      ary.values_at(0...rows_num)
                    end
  end

  sliced_files.transpose.each do |list|
    puts list.join(' ')
  end
end

def filename_max(files)
  files.max { |file_a, file_b| file_a.length <=> file_b.length }.length
end

def rows_count(files, cols_count)
  files.length.ceildiv(cols_count)
end

cols_count = 3
main(cols_count)
