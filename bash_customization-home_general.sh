# TMUX: auto setup tmux session when log in
export PATH=$PATH:$HOME/.tmux:~/App_build
#if which tmux >/dev/null 2>&1; then
#	#if not inside a tmux session, and if no session is started, start a new session
#	test -z "$TMUX" && (tmux attach || tmux-home)
#fi

# CONDA
# added by Anaconda3 5.1.0 installer
export PATH="/Applications/anaconda3/bin:$PATH"

alias link_dotfiles="stow -v -R -t ~ ."

# vim mode
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
	       [[ $1 = 'block' ]]; then
      echo -ne '\e[1 q'
	    elif [[ ${KEYMAP} == main ]] ||
			       [[ ${KEYMAP} == viins ]] ||
				          [[ ${KEYMAP} = '' ]] ||
						         [[ $1 = 'beam' ]]; then
		    echo -ne '\e[5 q'
			  fi
		  }
	  zle -N zle-keymap-select
	  zle-line-init() {
	      zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
		      echo -ne "\e[5 q"
		  }
	  zle -N zle-line-init
	  echo -ne '\e[5 q' # Use beam shape cursor on startup.
	  preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


# convenient functions
gcdot () {
	cwd=$(pwd)
	cd $DOTFILES_HOME/dotfiles_home
	git commit -am '${1}'
	git push
	cd $DOTFILES_HOME/dotfiles_tools_li
	git commit -am '${1}'
	git push
	cd $cwd
}

ldot () {
	cwd=$(pwd)
	cd $DOTFILES_HOME/dotfiles_home
	stow -v -R -t ~ .
	cd $DOTFILES_HOME/dotfiles_tools_li
	stow -v -R -t ~ .
	cd $cwd
}


add_conda_kernels () {
	conda activate py3
	python -m ipykernel install --user --name myenv --display-name "py3"
	conda deactivate
	conda activate py27
	python -m ipykernel install --user --name myenv --display-name "py27"
	conda deactivate
}

# GIT
git_delete_branch () {
	git branch -d $1
	git push origin :$1
}

# VIM
recompile_ycm() {
	cd ~/.vim/bundle/youcompleteme
	/usr/local/bin/python3 ./install.py
}

# FAST.AI
fastai_old() {
	ZONE="us-west2-b" # budget: "us-west1-b"
	INSTANCE_NAME="my-fastai-instance"
	gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080
}

fastai() {
	ZONE="us-east1-c" # budget: "us-west1-b"
	INSTANCE_NAME="my-fastai-instance-2"
	gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080
}

fastai_p() {
	ZONE="us-west1-b" # budget: "us-west1-b"
	INSTANCE_NAME="my-fastai-instance-persistant"
	gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080
	# gcloud beta compute --project "famous-design-243419" ssh --zone "us-west1-b" "my-fastai-instance-persistant" -- -L 8080:localhost:8080

}

fastai_download() {
	ZONE="us-west1-b" # budget: "us-west1-b"
	INSTANCE_NAME="my-fastai-instance-persistant"
	gcloud compute scp $INSTANCE_NAME:$1 $2 --zone $ZONE
  }

# RUBY
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
