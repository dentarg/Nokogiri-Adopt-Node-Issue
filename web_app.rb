require 'rubygems'
require "bundler/setup"
require 'sinatra'
require 'doc_builder'

class WebApp < Sinatra::Base
  include ::DocBuilder

  get '/full_doc' do
    build_root_doc
  end

  get '/sub_doc' do
    build_book
  end
end
