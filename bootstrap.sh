function install {
    echo installing $1
    shift
    apt-get -y install "$@" >/dev/null 2>&1
}

echo 'updating package information'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
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

# Install Tyk Dashboard
wget https://github.com/lonelycode/tyk/releases/download/1.7/tyk-dashboard-amd64-v0.9.5.1.tar.gz -P /tmp
tar -xvzf /tmp/tyk-dashboard-amd64-v0.9.5.1.tar.gz

# Tyk config file
echo 'copying default configuration file and make tyk dir writeable'
sudo chmod -R 777 /etc/tyk
sudo cp -f /vagrant/tyk.conf /etc/tyk/tyk.conf

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, rock on!'
