#
# Cookbook:: test1
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.
extract_path = /var/www/html/
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

script 'extract_module' do
  interpreter "bash"
  cwd ::File.dirname(src_filepath)
  code <<-EOH
   cp -rf more.html #{extract_path} 
   cd #{extract_path}
   mv more.html index.html
    EOH
  not_if { ::File.exist?(extract_path) }
end

service  'httpd' do
 action [ :enable, :start ]
end


