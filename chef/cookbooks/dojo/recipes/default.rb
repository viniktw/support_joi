#
# Cookbook:: dojo
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

remote_file '/tmp/dojo' do
    source 'https://github.com/kudulab/dojo/releases/download/0.11.0/dojo_linux_amd64'
    mode '0755'
    action :create
    not_if { ::File.exist?('/tmp/dojo') }
end

execute 'install_dojo' do
    command 'mv /tmp/dojo /usr/bin/dojo'
    not_if { ::File.exist?('/usr/bin/dojo') }
end