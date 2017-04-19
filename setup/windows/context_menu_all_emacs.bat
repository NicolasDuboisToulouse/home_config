@set COMMAND="C:\local\emacs-24.3\bin\runemacs.exe \"%%%%1\""

@call %~dp0\context_menu_add.cmd * Emacs %COMMAND% "Edit with Emacs"

