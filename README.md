![banner.jpe](/static/banner.jpg)

![stability-wip](https://img.shields.io/badge/stability-stable-blue.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### Hades's Dotfiles 

I primarily use a 13' Macbook pro (named hades) for coding, this repository is the collection of configurations that I learned over time, I have also covered a in-depth tutorial for all these configuration.

This repository is mainly applies to MacOS or Linux and improvements and contributions for other platforms are more then welcome, feel free to reach me out at [rec.manish.sahani@gmail.com](mailto:rec.manish.sahani@gmail.com).


### To start using these dotfiles

If you want to give this a try, first fork the repository, **review the files and code** and **remove code that you don't need** ([see - Reviewing & editing code ]()).

> :warning: Don't blindly use these settings unless you know what that entails.

This repository container a bash script (`setup`) to automate the installation of all the binaries and brew casks, not only this, the repository also act as a dotfiles manager if followed the instructions below.

**Managing & tracking [dot]files**

The trick to manage these dotfiles is by creating a `bare` git repository ([read - Tracking dotfiles with git]()). To use this repository clone this as a `--bare` repository and just source the `.zshrc`, run the following command in the terminal:

```bash
# after forking replace <username> with your username handle
git clone --bare git@github.com:<username>/dotfiles.git $HOME/.dotfiles

# you can also clone via https
git clone --bare https://github.com/<username>/dotfiles.git $HOME/.dotfiles
````

To use this `--bare` repository, we need to define the `--work-tree` (this can be your home directory i.e., `$HOME`) and `--git-dir` (where the repository is cloned - `$HOME/.dotfiles`), so the command to use the repository will be
```bash
git --git-dir=$HOME/.dotfiles --work-tree=$HOME [command] [option]

# example - to check the logs 
git --git-dir=$HOME/.dotfiles --work-tree=$HOME log
```

For our convenience we can create an alias for this, stick the following line (if not already present) in `.zshrc` or `.aliases`.

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
``` 

At this point all the files are being tracked, and we can easily use this `--bare` repository just by running `dotfiles`, ex :-

```bash
# to check the status of the tracked and untracked files 
dotfiles status

# to add a file 
dotfiles add .tmux.conf

# push new files or changes to the github
dotfiles push origin main
```

> :warning: The `dotfiles status` will show all the untracked files to disable this behavior 

```bash 
# to remove the untracked directories and files from the listing
dotfiles config --local status.showUntrackedFiles no 
```

The great things about managing dotfiles with a git repo are
- no prerequisite - only `git` required
- we can have multiple versions of our configs using `git commits/tags`
- we can also create profiles with `git branch`.

```bash
# Manage multiple profiles - checkout out to the work profile 
dotfiles checkout work # or any other branch name
```

> :heavy_exclamation_mark:  Recommended Reading: [Tracking dotfiles with git]()

**Automated installation**

The installation of apps, libraries and other tools are automated, open the `setup` file and update the following code according to your needs.

```bash
# Brew casks and binaries that needs to be installed
bins = (
    "nvm"
    "php"
    "composer"
    # more valid brew formula here
)

casks=(
    "slack"
    # add brew casks that you need 
)
```

> :exclamation: you may need to add some post-installation code in the later part of scripts, please see the library installation page for the steps

After updating the `setup` file, just run the file in the terminal to install:
```bash
./setup
```

:wine_glass: Voila! you are all set 

---

Just to show you the gist of what this repository will achieve, below is how my terminal looks.

![terminal.png](/static/terminal.png)

---

### To start contributing to dotfiles

Suggestions / Improvements or any other helpful trick is always welcome, Please raise a PR with some context or any helpful links.


<!-----------------------------------------------------------------------------
    Footer 
------------------------------------------------------------------------------>

<div align="center">
<br/>
<br/>
<!-- Mail to -->
<a href="mailto:rec.manish.sahani@gmail.com">
    <img width="25" src="https://img.icons8.com/material/120/000000/google-logo--v1.png"/>
</a>

<!-- Linkedin -->
<a href="https://www.linkedin.com/in/manishsahani/">
    <img width="25" src="https://img.icons8.com/ios-glyphs/120/000000/linkedin-circled.png"/>
</a>

<!-- Github -->
<a href="https://github.com/kalkayan/">
    <img width="25" src="https://img.icons8.com/material-sharp/120/000000/github.png"/>
</a>

<a href="https://open.spotify.com/user/sy6eqinfdpxilwe9si9vf0bxs">
    <img width="25" src="https://img.icons8.com/fluent-systems-filled/48/000000/spotify.png"/>
</a>

</div>