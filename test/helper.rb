require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
#require 'test/unit'
require 'minitest/autorun'
require 'shoulda'

class Minitest::Test
end

unless defined? CSI
  $:.unshift File.expand_path('../../lib', __FILE__)
  require 'csi'
end
