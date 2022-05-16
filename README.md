# support_joi

## Requirements
- VirtualBox
- Vagrant

## Setup
- Vagrantfile
```ruby
AWS_ACCESS_KEY_ID="-- YOUR AWS ACCESS KEY ID --"
AWS_SECRET_ACCESS_KEY="-- YOUR AWS SECRET ACCESS KEY --"
AWS_SESSION_TOKEN="-- YOUR AWS SESSION TOKEN --"
```
- project/joi-news-aws
```sh
cp -R ${JOI-NEWS-PATH}/joi-news-aws ./project/
```
- project/joi-news-aws/interview_id.txt
```sh
echo 'name' > project/joi-news-aws/interview_id.txt
```

## Up
```sh
vagrant up
```

## Log into VM
```sh
vagrant ssh
```

## Dev & Pairing
```sh
cd /vagrant/project/joi-news-aws/infra/.../
terraform plan
```

## Destroy
```sh
cd /vagrant/project/joi-new-aws/
make _news.deinfra
exit
vagrant destroy -f
```