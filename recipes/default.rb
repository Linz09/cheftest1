#
# Cookbook:: test1
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
package 'git' do
 action :install
end
git "/root/cheftest1" do
  repository "git://github.com/Linz09/cheftest1.git"
  reference "master"
  action :sync
end
package "httpd" do
  action :install
end

service  'httpd' do
 action [ :enable, :start ]
end

