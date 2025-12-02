
if [[ "$(uname)" == 'Darwin' ]]; then
        # Set PATH, MANPATH, etc., for Homebrew.
        eval "$(/opt/homebrew/bin/brew shellenv)"

        if [ ! -S ~/.ssh/ssh_auth_sock ]; then
                eval `ssh-agent`
                ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
        fi
        export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
        ssh-add -q
        [[ -f $HOME/.ssh/forpublic ]] && ssh-add -q $HOME/.ssh/forpublic
        [[ -f $HOME/.ssh/forprivate ]] && ssh-add -q $HOME/.ssh/forprivate
else
        eval `ssh-agent` > /dev/null 2>&1
        ssh-add > /dev/null
        [[ -f $HOME/.ssh/forpublic ]] && ssh-add ~/.ssh/forpublic > /dev/null
        [[ -f $HOME/.ssh/forprivate ]] && ssh-add ~/.ssh/forprivate > /dev/null
fi
