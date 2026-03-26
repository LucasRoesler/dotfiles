set -g cyan (set_color -o cyan)
set -g red (set_color -o red)
set -g green (set_color -o green)
set -g normal (set_color normal)

# git prompt settings
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showcolorhints 1
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_describe_style 'contains'
set -g __fish_git_prompt_char_dirtystate "⨯"
set -g __fish_git_prompt_char_cleanstate "🗸"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_conflictedstate "+"
set -g __fish_git_prompt_color_dirtystate bryellow
set -g __fish_git_prompt_color_cleanstate green
set -g __fish_git_prompt_color_invalidstate brred
set -g __fish_git_prompt_color_prefix blue --bold
set -g __fish_git_prompt_color_suffix blue --bold
set -g fish_prompt_pwd_dir_length 4

function fish_prompt
  set -l last_status $status

  if test $last_status = 0
      set arrow "$green❯ "
  else
      set arrow "$red❯ "
  end
  set -l cwd $cyan(prompt_pwd)$normal
  echo -s $cwd (fish_git_prompt) $normal $arrow
end
