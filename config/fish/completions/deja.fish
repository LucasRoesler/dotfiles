function __deja_needs_command
    test (count (commandline -opc)) -eq 1
end

complete -c deja -n '__deja_needs_command' -a 'blame bench completion ctx doctor embed forget handoff index install last log mcp remember resume share show sources stats statusline sync uninstall update version warmup'
complete -c deja -n '__deja_needs_command' -l json -d 'Print JSON'
complete -c deja -n '__deja_needs_command' -l re -d 'Interpret query as a regular expression'
complete -c deja -n '__deja_needs_command' -l all -d 'Include all results'
complete -c deja -n '__deja_needs_command' -l no-embed -d 'Skip semantic reranking'
complete -c deja -n '__deja_needs_command' -l harness -r -a 'claude codex opencode aider gemini cursor antigravity grok qwen pi copilot deja'
complete -c deja -n '__deja_needs_command' -l project -r
complete -c deja -n '__deja_needs_command' -l since -r
complete -c deja -n '__deja_needs_command' -l role -r -a 'user assistant tool'
complete -c deja -n '__deja_needs_command' -l rebuild

complete -c deja -n '__fish_seen_subcommand_from completion' -a 'bash zsh fish'
complete -c deja -n '__fish_seen_subcommand_from blame' -l all
complete -c deja -n '__fish_seen_subcommand_from blame' -l json
complete -c deja -n '__fish_seen_subcommand_from blame' -l harness -r -a 'claude codex opencode aider gemini cursor antigravity grok qwen pi copilot deja'
complete -c deja -n '__fish_seen_subcommand_from blame' -l project -r
complete -c deja -n '__fish_seen_subcommand_from blame' -l since -r
complete -c deja -n '__fish_seen_subcommand_from blame' -F
complete -c deja -n '__fish_seen_subcommand_from bench; and not __fish_seen_subcommand_from recall context' -a 'recall context'
complete -c deja -n '__fish_seen_subcommand_from recall' -l json
complete -c deja -n '__fish_seen_subcommand_from context' -l json
complete -c deja -n '__fish_seen_subcommand_from context' -l seed -r
complete -c deja -n '__fish_seen_subcommand_from doctor' -l json
complete -c deja -n '__fish_seen_subcommand_from doctor' -l offline
complete -c deja -n '__fish_seen_subcommand_from forget' -l list
complete -c deja -n '__fish_seen_subcommand_from forget' -l dry-run
complete -c deja -n '__fish_seen_subcommand_from forget' -l session -r
complete -c deja -n '__fish_seen_subcommand_from forget' -l project -r
complete -c deja -n '__fish_seen_subcommand_from forget' -l before -r
complete -c deja -n '__fish_seen_subcommand_from forget' -l unforget -r
complete -c deja -n '__fish_seen_subcommand_from handoff' -l to -r -a 'claude codex opencode gemini qwen aider pi grok'
complete -c deja -n '__fish_seen_subcommand_from handoff' -l exec
complete -c deja -n '__fish_seen_subcommand_from hook-context' -l plain
complete -c deja -n '__fish_seen_subcommand_from index' -l rebuild
complete -c deja -n '__fish_seen_subcommand_from install uninstall' -a 'claude-code codex opencode cursor gemini antigravity grok qwen copilot pi statusline --all --auto'
complete -c deja -n '__fish_seen_subcommand_from install uninstall' -l no-guidance
complete -c deja -n '__fish_seen_subcommand_from last' -l harness -r -a 'claude codex opencode aider gemini cursor antigravity grok qwen pi copilot deja'
complete -c deja -n '__fish_seen_subcommand_from last' -l project -r
complete -c deja -n '__fish_seen_subcommand_from last' -l since -r
complete -c deja -n '__fish_seen_subcommand_from last' -l role -r -a 'user assistant tool'
complete -c deja -n '__fish_seen_subcommand_from remember' -l project -r
complete -c deja -n '__fish_seen_subcommand_from resume' -l exec
complete -c deja -n '__fish_seen_subcommand_from stats' -l json
complete -c deja -n '__fish_seen_subcommand_from stats' -l html -r
complete -c deja -n '__fish_seen_subcommand_from stats' -l redaction
complete -c deja -n '__fish_seen_subcommand_from stats' -l card -r
complete -c deja -n '__fish_seen_subcommand_from stats' -l harness -r -a 'claude codex opencode aider gemini cursor antigravity grok qwen pi copilot deja'
complete -c deja -n '__fish_seen_subcommand_from stats' -l project -r
complete -c deja -n '__fish_seen_subcommand_from stats' -l since -r
complete -c deja -n '__fish_seen_subcommand_from stats' -l role -r -a 'user assistant tool'
complete -c deja -n '__fish_seen_subcommand_from sync; and not __fish_seen_subcommand_from export import ssh' -a 'export import ssh'
complete -c deja -n '__fish_seen_subcommand_from export' -l full
complete -c deja -n '__fish_seen_subcommand_from export' -F
complete -c deja -n '__fish_seen_subcommand_from import' -F
complete -c deja -n '__fish_seen_subcommand_from ssh' -l pull
complete -c deja -n '__fish_seen_subcommand_from ssh' -l full
