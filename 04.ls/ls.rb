#!/usr/bin/env ruby
# frozen_string_literal: true

COL_SPACE = 2

def main(cols_count)
  files = Dir.glob('*')

  col_width = filename_max(files) + COL_SPACE
  alined_files = files.map { |file| file.ljust(col_width) }

  rows_num = rows_count(files, cols_count)
  sliced_files = alined_files.each_slice(rows_num).map { |ary| ary.values_at(0...rows_num) }

  sliced_files.transpose.each do |list|
    puts list.join(' ')
  end
end

def filename_max(files)
  files.map(&:length).max
end

def rows_count(files, cols_count)
  files.length.ceildiv(cols_count)
end

cols_count = 3
main(cols_count)
