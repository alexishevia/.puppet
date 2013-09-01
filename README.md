# Alexis Hevia's puppet files
These puppet files should allow me to reconstruct my entire development environment on a blank Ubuntu 12.04 distribution

## How To Use
```
sudo apt-get update
sudo apt-get install puppet git
git clone https://github.com/alexishevia/.puppet.git ~/.puppet
sudo puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine-root.pp
puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/devmachine.pp
```


