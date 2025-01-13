# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# setup carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
source <(carapace _carapace)

# setup starship
eval "$(starship init bash)"

# eval ssh-agent if not already running
if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval `ssh-agent -s`
    ssh-add
fi

# setup fzf-tab-completion
# in case I want to use the fzf-tab-completion script on a non-ublue system
# git clone https://github.com/lincheney/fzf-tab-completion.git ~/.dotfiles/fzf-tab-completion
# source ~/.dotfiles/fzf-tab-completion/bash/fzf-bash-completion.sh
source /usr/share/ublue-os/fzf-tab-completion/bash/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'

# configure fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
