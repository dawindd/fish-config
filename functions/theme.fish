function theme --wraps git --description "Git alias for themes"
    git --git-dir=$HOME/themes/.git --work-tree=$HOME $argv
end
