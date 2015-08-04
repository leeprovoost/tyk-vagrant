# The output of all these installation steps is noisy. With this utility
# the progress report is nice and concise.
function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo 'updating package information'
apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
apt-get -y update >/dev/null 2>&1

install 'development tools' build-essential

install Git git
install Redis redis-server
install MongoDB mongodb-org
install vim vim

# Install Tyk
echo 'downloading Tyk 1.7.1'
wget https://github.com/lonelycode/tyk/releases/download/1.7.1/tyk.linux.amd64_1.7.1-1_all.deb -P /tmp
echo 'installing Tyk 1.7.1'
sudo dpkg -i /tmp/tyk.linux.amd64_1.7.1-1_all.deb

# Copy config file
echo 'copying default configuration file'
cp -f /vagrant/tyk.conf /etc/tyk/tyk.conf

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, rock on!'
