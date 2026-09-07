#!/usr/bin/env ruby
# frozen_string_literal: true

COL_SPACE = 2

def main
  table_col_count = 4

  alined_files = []
  files = Dir.glob('*')
  files.each do |file|
    alined_files << file.ljust(12 + COL_SPACE)
  end

  arys = []
  alined_files.each_slice(table_col_count) do |ary|
    arys << if ary.length == table_col_count
              ary
            else
              ary.values_at(0..(table_col_count - 1))
            end
  end
  pp arys.transpose
end

main
