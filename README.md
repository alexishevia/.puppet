# Alexis Hevia's puppet files
These puppet files should allow me to reconstruct my entire development environment on a blank PC

## How To Use
```
sudo apt-get update
sudo apt-get install puppet git
git clone https://github.com/alexishevia/.puppet.git ~/.puppet
puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/dotfiles.pp
sudo puppet apply --modulepath=$HOME/.puppet/modules ~/.puppet/manifests/apps.pp
```
