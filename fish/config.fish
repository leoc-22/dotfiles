if status is-interactive
# Commands to run in interactive sessions can go here
end

set -g fish_greeting

abbr --add vim nvim
abbr --add vi nvim
abbr --add kk k9s

starship init fish | source
fzf --fish | source
zoxide init fish | source

set -gx REQUESTS_CA_BUNDLE /Library/Certificates/allcerts.pem

# add these in cli
# fish_add_path /Users/lcao/Library/Application\ Support/JetBrains/Toolbox/scripts/
# fish_add_path -U --move /opt/homebrew/bin /opt/homebrew/sbin
