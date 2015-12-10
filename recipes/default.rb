#
# Cookbook Name:: gemtest
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

template '/root/.gemrc' do
  source 'gemrc.erb'
  action :create
  notifies :run, 'ruby_block[refresh_gemrc]', :immediately
end

ruby_block 'refresh_gemrc' do
  action :nothing
  block do
    Gem.configuration = Gem::ConfigFile.new []
  end
end

gem_package 'andrewsgem' do
  action :install
end
