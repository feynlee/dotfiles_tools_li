source ~/.bash_prompt

# TMUX: auto setup tmux session when log in
if which tmux >/dev/null 2>&1; then
#if not inside a tmux session, and if no session is started, start a new session
    test -z "$TMUX" && (tmux attach || tmux-ec2)
fi

recompile_ycm() {
    cd ~/.vim/bundle/YouCompleteMe
    python ./install.py
}
