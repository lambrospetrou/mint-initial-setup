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

**Guake terminal**

```
sudo apt install guake
```

**Adobe fonts**

```
mkdir -p ~/.fonts
cd ~/.fonts

# Download from https://github.com/adobe-fonts/source-sans-pro/releases/
# Download from https://github.com/adobe-fonts/source-code-pro/releases/
# Download from https://github.com/adobe-fonts/source-serif-pro/releases
# Unzip the files and then move them to `~/.fonts`
cp -r ~/Downloads/source-code-pro-2.030R-ro-1.050R-it ~/.fonts/
cp -r ~/Downloads/source-sans-pro-2.020R-ro-1.075R-it ~/.fonts/
cp -r ~/Downloads/source-serif-pro-2.000R ~/.fonts/

# Update font cache
sudo fc-cache
```

**Insync**

Google Drive syncing https://www.insynchq.com/downloads

In order to mount the `Data` partition on boot:

```
sudo vim /etc/rc.local

sudo mount /dev/sdb4 /media/Data
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

In `Sublime Text 3` after installing `GoSublime`, open the package preferences and enter:

```
{

	// you may set specific environment variables here
	// e.g "env": { "PATH": "$HOME/go/bin:$PATH" }
	// in values, $PATH and ${PATH} are replaced with
	// the corresponding environment(PATH) variable, if it exists.
	"env": {"GOPATH": "$HOME/dev/go", "GOROOT": "/opt/go", "PATH": "$GOPATH/bin:$PATH" },
	"fmt_cmd": ["goimports"]
}
```

#### Erlang/Elixir

```
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang elixir
```

#### Racket

Download latest version from https://download.racket-lang.org/

```
cd ~/Downloads
chmod +x racket-6.12-x86_64-linux.sh
sudo ./racket-6.12-x86_64-linux.sh

# Q: Do you want a Unix-style distribution?
# - NO
# Q: Where do you want to install the "racket" directory tree?
# - /opt/racket
```

In `.bash_lp_config`:

```
export PATH=$PATH:/opt/racket/bin
```

or from PPA

```
sudo add-apt-repository ppa:plt/racket
sudo apt-get update && sudo apt install racket
```

#### Haskell

Downloaded the Haskell Platform: https://www.haskell.org/platform/linux.html#linux-generic

Changed the `install-haskell-platform.sh` file to install in `/opt/haskell` instead of `/usr/local/haskell`:

```
absVersionDir="/opt/haskell/ghc-8.4.2-x86_64"
...
if ! tar -xf "$usr_local_tar" --strip-components=2 -C /opt; then

```

#### AWS CLI

https://docs.aws.amazon.com/cli/latest/userguide/awscli-install-linux.html

In `.bash_lp_config`:

```
export PATH=~/.local/bin:$PATH
```
