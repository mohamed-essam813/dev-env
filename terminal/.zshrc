# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  yarn
  zsh-256color
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='code-insiders'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias dsk='cd ~/Desktop'
alias work='cd ~/Desktop/Vezeeta'
alias personal='cd ~/Desktop/Personal'
alias college='cd ~/Desktop/College'
alias edit='code-insiders'
alias f='open -a Finder ./'
alias ~="cd ~"
alias c='clear'
alias hideDesktop="defaults write com.apple.finder CreateDesktop false; killall Finder;"
alias showDesktop="defaults write com.apple.finder CreateDesktop true; killall Finder;"
alias pr="vsts code pr create --delete-source-branch --output table --open"
trash () { command mv "$@" ~/.Trash ; }
ql () { qlmanage -p "$*" >& /dev/null; }
alias mysql=/usr/local/mysql/bin/mysql
alias composer="php /usr/local/bin/composer.phar"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias python='python3'



# Tiny terminal care config
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'
export TTC_SAY_BOX='cat'

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~/Desktop/Vezeeta,~/Desktop/Personal'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=2

# Which method is to be used to read the git commits ('gitstandup' | 'gitlog').
# If you're having problems seeing your commits in the dahsboard, set
# this value to gitlog.
export TTC_GITBOT='gitlog'

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='Cairo'

# Set to false if you're an imperial lover <3
export TTC_CELSIUS=true

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Turn off terminal title
export TTC_TERMINAL_TITLE=false

# Twitter api keys
export TTC_CONSUMER_KEY='47P54WPoJB3ebZzBJUm9wDtWQ'
export TTC_CONSUMER_SECRET='JaXpbvJjz3C5zZlfsVRc7p4NR2zM1jn90gm0u0dYVUejeJHXPD'
export TTC_ACCESS_TOKEN='2291852661-GCtJcGvWLSRn4yi7BjkKhKKolUPqb0CNH7qMdjU'
export TTC_ACCESS_TOKEN_SECRET='rgcPv8rIlVdJuZqomKbBv3IMBeufgNS19xquIyQO0jWOa'

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

. ~/.oh-my-zsh/plugins/z/z.sh
. ~/.oh-my-zsh/plugins/git/

source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh

eval "$(rbenv init -)"
export PATH=$PATH:/Users/muhammadtarek/lib/vsts-cli/bin
export PATH=~/.local/bin:$PATH

# source '/Users/muhammadtarek/lib/vsts-cli/vsts.completion'

#
# Main prompt
#

local host_name="%{$fg[cyan]%}muhammad-tarek"
local path_string="%{$fg[cyan]%}%~"
local prompt_string=">"

# Make prompt_string red if the previous command failed.
local return_status="%(?:$prompt_string:%{$fg[red]%}$prompt_string)"

# # get the name of the branch we are on
# _git_repo_name() {
#     gittopdir=$(git rev-parse --git-dir 2> /dev/null)
#     if [[ "foo$gittopdir" == "foo.git" ]]; then
#         echo `basename $(pwd)`
#     elif [[ "foo$gittopdir" != "foo" ]]; then
#         echo `dirname $gittopdir | xargs basename`
#     fi
# }

# git-branch() {
#      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ @\1/'
# }

# git-dirty() {
#   # check if we're in a git repo
#   command git rev-parse --is-inside-work-tree &>/dev/null || return
#   # check if it's dirty
#   # using these emoji make multi line commands be broken and appear on one line. shrug.
#   #command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo '☔️' || echo '☀️'
#   command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo '⛈' || echo '🌞'
# }

# autoload -U colors
# colors
# setopt prompt_subst

# PROMPT=$'\n''${path_string}%{$fg[yellow]%}$(git-branch)%{$reset_color%} %{$fg[red]%}$(git-dirty)%{$reset_color%}'$'\n''%{$reset_color%}${return_status} %{$reset_color%}'
export PATH=$PATH:/Users/muhamamdtarek/lib/vsts-cli/bin
export PATH=/usr/local/php5/bin:$PATH
export PATH="/usr/local/opt/opencv@2/bin:$PATH"
export PYTHONPATH="${PYTHONPATH}/Library/Frameworks/Python.framewor‌​k/Versions/3.6/bin/"‌​:/usr/local/lib/pyth‌​on3.6/site-packages
# source '/Users/muhamamdtarek/lib/vsts-cli/vsts.completion'
SPACESHIP_NODE_SHOW=false
SPACESHIP_TIME_SHOW=false
