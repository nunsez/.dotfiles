if not command -q hx; and command -q helix
    function hx --wraps helix --description "Helix editor wrapper"
        command helix $argv
    end
end
