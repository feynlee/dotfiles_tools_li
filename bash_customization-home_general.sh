# TMUX: auto setup tmux session when log in
export PATH=$PATH:$HOME/.tmux:~/App_build
# if which tmux >/dev/null 2>&1; then
# 	#if not inside a tmux session, and if no session is started, start a new session
# 	test -z "$TMUX" && (tmux attach || tmux-home)
# fi

# CONDA
# added by Anaconda3 5.1.0 installer
export PATH="/Applications/anaconda3/bin:$PATH"

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
