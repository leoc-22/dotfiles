# Installing Fish Shell

## Bass

```shell
fisher install edc/bass
```

## Homebrew

```shell
fish_add_path -U --move /opt/homebrew/bin /opt/homebrew/sbin
```

## NVM

Install NVM manually (https://github.com/creationix/nvm)
Install bass (https://github.com/edc/bass)
Add code below to `config.fish`

```shell
function nvm
   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

nvm use default --silent
```

## Java and Intellij

```shell
fish_add_path /Users/lcao/Library/Application\ Support/JetBrains/Toolbox/scripts/
```


