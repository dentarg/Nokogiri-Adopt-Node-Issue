require 'rubygems'
require "bundler/setup"
require 'doc_builder'

class ConsoleApp
  include ::DocBuilder

  def full_doc
    build_root_doc
  end

  def sub_doc
    build_book
  end
end

app = ConsoleApp.new

puts "\nThis is the sub document:\n\n"
puts app.sub_doc

puts "\nThis is the full combined document:\n\n"
puts app.full_doc
