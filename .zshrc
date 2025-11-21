# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohm.config/zsh/plugins/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in .config/zsh/plugins/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than .config/zsh/plugins/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in .config/zsh/plugins/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
# source .zsh/plugins/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

export PATH="$PATH:$HOME/.bun/bin"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias reload-zsh='source ~/.zshrc'
alias edit-zsh="nvim ~/.zshrc"
# alias vim = "nvim"
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gd='git diff'
alias gco='git checkout'
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'
alias nrd="npm run dev"
alias nb="npm run build"
alias prd="pnpm run dev"
alias pb="pnpm build"
alias rmdir--rf="rmdir --ignore-fail-on-non-empty"
alias sdkmanager="cmd //c sdkmanager.bat --sdk_root=/c/Android"
alias avdmanager="cmd //c avdmanager.bat"
alias ghce="gh copilot explain"
alias ghcs="gh copilot suggest"
alias off-mongod='mongod --shutdown --dbpath "C:\Program Files\MongoDB\Server\8.0\data"'
alias tree="tree -I 'node_modules|dist|build|.next|.build'"
# alias js2ts="find . -type f -name "*.js" ! -path "./node_modules/*" -exec bash -c 'mv "$0" "${0%.js}.ts"' {} \;"
# alias ts2js="find . -type f -name "*.ts" ! -path "./node_modules/*" -exec bash -c 'mv "$0" "${0%.ts}.js"' {} \;"

# alias ohmyzsh="mate ~/.oh-my-zsh"


# Alias for removing directories with confirmation
alias rmrf='rm_directory() {
    if [ -z "$1" ]; then
        echo "Usage: rmrf <directory_path>"
        echo "Safely removes a directory and all its contents"
        return 1
    fi

    echo "Warning: This will permanently delete: $1"
    echo -n "Are you sure you want to proceed? (y/N): "
    read confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        rm -rf "$1" && echo "Successfully removed: $1" || echo "Error: Failed to remove directory"
    else
        echo "Operation cancelled"
    fi
}; rm_directory'

# Function to download boilerplate from my github
#Bp means - boilerplate


alias boilerplate='function _dboilerplate(){
  echo ""
  echo -e "\033[34m🚀  Available Frameworks:\033[0m"
  echo -e "   - 🧪 express"
  # echo -e "   - ⚡ fastify"
  # echo -e "   - 🌀 hapi"
  # echo ""

  read -p "👉  Choose a framework: " framework
  # echo ""

  echo -e "\033[34m🛠️  Available Languages:\033[0m"
  echo -e "   - 🟨 js"
  echo -e "   - 🟦 ts"
  # echo ""

  read -p "👉  Choose a language (js/ts): " lang
  read -p "📁  Name your new project folder: " folder
  echo ""

  repo="idighekere/${framework}-boilerplate#${lang}"

  echo -e "\033[34m📦  Cloning $framework ($lang) boilerplate into ./$folder ...\033[0m"

  # Check if the repository exists first
  if npx degit "$repo" "$folder" --mode=git; then
    echo ""
    echo -e "\033[32m✅  Success! Your project is ready in '$folder'\033[0m"
    echo -e "\033[33m💡  Next steps:\033[0m"
    echo -e "   cd $folder"
    echo -e "   pnpm install"
    echo -e "   pnpm dev"
  else
    echo -e "\033[31m❌  Something went wrong while cloning. Please check your inputs and the repository status.\033[0m"
  fi
}; _dboilerplate'


# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Open in tmux popup if on tmux, otherwise use --height mode
export FZF_DEFAULT_OPTS='--height 40% --tmux bottom,40% --layout reverse --border'

# Set default editor (you can change this to vim or nano if preferred)
export EDITOR='nvim'

# Fast directory switching (optional)
# export CDPATH=.:~:~/projects
export CDPATH=.:/home/idighs/Projects

# Custom greeting message (optional)
echo "Welcome back, $(whoami)! Happy coding ☺️"

# Autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting (must be last)
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
