export PATH=/opt/homebrew/bin:$PATH
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"


# Load Angular CLI autocompletion.
source <(ng completion script)

export NVM_DIR="/Users/golf/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Users/golf/.micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/golf/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/golf/micromamba/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/golf/micromamba/etc/profile.d/conda.sh" ]; then
        . "/Users/golf/micromamba/etc/profile.d/conda.sh"
    else
        export PATH="/Users/golf/micromamba/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PATH="$PATH:$HOME/.pub-cache/bin"


