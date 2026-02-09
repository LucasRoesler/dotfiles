function zellij --wraps=zellij --description 'Zellij with auto-attach to default session'
    if test (count $argv) -eq 0
        # No args: attach to "term" session (creates if needed, resurrects if exited)
        command zellij attach -c term
    else
        # Args provided: pass through to zellij directly
        command zellij $argv
    end
end
