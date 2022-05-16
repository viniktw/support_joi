# -*- mode: ruby -*-
# vi: set ft=ruby :

AWS_DEFAULT_REGION="eu-west-1"

AWS_ACCESS_KEY_ID="-- YOUR AWS ACCESS KEY ID --"
AWS_SECRET_ACCESS_KEY="-- YOUR AWS SECRET ACCESS KEY --"
AWS_SESSION_TOKEN="-- YOUR AWS SESSION TOKEN --"

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.memory = "4096"
    end

    config.vm.provision "shell", inline: "sudo apt update"
    config.vm.provision "shell", inline: "sudo mkdir -p /etc/chef/accepted_licenses"
    config.vm.provision "file", source: "chef/files/licenses/chef_infra_client", destination: "/home/vagrant/chef_infra_client"
    config.vm.provision "file", source: "chef/files/licenses/inspec", destination: "/home/vagrant/inspec"
    config.vm.provision "shell", inline: "sudo mv /home/vagrant/chef_infra_client /etc/chef/accepted_licenses/chef_infra_client && sudo mv /home/vagrant/inspec /etc/chef/accepted_licenses/inspec"
    config.vm.provision "chef_solo" do |chef|
        chef.cookbooks_path = "chef/cookbooks"
        chef.add_recipe "docker"
        chef.add_recipe "dojo"
        chef.add_recipe "terraform"
        chef.add_recipe "aws"
        chef.add_recipe "gcp"
        chef.add_recipe "base"
    end
    config.vm.provision "shell" do |shell|
        shell.inline = "cp -R /vagrant/project/joi-news-aws ~/"
    end
    config.vm.provision "shell" do |shell|
        shell.env = { "AWS_DEFAULT_REGION" => AWS_DEFAULT_REGION,"AWS_ACCESS_KEY_ID" => AWS_ACCESS_KEY_ID, "AWS_SECRET_ACCESS_KEY" => AWS_SECRET_ACCESS_KEY, "AWS_SESSION_TOKEN" => AWS_SESSION_TOKEN }
        shell.inline = "cd /vagrant/project/joi-news-aws && make _backend-support.infra"
    end
    config.vm.provision "shell" do |shell|
        shell.env = { "AWS_DEFAULT_REGION" => AWS_DEFAULT_REGION,"AWS_ACCESS_KEY_ID" => AWS_ACCESS_KEY_ID, "AWS_SECRET_ACCESS_KEY" => AWS_SECRET_ACCESS_KEY, "AWS_SESSION_TOKEN" => AWS_SESSION_TOKEN }
        shell.inline = "cd /vagrant/project/joi-news-aws && make _base.infra"
    end
    config.vm.provision "shell" do |shell|
        shell.env = { "AWS_DEFAULT_REGION" => AWS_DEFAULT_REGION,"AWS_ACCESS_KEY_ID" => AWS_ACCESS_KEY_ID, "AWS_SECRET_ACCESS_KEY" => AWS_SECRET_ACCESS_KEY, "AWS_SESSION_TOKEN" => AWS_SESSION_TOKEN }
        shell.inline = "cd ~/joi-news-aws && make docker"
    end
    config.vm.provision "shell" do |shell|
        shell.env = { "AWS_DEFAULT_REGION" => AWS_DEFAULT_REGION,"AWS_ACCESS_KEY_ID" => AWS_ACCESS_KEY_ID, "AWS_SECRET_ACCESS_KEY" => AWS_SECRET_ACCESS_KEY, "AWS_SESSION_TOKEN" => AWS_SESSION_TOKEN }
        shell.inline = "cd /vagrant/project/joi-news-aws && make _push"
    end
    config.vm.provision "shell" do |shell|
        shell.env = { "AWS_DEFAULT_REGION" => AWS_DEFAULT_REGION,"AWS_ACCESS_KEY_ID" => AWS_ACCESS_KEY_ID, "AWS_SECRET_ACCESS_KEY" => AWS_SECRET_ACCESS_KEY, "AWS_SESSION_TOKEN" => AWS_SESSION_TOKEN }
        shell.inline = "cd /vagrant/project/joi-news-aws && make _news.infra"
    end
end
