#!/usr/bin/env ruby
# frozen_string_literal: true

def main
  table_col_count = 4
  arys = []
  Dir.glob('*').each_slice(table_col_count) do |ary|
    arys << if ary.length == table_col_count
              ary
            else
              ary.values_at(0..(table_col_count - 1))
            end
  end
  pp arys
end

main
