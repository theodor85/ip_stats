# frozen_string_literal: true

require 'rubygems'
require 'bundler'
# require 'dry/auto_inject'
# require 'dry/container'

Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)

require_relative './app/ip_manager'
require_relative './app/statistics'

Container = Dry::Container.new
Container.register('ip_manager', IpStats::IpManager.new)
Container.register('statistics', IpStats::Statistics.new)

Import = Dry::AutoInject(Container)
