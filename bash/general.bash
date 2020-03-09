###################################################################
# General stuff
###################################################################
export PATH=~/.local/bin:~/.dotfiles/:$PATH
export LD_LIBRARY_PATH=~/.local/lib:~/.local/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH

# .bashrc quality of life
alias bs='source ~/.bashrc'

# kill vscode instances
alias killcode='kill -9 $(ps aux | grep "[u]sr/share/code/code" | tr -s " " | cut -d" " -f2)'

# TODO
# shorthand
alias todo="~/.todoist/todoist_linux_amd64"
# today
alias tt="~/.todoist/todoist_linux_amd64 --color --header --namespace --indent --project-namespace list --filter '(overdue | today)'"

###################################################################
# Terminal Prompt
###################################################################

# via https://github.com/magicmonty/bash-git-prompt
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=0

GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

GIT_PROMPT_START="\[\e[107;1;30m\]\u\[\e[m\] @ \[\e[93m\]\h\[\e[m\]:\[\e[31m\]\w\[\e[m\] "    # uncomment for custom prompt start sequence
GIT_PROMPT_END="\n\\$ "      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
# GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/gitprompt.sh

###################################################################
# Terminal Prompt
###################################################################
alias tasks='git grep -EI "TODO|FIXME"'
