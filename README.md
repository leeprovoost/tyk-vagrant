# tyk-vagrant

Vagrant script for Tyk API Gateway https://tyk.io/

Covers:

* Tyk Gateway 1.9.0
* Tyk Dashboard 0.9.7

## Installation

Install [Vagrant](http://docs.vagrantup.com/v2/installation/) and [Virtualbox](https://www.virtualbox.org/wiki/Downloads).

Download this repository to your local development machine:

```
git clone git@github.com:leeprovoost/tyk-vagrant.git
```

Go to project directory and run:

```
vagrant up
```

## How to use

Open a terminal and log into your vagrant box:

```
vagrant ssh
```

Run Tyk configuration scripts (replace XXX.XXX.XXX.XXX with your host computer's IP address):

```
sudo /opt/tyk-gateway/install/setup.sh --dashboard=1 --listenport=8080 --redishost=localhost --redisport=6379 --domain="" --mongo=mongodb://localhost/tyk_analytics

sudo /opt/tyk-dashboard/install/setup.sh --listenport=3000 --redishost=localhost --redisport=6379 --mongo=mongodb://localhost/tyk_analytics --tyk_api_hostname=$HOSTNAME --tyk_node_hostname=http://localhost --tyk_node_port=8080 --portal_root=/portal --domain="XXX.XXX.XXX.XXX"
```

If you need some more info on tweaking the configuration, have a look at the Tyk [documentation](https://tyk.io/v1.9/setup/vagrant-setup/).

Start the Tyk services now:

```
sudo service tyk-gateway start
sudo service tyk-dashboard start
```

Final step is to run the configurator to create a test account. Open a new terminal, go to your project directory and run from your *host* machine (Replace the XXX.XXX.XXX.XXX with your computer's IP address):

```
sudo ./init.sh XXX.XXX.XXX.XXX
```

If all goes well, you should see now something like:

```
Creating Organisation
ORGID: 566ff039a8f3e81ecf000001
Adding new user
USER AUTH: 3e997cec843945dc734c7cf530c2c149
NEW ID: 566ff039cdc5a98e593f3ab4
Setting password

DONE
====
Login at http://XXX.XXX.XXX.XXX:3000/
User: iqo1tov7rn@default.com
Pass: test123
```

Open your browser now: http://XXX.XXX.XXX.XXX:3000/ and log in with the credentials you've been provided by the configuration script.
