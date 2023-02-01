# Basics
set -g background 1a1b26
set -g foreground c0caf5
set -g selection 33467c

# Normal
set -g color0 15161e
set -g color1 f7768e
set -g color2 9ece6a
set -g color3 e0af68
set -g color4 7aa2f7
set -g color5 bb9af7
set -g color6 7dcfff
set -g color7 a9b1d6

# Bright
set -g color8 414868
set -g color9 db4b4b
set -g color10 9ece6a
set -g color11 ff9e64
set -g color12 7aa2f7
set -g color13 9d7cd8
set -g color14 73daca
set -g color15 c0caf5

# Syntax Highlighting
set -g fish_color_autosuggestion $color3
set -g fish_color_command $color2
set -g fish_color_comment $color4
set -g fish_color_cwd $color4
set -g fish_color_cwd_root $color5
set -g fish_color_end $color16
set -g fish_color_error $color1
set -g fish_color_escape $color5
set -g fish_color_history_current --bold
set -g fish_color_host $foreground
set -g fish_color_keyword $color5
set -g fish_color_normal $foreground
set -g fish_color_operator $color2
set -g fish_color_param $color13
set -g fish_color_quote $color4
set -g fish_color_redirection $foreground
set -g fish_color_user $color10
set -g fish_color_valid_path --underline

# Completion Pager Colors
set -g fish_color_match --background=$color2
set -g fish_color_search_match --background=$selection
set -g fish_color_selection --background=$selection
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $color8
set -g fish_pager_color_prefix $color6 --bold --underline
set -g fish_pager_color_progress $color8 --background=$color6
