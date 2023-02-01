function fprev --description "Preview file or directory"
    set mime (file -b --mime-type $argv)
    switch $mime
        case inode/directory
            exa --git --icons --tree --color=always $argv
        case text/plain
            switch $argv
                case "*.md"
                    mdcat $argv
                case "*.json"
                    jq $argv
                case "*"
                    bat --color always $argv
            end
        case "image/*" "video/*"
            timg -g "$FZF_PREVIEW_COLUMNS"x"$FZF_PREVIEW_LINES" --frames 1 $argv
    end
end
