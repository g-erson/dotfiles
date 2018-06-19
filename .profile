export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

PS1="\[\e[36m\]\`parse_git_branch\`\[\e[m\]\[\e[32m\]\u\[\e[m\]@\[\e[31m\]\h\[\e[m\] \W\\$ "

# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
								    
# aliases
alias ls="ls -G"
alias tmux="TERM=screen-256color-bce tmux"

# MacPorts Installer addition on 2015-02-21_at_18:19:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/opt/android-sdk:/Users/George/.local/lib/aws/bin/:/Users/George/Documents/Programs/C/neovim/bin:/usr/local/lib/node_modules/oni/cli:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4
export ASAN_OPTIONS="log_path=${HOME}/.logs/asan" or export ASAN_OPTIONS="detect_leaks=1:log_path=${HOME}/.logs/asan" 
export MSAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4
export TSAN_OPTIONS="external_symbolizer_path=/usr/bin/llvm-symbolizer-3.4 log_path=${HOME}/.logs/tsan"
export HOMEBREW_GITHUB_API_TOKEN=37919efef00d1e11e804868766b960dd04d84686
export ANDROID_HOME=/usr/local/opt/android-sdk
export EDITOR="/usr/local/bin/nvim"

alias neovim="Electron /Users/George/Documents/NyaoVim/bin/cli.js"
alias pg-start="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
alias pg-stop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
