#!/usr/bin/env ruby
# frozen_string_literal: true

arys = []
Dir.glob('*').each_slice(3) do |ary|
  arys << ary
end
pp arys
