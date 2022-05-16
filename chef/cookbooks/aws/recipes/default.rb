#
# Cookbook:: aws
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'python3-pip'

execute 'install_aws_cli' do
    command 'pip install awscli'
    not_if { ::File.exist?('/usr/local/bin/aws') }
end