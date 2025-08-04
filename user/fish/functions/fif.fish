function fif --description 'Find in files using rg + fzf with preview'
    if test (count $argv) -eq 0
        echo 'Usage: fif <search-term>'
        return 1
    end

    set -l search_term "$argv[1]"
    set -l preview_cmd "rg --ignore-case --pretty --context 10 '$search_term' {}"

    if type -q highlight
        set preview_cmd "highlight -O ansi --force -l {} | rg --ignore-case --pretty --context 10 '$search_term' --colors 'match:bg:yellow'"
    end

    rg --files-with-matches --no-messages "$search_term" | fzf --preview "$preview_cmd"
end
