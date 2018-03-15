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
