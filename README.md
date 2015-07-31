# Alexis Hevia's puppet files
These puppet files should allow me to reconstruct my entire development environment on a blank Ubuntu 12.04 distribution (or 14.04 distribution with gnome-fallback mode)

## How To Use
```
sudo apt-get update

# puppet can be installed using apt-get or rubygems
sudo apt-get install puppet git
gem install puppet

git clone https://github.com/alexishevia/.puppet.git ~/.puppet
sudo puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine-root.pp
puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine.pp
```


