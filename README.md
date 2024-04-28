```bash
: '
                                   _       _    __ _ _
                                  | |     | |  / _(_) |
                                __| | ___ | |_| |_ _| | ___  ___
                               / _` |/ _ \| __|  _| | |/ _ \/ __|
                              | (_| | (_) | |_| | | | |  __/\__ \
                               \__,_|\___/ \__|_| |_|_|\___||___/
                                --------------------------------
                                Add a dot in front of that file! 
                         ----------------------------------------------

             -----------------------------------------------------------------------
             This repository is the collection of configurations that I learned over
             time and still use for my  daily work. The repository contains  configs
             files for vim,  tmux and etc.  This reposiotry also contains a file for
             automating the setup of  your development machine by using xcode tools,
             brew.sh and kalkayan/dotfiles.
             -----------------------------------------------------------------------
    
'
```

<br />

This repository is the pack of Linux-based configurations that I learned over time and still regularly use. It includes some bash, fzf (the goodness), ripgrep, vim, sweetening prompt, tmux, and so much more. The repository is just the code; if you are interested in building your own development experience from scratch, read the following series: [Add a dot in front of that file!](https://engineeringwith.kalkayan.io/series/developer-experience/?utm_source=github.com) (A four-part series based on my learnings).


# Start using these dotfiles

Before starting the installation, I recommend reading [Storing dotfiles with Git](https://engineeringwith.kalkayan.io/series/developer-experience/storing-dotfiles-with-git-this-is-the-way/?utm_source=github.com) to understand how this repository makes the best of Git using `--bare`. 

You can either follow the above articles and install these using `git clone --bare https://github.com/kalkayan/dotfiles.git` or use the setup script to install dotfiles/setup a machine/installing bins and casks and other things.  

```
# To install the dotfiles
curl -fsSL https://raw.githubusercontent.com/kalkayan/dotfiles/main/setup | zsh -s -- --with-dotfiles
```

Also, this repository provides you a neat way of setting up a new system with a single command, independent of any other softwares, run:

```
# To setup a new machine from scratch
curl -fsSL https://raw.githubusercontent.com/kalkayan/dotfiles/main/setup | zsh -s -- --new-machine
```

> If in case `https://sh.kalkayan.io/setup` is not available, please use the mirror `https://github.kalkayan.io/dotfiles/setup`.
## Contributing to dotfiles

Suggestions / Improvements or any other helpful trick is always welcome, Please raise a PR with some context or any helpful links.

Feel free to reach me out at [rec.manish.sahani@gmail.com](mailto:rec.manish.sahani@gmail.com) or connect with me on [LinkedIn](https://www.linkedin.com/in/manishsahani).
