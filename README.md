# bash-config

My personal bash config for linux anc mac.

## Installation

### Linux

```
cd ~
git clone https://github.com/jmgarciamaleno/bash-config.git
mv .bashrc .bashrc_backup
ln -s bash-config/bashrc ~/.bashrc
```
### Mac

```
cd ~
git clone https://github.com/jmgarciamaleno/bash-config.git
mv .bash_profile .bash_profile_backup
ln -s bash-config/bashrc ~/.bash_profile
```

## Uninstallation

### Linux

```
cd ~
unlink .bashrc
mv .bashrc_backup .bashrc
rm -rf bash-config
```
### Mac

```
cd ~
unlink .bash_profile
mv .bash_profile_backup .bash_profile
rm -rf bash-config
```
