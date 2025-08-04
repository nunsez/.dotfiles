if status is-interactive
    # Disable greeting
    set -g fish_greeting

    # Editor selection
    if command -v hx >/dev/null
        set -gx EDITOR hx
    else
        set -gx EDITOR nano
    end

    fish_add_path ~/.local/bin
end
