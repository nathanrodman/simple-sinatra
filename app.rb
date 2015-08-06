require 'objspace'
require 'rbtrace'
ObjectSpace.trace_object_allocations_start

class OD
  def self.d
    Thread.new do
      GC.start
      require "objspace"
      io=File.open("trace.log", "w")
      ObjectSpace.dump_all(output: io)
      io.close
    end
  end
end

ENV['RACK_ENV'] = 'production'
require 'sinatra'
require 'newrelic_rpm'
get '/hi' do
  "Hello World!"
end
