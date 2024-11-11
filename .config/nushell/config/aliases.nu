# ls aliases
alias ll = ls -l
alias la = ls -a
alias lla = ls -l -a

# programs
alias lg = lazygit

# decomment a config file
alias decomment = grep -v -E "^[[:space:]]*((#|;|//).*)?$"

# check justfile
alias check-just = just --unstable --fmt --check -f
