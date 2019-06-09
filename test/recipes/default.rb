#
# Cookbook:: test1
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
package 'git' do
 action :install
end
git "/root" do
  repository "git://github.com/Linz09/cheftest1.git"
  reference "master"
  action :sync
end
