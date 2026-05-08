if status is-interactive
    # Disable greeting
    set --global fish_greeting
    set --global --export GPG_TTY (tty)
    # Erlang/Elixir history
    set --global --export ERL_AFLAGS "-kernel shell_history enabled"
    set --global --export ANDROID_HOME "~/Android/Sdk"
    set --global --export ANDROID_SDK_ROOT "~/Android/Sdk"

    # Editor selection
    if command -v hx >/dev/null
        set --global --export EDITOR hx
    else
        set --global --export EDITOR nano
    end

    fish_add_path ~/.local/bin
    fish_add_path ~/.mix/escripts
    fish_add_path --global --prepend ~/p/flutter/bin
end
