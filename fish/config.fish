if status is-interactive
# Commands to run in interactive sessions can go here
end

set -g fish_greeting

abbr --add vim nvim
abbr --add vi nvim
abbr --add kk k9s
abbr --add cu cursor
abbr --add g ./gradlew

starship init fish | source
fzf --fish | source
zoxide init fish | source

set -gx REQUESTS_CA_BUNDLE /Library/Certificates/allcerts.pem

# load nvm on shell startup
if status --is-interactive
  nvm use default --silent >/dev/null
end

# require bass
# FOR SDKMAN TO WORK
set -gx SDKMAN_DIR "$HOME/.sdkman"
if test -s "$HOME/.sdkman/bin/sdkman-init.sh"
  bass source "$HOME/.sdkman/bin/sdkman-init.sh"
end

# add these in cli
# fish_add_path /Users/lcao/Library/Application\ Support/JetBrains/Toolbox/scripts/
# fish_add_path -U --move /opt/homebrew/bin /opt/homebrew/sbin
# fish_add_path /opt/homebrew/opt/mysql/bin

# add sdkman to fish for sdk cli to work
# https://blog.pawan.win/how-to-use-sdkman-with-fish-shell-a-detailed-guide
