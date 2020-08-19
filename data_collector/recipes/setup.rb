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
  source 'https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.9/npp.7.8.9.Installer.exe'
  installer_type :custom
  options '/S'
end

if node['filesystem']['C:']['kb_available'] > 30000000
  log 'More than 30 GB disk space free' do
    level :info
  end 
else
  log 'Less than 30 GB disk space free' do
    level :info
  end
end

services = ['DataCollector.Distribution', 'service3']

services.each do |serv|
# node['recipe']['services'].each do |serv|
  if ::Win32::Service.exists?(serv)
    windows_service serv do
      supports status: true
      action :stop
    end
  end
end
# windows_package 'Data Collector' do
#   source 'C:\Users\Public\DataCollector.Client.Setup.exe'
#   installer_type :custom
#   options '/quiet /log "c:\Dump\installerLog.txt" InstallationType=1 ContentFilter=1 PackageDistributor=1 EmailAddress="emailaddress@goes.here'
# end