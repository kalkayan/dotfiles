![banner.jpe](/static/banner.jpg)

![stability-wip](https://img.shields.io/badge/stability-stable-blue.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

### Hades's Dotfiles 

I primarily use a 13' Macbook pro (named hades) for coding, this repository is the collection of configurations that I learned over time, I have also covered a in-depth tutorial for all these configuration.

This repository is mainly applies to Mac based systems or Linux and improvements and contributions for other platforms are more then welcome, feel free to reach me out at [rec.manish.sahani@gmail.com](mailto:rec.manish.sahani@gmail.com).

Just to show you the gist of what this repository will achieve, below is how my terminal looks.

![terminal.png](/static/terminal.png)


### To start using these dotfiles

If you want to give this a try, first fork the repository, **review the files and code** and **remove code that you don't need**. 

:warning: | Don't blindly use these settings unless you know what that entails.
:---: | :---

**Managing & tracking [dot]files**

The trick to manage these dotfiles is by creating a `bare` git repository ([read more about tracking dotfiles with git repo]()), to use this repository clone this as a `--bare` repository and just source the `.zshrc`, to clone this repository as a `--bare` run the following command in the terminal:

```bash
git clone --bare git@github.com:<username>/dotfiles.git $HOME/.dotfiles
````

To use this `--bare` repository, first we need to define the `--work-tree` and `--git-dir`, for our convenience we can create an alias for this, stick the following line (if not already added) in your `.zshrc` or `.aliases`

```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME
``` 

now we can easily manage this `--bare` repo, for example:

```bash
# to check the status run
dotfiles status

# to add a file 
dotfiles add .tmux.conf
```

The cool thing about managing dotfiles with a git repo is that we can have multiple versions of our configs, and we can also create profiles with `branch`.

**Recommended Reading**: [Tracking dotfiles with git]()

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