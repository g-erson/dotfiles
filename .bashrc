export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.composer/vendor/bin" # Add Lumen to PATH

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

PS1='\h:\W \u\$ '
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

# MacPorts Installer addition on 2015-02-21_at_18:19:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/opt/android-sdk:/Users/George/.local/lib/aws/bin/:/Users/George/Documents/Programs/C/neovim/bin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4
export ASAN_OPTIONS="log_path=${HOME}/.logs/asan" or export ASAN_OPTIONS="detect_leaks=1:log_path=${HOME}/.logs/asan" 
export MSAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4
export TSAN_OPTIONS="external_symbolizer_path=/usr/bin/llvm-symbolizer-3.4 log_path=${HOME}/.logs/tsan"
export HOMEBREW_GITHUB_API_TOKEN=37919efef00d1e11e804868766b960dd04d84686
export ANDROID_HOME=/usr/local/opt/android-sdk

echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
