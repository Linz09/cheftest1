apt_package "python-pip" do
  action :install
end

execute "install awscli" do
  command "pip install awscli"
  action :run
end

script 'extract_module' do
  interpreter "bash"
  cwd ::File.dirname(src_filepath)
  code <<-EOH
   knife ec2 server create -r "recipe[default.rb]" --image ami-f0e20899 -f t2.micro -S knife -i /home/ec2-user/.ssh/knife.pem –ssh-user ec2-user –region us-east-1 -Z us-east-1b
    EOH
end

