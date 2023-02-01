function dot --wraps git --description "Git alias for dotfiles"
    git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME $argv
end
