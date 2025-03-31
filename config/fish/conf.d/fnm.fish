
# fnm
set FNM_PATH "/home/lucas/.local/share/fnm"
if [ -d "$FNM_PATH" ]
    set PATH "$FNM_PATH" $PATH
    fnm env --use-on-cd --corepack-enabled | source
end
