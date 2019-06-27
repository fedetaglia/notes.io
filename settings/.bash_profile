[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PS1='\w \$ '

# Brackets needed around non-printable characters in PS1
ps1_blue="$blue"
ps1_green="$green"
ps1_white="$white"
ps1_yellow="$yellow"

function parse_git_color {
    local git_status="$(git status 2> /dev/null)"
    local has_changes="Changes to be committed"
    local changes_not_staged="not staged"
    local untracked="Untracked"
    local nothing_to_commit="nothing to commit"

    if [[ $git_status =~ $has_changes ]]
    then
        echo -e "${ps1_yellow}"
    elif [[ $git_status =~ $changes_not_staged ]]
    then
        echo -e "${ps1_yellow}"
    elif [[ $git_status =~ $untracked ]]
    then
        echo -e "${ps1_yellow}"
    elif [[ $git_status =~ $nothing_to_commit ]]
    then
        echo -e "${ps1_green}"
    else
        echo -e "${ps1_green}"
    fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  else
    echo " "
  fi
}

export PS1="\W\$(parse_git_color)\$(git_branch)$ps1_white\$ "
