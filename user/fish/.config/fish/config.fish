if status is-interactive
    # Disable greeting
    set -g fish_greeting
    set -g GPG_TTY (tty)
    # Erlang/Elixir history
    set -g ERL_AFLAGS "-kernel shell_history enabled"

    # Editor selection
    if command -v hx >/dev/null
        set -gx EDITOR hx
    else
        set -gx EDITOR nano
    end

    fish_add_path ~/.local/bin
end
