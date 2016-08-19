# https://github.com/blinks zsh theme

# This theme works with both the "dark" and "light" variants of the
# Solarized color schema.  Set the SOLARIZED_THEME variable to one of
# these two values to choose.  If you don't specify, we'll assume you're
# using the "dark" variant.

case ${SOLARIZED_THEME:-dark} in
    light) bkg=white;;
    *)     bkg=black;;
esac

ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{${bkg}}%B%F{green}%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg[red]%} [%D %*] %{$reset_color%} %{%B%F{cyan}%}%!%{%f%k%b%}'
PROMPT='%{%f%k%b%}%{%K{${bkg}}%B%F{white}%}%n%{%B%F{green}%}@%{%B%F{red}%}%M %{%b%F{yellow}%K{${bkg}}%}%~%{%B%F{white}%}$(vcprompt -f "  "%n)%{%K%F{green}%}$(vcprompt -f " - "  )%{%K%F{red}%}$(vcprompt -f %b)%E%{%f%k%b%}
%{%B%F{yellow}%}👉 👉  %{%f%k%b%}'

