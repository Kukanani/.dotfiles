###################################################################
# General stuff
###################################################################
export PATH=~/.local/bin:~/.dotfiles/:$PATH
export LD_LIBRARY_PATH=~/.local/lib:~/.local/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH

# .bashrc quality of life
alias bs='source ~/.bashrc'

# kill vscode instances
alias killcode='kill -9 $(ps aux | grep "[u]sr/share/code/code" | tr -s " " | cut -d" " -f2)'

# clipboard
alias xclip="xclip -sel clip"

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
# Eternal bash history
###################################################################
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
