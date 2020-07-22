# This is a Chef Infra Client recipe file. It can be used to specify resources
# which will apply configuration to a server.

# log "Welcome to Chef Infra Client, #{node['example']['name']}!" do
log "Welcome to Chef Infra Client!" do
  level :info
end

# For more information, see the documentation: https://docs.chef.io/recipes

# For further information, see the Chef Infra documentation (https://docs.chef.io/attributes/).
#
# Cookbook:: testcookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
# file 'c:\user\Dimple\Desktop\test.txt' do
#   content 'This is a test file'
#   action :create
# end

# windows_feature 'NET-Framework' do
#   action :install
# end