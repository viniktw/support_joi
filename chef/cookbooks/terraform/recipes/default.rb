#
# Cookbook:: terraform
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.


remote_file '/tmp/terraform.zip' do
    source 'https://releases.hashicorp.com/terraform/0.12.31/terraform_0.12.31_linux_amd64.zip'
    mode '0755'
    action :create
    not_if { ::File.exist?('/tmp/terraform.zip') }
end

package 'unzip'
execute 'unzip_terraform' do
    command 'unzip /tmp/terraform.zip -d /usr/local/bin'
    not_if { ::File.exist?('/usr/local/bin/terraform') }
end