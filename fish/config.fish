if status is-interactive
# Commands to run in interactive sessions can go here
end

set -g fish_greeting

abbr --add vim nvim
abbr --add vi nvim
abbr --add kk k9s
abbr --add cu cursor
abbr --add co code
abbr --add g ./gradlew

starship init fish | source
fzf --fish | source
zoxide init fish | source

# load nvm on shell startup
function nvm
   bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
nvm use default --silent

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
set -gx SDKMAN_DIR "$HOME/.sdkman"
if test -s "$HOME/.sdkman/bin/sdkman-init.sh"
  bass source "$HOME/.sdkman/bin/sdkman-init.sh"
end


