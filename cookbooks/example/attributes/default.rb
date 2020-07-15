# This is a Chef Infra Client attributes file. It can be used to specify default
# and override attributes to be applied to nodes that run this cookbook.

# Set a default name
default['example']['name'] = 'Sam Doe'

# For further information, see the Chef Infra documentation (https://docs.chef.io/attributes/).
#
# Cookbook:: testcookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
File 'c:\user\Dimple\Desktop\test.txt' do
  Content 'This is a test file'
  action :create
end

windows_feature 'NET-Framework' do
  action :install
end