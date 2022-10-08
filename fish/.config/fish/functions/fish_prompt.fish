function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color yellow
    printf 'me'
    set_color normal
    printf ' in '

    set_color $fish_color_cwd
    printf '%s' (basename $PWD)
    set_color normal

    if set -l git_branch (command git symbolic-ref HEAD 2>/dev/null | string replace refs/heads/ '')
        printf "(🌳%s)" $git_branch
    end

    # Line 2
    if test -n "$VIRTUAL_ENV"
        printf "(🐍%s)" (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    echo
    printf "=> "
    set_color normal
end
