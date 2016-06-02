# install erlang
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
sudo dpkg -i erlang-solutions_1.0_all.deb

sudo apt-get update
sudo apt-get install -q -y erlang

# add the APT repository to your /etc/apt/sources.list.d
echo 'deb http://www.rabbitmq.com/debian/ testing main' |
    sudo tee /etc/apt/sources.list.d/rabbitmq.list

# add public key to trusted key list
wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | sudo apt-key add -

# update the package list
sudo apt-get update

# Install rabbitmq-server package
sudo apt-get install -q -y rabbitmq-server

# copy config file
sudo cp /vagrant/rabbitmq.config /etc/rabbitmq

sudo service rabbitmq-server stop
sudo rabbitmq-plugins enable rabbitmq_management
sudo service rabbitmq-server start
