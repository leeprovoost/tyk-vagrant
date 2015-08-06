# tyk-vagrant

Vagrant script for Tyk API Gateway https://tyk.io/

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

Log into your vagrant box:

```
vagrant ssh
```

Start tyk:

```
tyk --conf=/etc/tyk/tyk.conf
```

Open a new terminal window, log into your vagrant box:

```
vagrant ssh
```

Go to the Tyk Dashboard Directory:

```
cd /home/vagrant/tyk-analytics-v0.9.5.1
```

Then start your Tyk Dashboard:

```
./tyk-analytics --neworg --newuser
```

Answer the questions as following:

```
INFO[0000] Loading configuration from ./tyk_analytics.conf
INFO[0000] Connecting to redis on: localhost:6379
INFO[0000] Creating a new org...

Organisation name:  ACME
Organisation slug:  am
New organisation ID: 55c33ea9a8f3e82088000001

INFO[0033] Creating a new user...

First name: Lee
Last name:  Provoost
Email address:  youremailaddress@example.com

Organisations:
--------------
0. ACME
Select user organisation (-1 for empty - only recommended for custom integrations): 0
New password: Password123
Re-enter password:  Password123

INFO[0098] Tyk.io Analytics Dashboard 0.9.5
INFO[0098] Copyright Jively Ltd. 2014
INFO[0098] http://www.tyk.io
INFO[0098] Listening on port: 3000
```

Open your browser now and go to: `http://localhost:3000`.

Go in System Management to [Apis](http://localhost:3000/#/apis), click on Add new API on the right and fill in the details.

## Useful references

* http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/
* https://tyk.io/v1.7/setup/dashboard-config/



