# PATH setup
let path_list = ($env.PATH | split row (char esep))

load-env {
  PATH: ($path_list
    | prepend $"($env.HOME)/.local/bin"
    | prepend $"($env.HOME)/.cargo/bin"
    | prepend $"($env.HOME)/go/bin"
    | prepend "/usr/local/go/bin"
    | str join (char esep))
}

# Starship prompt
load-env {
  STARSHIP_SHELL: "nu"
  PROMPT_COMMAND: {|| starship prompt }
  PROMPT_INDICATOR: {|| "" }
  PROMPT_MULTILINE_INDICATOR: {|| "::: " }
  PROMPT_COMMAND_RIGHT: {|| "" }
}

# Aliases as functions
def --env anki [] {
  ~/.local/anki/anki-launcher-25.07.5-linux/anki
}

def --env tp [] {
  fd -t d . $env.HOME | fzf | path expand | cd $in
}

def --env cdf [] {
  fd -t d . | fzf | path expand | cd $in
}

