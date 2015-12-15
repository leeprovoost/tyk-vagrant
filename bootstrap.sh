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
echo 'downloading Tyk Gateway 1.9.0'
wget https://github.com/TykTechnologies/tyk/releases/download/v1.9/tyk-gateway_1.9.0.0_amd64.deb -P /tmp
echo 'installing Tyk Gateway 1.9.0'
sudo dpkg -i /tmp/tyk-gateway_1.9.0.0_amd64.deb

# Install Tyk Dashboard
echo 'downloading Tyk Dashboard 0.9.7'
wget https://github.com/TykTechnologies/tyk/releases/download/v1.9/tyk-dashboard_0.9.7.0_amd64.deb -P /tmp
echo 'installing Tyk Dashboard 0.9.7'
sudo dpkg -i /tmp/tyk-dashboard_0.9.7.0_amd64.deb

# Copy init script from vagrant box to host machine
echo 'copying bootstrap script from vagrant box to host machine'
cp /opt/tyk-dashboard/install/bootstrap.sh /vagrant/init.sh

# Needed for docs generation.
update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

echo 'all set, rock on!'
