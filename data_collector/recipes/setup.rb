include_recipe 's3_file'
# This is a Chef Infra Client recipe file. It can be used to specify resources
# which will apply configuration to a server.

# log "Welcome to Chef Infra Client, #{node['example']['name']}!" do
log 'Welcome to Chef Infra Client!' do
  level :info
end

# For more information, see the documentation: https://docs.chef.io/recipes

# For further information, see the Chef Infra documentation (https://docs.chef.io/attributes/).
#
# Cookbook:: testcookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
file 'C:\Users\Public\test.txt' do
  content 'This is a test file'
  action :create
end

# remote_file 'C:\Users\Public\notepad.exe' do
#   source 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.8/npp.7.8.8.Installer.exe'
# end

windows_package 'Notepad++' do
  source 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.8/npp.7.8.8.Installer.exe'
  installer_type :custom
  options '/S'
end

# https://d2idatacollector.s3.eu-central-1.amazonaws.com/DataCollector.Client.Setup.exe
s3_file 'C:\Users\Public\DataCollector.Client.Setup.exe' do
  remote_path 'DataCollector.Client.Setup.exe'
  # bucket 'd2idatacollector'
  s3_url 'https://d2idatacollector.s3.eu-central-1.amazonaws.com'
  # s3_url 'https://s3.amazonaws.com/bucket'
  # https://d2idatacollector.s3.eu-central-1.amazonaws.com/DataCollector.Client.Setup.exe
  aws_access_key_id node[:custom_access_key]
  aws_secret_access_key node[:custom_secret_key]
  action :create
end

# aws_s3_file 'C:\Users\Public\DataCollector.Client.Setup.exe' do
#   bucket 'd2idatacollector'
#   remote_path 'DataCollector.Client.Setup.exe'
#   # aws_access_key_id node[:custom_access_key]
#   # aws_secret_access_key node[:custom_secret_key]
# end

windows_package 'Data Collector' do
  source 'C:\Users\Public\DataCollector.Client.Setup.exe'
  installer_type :custom
  options '/quiet /log "c:\Dump\installerLog.txt" InstallationType=1 ContentFilter=1 PackageDistributor=1 EmailAddress="emailaddress@goes.here'
end

# windows_feature 'NET-Framework' do
#   action :install
# end