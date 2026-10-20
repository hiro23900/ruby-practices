#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'

COL_SPACE = 2

def main(cols_count)
  options = ARGV.getopts('ar')

  make_list = Dir.glob('*', (options['a'] ? File::FNM_DOTMATCH : 0))
  files = options['r'] ? make_list.reverse : make_list

  display_table(files, cols_count)
end

def display_table(files, cols_count)
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
