# frozen_string_literal: true

require 'sinatra'
require_relative './init'

module IpStats
  class App < Sinatra::Application
    include ::Import['ip_manager', 'statistics']

    post '/ip_address' do
      ip_manager.turn_on(params[:ip_address])
    end

    delete '/ip_address' do
      ip_manager.turn_off(params[:ip_address])
    end

    get '/statistics' do
      statistics.call(params[:ip_address], params[:start_time], params[:end_time])
    end
  end
end
