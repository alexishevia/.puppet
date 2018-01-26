# Alexis Hevia's puppet files
These puppet files should allow me to reconstruct my entire development environment on a blank Ubuntu 16.04

## How To Use
```
sudo apt-get update
gem install puppet
git clone https://github.com/alexishevia/.puppet.git ~/.puppet
puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine.pp
```
