#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

execute 'install_docker_snap' do
    command 'snap install docker'
end

group 'docker' do
    action :create
end

execute 'change_user_group_docker' do
    command 'usermod -aG docker vagrant'
    not_if 'groups vagrant | grep docker'
    notifies :run, 'execute[disable_snap_docker]', :immediately
end
execute 'disable_snap_docker' do
    command 'snap disable docker'
    action :nothing
    notifies :run, 'execute[enable_snap_docker]', :immediately
end
execute 'enable_snap_docker' do
    command 'snap enable docker'
    action :nothing
end
