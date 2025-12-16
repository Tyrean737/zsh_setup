# zsh Set Up
Small script to set up zsh configuration.

### Install
Just run
```bash
sudo bash zsh_setup.sh
```

and the script installs:
- zsh
- woff2-font-awesome (Font Awesome for Emoji support)
- ttf-hack-nerd (Nerd Font for Unicode support)
- oh-my-zsh-git
- zsh-theme-powerlevel10k

And copies the config.zsh to the correct location.
The config is copied from CachyOS.

### Customize
On first startup of zsh p10k will run a custimization script. To rerun this script later run
```zsh
p10k configure
```

or edit ~/.p10k.zsh
