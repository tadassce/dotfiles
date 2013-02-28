#! /usr/bin/env ruby

lines = []
while line = gets
  lines << gets.strip
end

pairs = lines.map do |line|
  pair = line.split('=>').map(&:strip)
end

max_len = pairs.map(&:first).map(&:length).max

lines = pairs.map! do |pair|
  "#{pair.first.ljust(max_len, ' ')} => #{pair.last}"
end

print lines.join("\n")
