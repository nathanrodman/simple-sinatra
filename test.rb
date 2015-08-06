require 'thread'
require 'net/http'
require 'open-uri'

puts '  PID STAT      TIME  SL  RE PAGEIN      VSZ    RSS   LIM     TSIZ  %CPU %MEM COMMAND'
puts `ps avx | grep app.rb`
10000.times do | index |
  puts index if (index % 250) == 0
  threads = [1..15].map do |index|
    Thread.new { Net::HTTP.get(URI('http://127.0.0.1:4567/hi')) }
  end
  threads.each(&:join)
end
puts `ps avx | grep app.rb`
