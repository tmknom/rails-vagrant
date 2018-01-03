# Ruby on Rails provisioner for CentOS 6.9
set -ex

# yum
yum install -y epel-release
yum update -y
yum install -y gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel
yum install -y git
yum install -y sqlite-devel
yum install -y nodejs

# rbenv + ruby-build
rm -rf /opt/.rbenv
git clone https://github.com/rbenv/rbenv.git /opt/.rbenv
git clone https://github.com/rbenv/ruby-build.git /opt/.rbenv/plugins/ruby-build

rm -f /etc/profile.d/rbenv.sh
touch /etc/profile.d/rbenv.sh
echo 'export RBENV_ROOT="/opt/.rbenv"' >> /etc/profile.d/rbenv.sh
echo 'export PATH="/opt/.rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh
echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
source /etc/profile.d/rbenv.sh

# ruby
rbenv install 2.4.3
rbenv global 2.4.3

# rails
gem update --force --system --no-document
gem update --force --no-document
gem install bundler rails --no-document
