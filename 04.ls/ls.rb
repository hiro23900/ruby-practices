#!/usr/bin/env ruby
# frozen_string_literal: true

def main
  arys = []
  Dir.glob('*').each_slice(3) do |ary|
    arys << if ary.length == 3
              ary
            else
              ary.values_at(0..2)
            end
  end
  pp arys
end

main
