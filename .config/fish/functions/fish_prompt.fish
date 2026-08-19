function fish_prompt
    set -l last_status $status
    set_color blue
    echo -n (prompt_pwd)
    set_color yellow
    echo -n (fish_git_prompt)
    set_color green
    echo
    echo -n '❯ '
    set_color normal
end
