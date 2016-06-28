# pyenv initialization hook
#
# You can use the following variables in this file:
# * $package       package name
# * $path          package path
# * $dependencies  package dependencies
function init -a path --on-event init_pyenv
  if type -q fenv
    set -q PYENV_ROOT; or set -gx PYENV_ROOT ~/.pyenv 
    set -g pyenv_prefix $PYENV_ROOT

    type -q brew;
      and test -e (brew --prefix)/Cellar/pyenv/20160509;
        and set -g pyenv_prefix (brew --prefix pyenv)

    fenv eval $pyenv_prefix/bin/pyenv init - >/dev/null ^&1
  end
end

