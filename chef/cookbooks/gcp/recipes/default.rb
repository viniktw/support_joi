#
# Cookbook:: gcp
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.


# Install the Google Cloud SDK
remote_file '/tmp/google-cloud-sdk.tar.gz' do
    source 'https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-373.0.0-linux-x86_64.tar.gz'
    mode '0755'
    action :create
    not_if { ::File.exist?('/tmp/google-cloud-sdk.tar.gz') }
end

execute 'extract_google-cloud-sdk' do
    command 'tar -xzf /tmp/google-cloud-sdk.tar.gz -C /usr/local/'
    not_if { ::File.exist?('/usr/local/google-cloud-sdk') }
end

execute 'install_gcloud' do
    command 'sudo /usr/local/google-cloud-sdk/install.sh --quiet --rc-path /home/vagrant/.bashrc'
    user 'vagrant'
    not_if 'which gcloud'
end

