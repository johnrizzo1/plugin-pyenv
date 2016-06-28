#set commands (fenv eval $pyenv_prefix/bin/pyenv commands)
set commands --version commands completions exec global help hooks init \
             install local prefix rehash root shell shims uninstall \
             version version-file version-file-read version-file-write \
             version-name version-origin versions virtualenvwrapper \
             virtualenvwrapper_lazy whence which

function __pyenv_complete_install_l
  if not test "$__pyenv_install_l"
    set -g __pyenv_install_l (fenv eval $pyenv_prefix/bin/pyenv install -l\; pyenv_install_l)
  end

  printf "%s\n" (string trim -l -r $__pyenv_install_l)
end

function __pyenv_complete_versions
  if not test "$__pyenv_versions"
    set -g __pyenv_versions (fenv eval $pyenv_prefix/bin/pyenv versions --bare)
  end
  printf "%s\n" $__pyenv_versions
end

complete -c pyenv -f -d "Python Version Manager"

complete -c pyenv -f -n "__fish_seen_subcommand_from install"             -a "(__pyenv_complete_install_l)"
complete -c pyenv -f -n "__fish_seen_subcommand_from global"              -a "(__pyenv_complete_versions)"
complete -c pyenv -f -n "__fish_seen_subcommand_from local"               -a "(__pyenv_complete_versions)"
complete -c pyenv -f -n "__fish_seen_subcommand_from shell"               -a "(__pyenv_complete_versions)"
complete -c pyenv -f -n "__fish_seen_subcommand_from uninstall"           -a "(__pyenv_complete_versions)"

complete -c pyenv -f -n "__fish_use_subcommand" -a --version              -d "Show the Pyenv version"
complete -c pyenv -f -n "__fish_use_subcommand" -a commands               -d "List available commands"
complete -c pyenv -f -n "__fish_use_subcommand" -a completions            -d "Show list of available completions"
complete -c pyenv -f -n "__fish_use_subcommand" -a exec                   -d "Runs an executable by first preparing PATH so that the selected Python version's `bin' directory is at the front"
complete -c pyenv -f -n "__fish_use_subcommand" -a global                 -d "Set or show the global Python version"
complete -c pyenv -f -n "__fish_use_subcommand" -a help                   -d "Show help for a given command"
complete -c pyenv -f -n "__fish_use_subcommand" -a hooks                  -d "List hook scripts for a given pyenv command"
complete -c pyenv -f -n "__fish_use_subcommand" -a init                   -d "Configure the shell environment for pyenv"
complete -c pyenv -f -n "__fish_use_subcommand" -a install                -d "Install a Python version using python-build"
complete -c pyenv -f -n "__fish_use_subcommand" -a local                  -d "Set or show the local application-specific Python version"
complete -c pyenv -f -n "__fish_use_subcommand" -a prefix                 -d "Displays the directory where a Python version is installed"
complete -c pyenv -f -n "__fish_use_subcommand" -a rehash                 -d "Rehash pyenv shims \(run this after installing executables\)"
complete -c pyenv -f -n "__fish_use_subcommand" -a root                   -d "Display the root directory where versions and shims are kept"
complete -c pyenv -f -n "__fish_use_subcommand" -a shell                  -d "Set or show the shell-specific Python version"
complete -c pyenv -f -n "__fish_use_subcommand" -a shims                  -d "List existing pyenv shims"
complete -c pyenv -f -n "__fish_use_subcommand" -a uninstall              -d "Uninstall a specific Python version"
complete -c pyenv -f -n "__fish_use_subcommand" -a version                -d "Show the current Python version and its origin"
complete -c pyenv -f -n "__fish_use_subcommand" -a version-file           -d "Detect the file that sets the current pyenv version"
complete -c pyenv -f -n "__fish_use_subcommand" -a version-file-read      -d ""
complete -c pyenv -f -n "__fish_use_subcommand" -a version-file-write     -d ""
complete -c pyenv -f -n "__fish_use_subcommand" -a version-name           -d "Show the current Python version"
complete -c pyenv -f -n "__fish_use_subcommand" -a version-origin         -d "Explain how the current Python version is set"
complete -c pyenv -f -n "__fish_use_subcommand" -a versions               -d "List all Python versions available to pyenv"
complete -c pyenv -f -n "__fish_use_subcommand" -a virtualenvwrapper      -d "Setup virtualenvwrapper into current shell"
complete -c pyenv -f -n "__fish_use_subcommand" -a virtualenvwrapper_lazy -d "Setup virtualenvwrapper_lazy into current shell"
complete -c pyenv -f -n "__fish_use_subcommand" -a whence                 -d "List all Python versions that contain the given executable"
complete -c pyenv -f -n "__fish_use_subcommand" -a which                  -d "Display the full path to an executable"
