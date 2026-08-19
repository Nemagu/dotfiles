function tm3 --description 'Create or attach a tmux session with 3 windows'
    set -l session $argv[1]
    test -z "$session"; and set session dev

    if not tmux has-session -t "$session" 2>/dev/null
        tmux new-session -d -s "$session" -n editor -c "$PWD"
        tmux new-window -t "$session" -n ai -c "$PWD"
        tmux new-window -t "$session" -n shell -c "$PWD"
        tmux select-window -t "$session:editor"
    end

    if set -q TMUX
        tmux switch-client -t "$session"
    else
        tmux attach-session -t "$session"
    end
end
