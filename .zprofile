eval $(ssh-agent) > /dev/null 2>&1
[[ -f $HOME/.ssh/forpublic ]] && ssh-add -q $HOME/.ssh/forpublic
[[ -f $HOME/.ssh/forprivate ]] && ssh-add -q $HOME/.ssh/forprivate
ssh-add -q
