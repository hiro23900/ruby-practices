#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require 'etc'

COL_SPACE = 2

def main(cols_count)
  options = ARGV.getopts('arl')

  make_list = Dir.glob('*', (options['a'] ? File::FNM_DOTMATCH : 0))
  files = options['r'] ? make_list.reverse : make_list

  options['l'] ? display_attribute(files) : display_table(files, cols_count)
end

def display_attribute(files)
  longest_bite_size = files.map { |file| File.stat(file).size }.max.to_s.length
  bite_size_sum = 0
  attributes_lists = files.map do |file|
    permission_code = File.stat(file).mode.to_s(8).rjust(6, '0')
    bite_size_sum += (File.stat(file).size.to_s.rjust(longest_bite_size).to_i / 4096.0).ceil * 4

    [
      file_symbol(permission_code[0, 2]) +
        access_permissions(permission_code[3, 1]) +
        access_permissions(permission_code[4, 1]) +
        access_permissions(permission_code[5, 1]),
      File.stat(file).nlink.to_s,
      Etc.getpwuid(File.stat(file).uid).name,
      Etc.getgrgid(File.stat(file).gid).name,
      File.stat(file).size.to_s.rjust(longest_bite_size),
      File.mtime(file).strftime('%_m月%_d %H:%M'),
      file_symbol(permission_code[0, 2]) == 'd' ? "#{file}/" : file
    ].join(' ')
  end
  puts "合計 #{bite_size_sum}"
  puts attributes_lists
end

def file_symbol(number)
  {
    '04' => 'd',
    '10' => '-',
    '12' => 'l'
  }[number]
end

def access_permissions(pattern)
  {
    '1' => '--x',
    '2' => '-w-',
    '3' => '-wx',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }[pattern]
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
