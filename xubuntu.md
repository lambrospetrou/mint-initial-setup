## Xubuntu 16.04

**Albert**

```
sudo add-apt-repository ppa:flexiondotorg/albert
sudo apt-get update && sudo apt-get install albert
```

**Terminator**

```
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update && sudo apt-get install terminator
```
**Adobe fonts**

```
mkdir -p ~/.fonts
cd ~/.fonts

# Download from https://github.com/adobe-fonts/source-sans-pro/releases/
# Download from https://github.com/adobe-fonts/source-code-pro/releases/
# Unzip the files and then move them to `~/.fonts`
cp -r ~/Downloads/source-code-pro-2.030R-ro-1.050R-it ~/.fonts/
cp -r ~/Downloads/source-sans-pro-2.020R-ro-1.075R-it ~/.fonts/

# Update font cache
sudo fc-cache
```

### ~/.bash_lp_config

The file `~/.bash_lp_config` holds all custom exports we need for shell.

Inside the `.bashrc` put the following:

```
## Lambros specifics shell configuration
if [ -f ~/.bash_lp_config ]; then
     source ~/.bash_lp_config
fi
```

### Languages / SDKs

All custom languages and sdks should be installed inside `/opt/`.

#### Go

https://golang.org/doc/install

```
# After downloading the version we want
sudo tar -C /opt/ -xzf go$VERSION.$OS-$ARCH.tar.gz
```

In `.bash_lp_config`:

```
# Golang
export GOPATH=$HOME/dev/go
export GOROOT=/opt/go
export PATH=$PATH:$GOROOT/bin
```
