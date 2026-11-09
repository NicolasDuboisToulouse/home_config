set TARGET_HOME=%1

mklink %TARGET_HOME%\.inputrc      %TARGET_HOME%\.config\shell\inputrc
mklink %TARGET_HOME%\.bashrc       %TARGET_HOME%\.config\shell\bashrc
mklink %TARGET_HOME%\.profile      %TARGET_HOME%\.config\shell\profile
mklink %TARGET_HOME%\.bash_profile %TARGET_HOME%\.config\shell\profile
mklink %TARGET_HOME%\.gitconfig    %TARGET_HOME%\.config\git\config_windows
mklink %TARGET_HOME%\.emacs        %TARGET_HOME%\.config\emacs\dot_emacs


pause
