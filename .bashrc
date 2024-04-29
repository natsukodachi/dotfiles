# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#GrADS
export GASCRP="${HOME}/grads_lib"
#module load grads-2.2.1

#alias
alias ls="ls --color=auto"
alias ll='ls -l --color=auto --show-control-chars'
alias la='ls -la --color=auto --show-control-chars'

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias vim='nvim'
alias vi='nvim'

alias grep='grep --color=auto'
alias memo='cat /${HOME}/memo'

#line
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'
export PS1='\[\e[36m\]\u@\h \w\n\$ \[\e[0m\]'

#node.js
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

#brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#npm
export PATH=~/.npm-global/bin:$PATH
