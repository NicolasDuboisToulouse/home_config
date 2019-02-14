@set COMMAND_FX=C:\Program Files\AsciidocFX\AsciidocFX.exe
@set COMMAND_EMACS=C:\local\emacs\bin\runemacs.exe

@powershell %~dp0\context_menu_add.ps1 -file .adoc -action_name AsciidocFX_edit -action_cmd '%COMMAND_FX%' -action_label 'Edit (AsciidocFX)' -action_icon 'C:\Program Files\AsciidocFX\AsciidocFX.exe'

@powershell %~dp0\context_menu_add.ps1 -file .adoc -action_name Emacs_edit -action_cmd '%COMMAND_EMACS%' -action_label 'Edit (emacs)' -action_icon '%COMMAND_EMACS%' -default




pause
