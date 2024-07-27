# myzsh

Just a script which setups my zsh environment.

## Usage

Via curl:

```shell
bash -c "$(curl -fsSL https://raw.githubusercontent.com/res876ttb/myzsh/master/install.sh)"
```

Via wget:

```shell
bash -c "$(wget https://raw.githubusercontent.com/res876ttb/myzsh/master/install.sh -O -)"
```

**NOTE**: The provided one-click installation script will install myzsh to `~/.myzsh`. DO NOT remove this directory because the file `~/.zshrc` is just a symbolic link.

## Using zoxide

This shell setup includes zoxide, which is a very powerful cd alternative tool. It initializes zoxide as `cd`, so please use `cd` as the prefix for zoxide features.

Here is some example:

```
# cd to the path that match the most recently
cd myzsh # Go to $HOME/.zshrc

# open zoxide interactive interface
cdi

# open zoxide interactive interface with search results
cdi myzsh

# edit zoxide data base
ze # or zoxide edit
```
