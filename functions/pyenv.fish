function pyenv -d 'Python Version Mananger'
  if test -e $pyenv_prefix/bin/pyenv
    if not type -q fenv
      echo "You need to install foreign-env plugin"
      return 1
    end

    fenv eval $pyenv_prefix/bin/pyenv $argv
  else
    echo "You need to install pyenv"
    return 1
  end
end
