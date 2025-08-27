# Just command completion for Fish shell

# Autocomplete recipe names as first argument
complete -c just -xa "(just --list 2>/dev/null | awk 'NR>1 {print \$1}')"

# Autocomplete file paths for any arguments after recipe name
# -n: condition (number of command tokens >= 2)
# -k: keep existing completions
# -xa: exclusive arguments with autosuggestion
complete -c just -n 'test (count (commandline -opc)) -ge 2' -k -xa '(__fish_complete_path (commandline -ct))'
