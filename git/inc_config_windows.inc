;
; git configuration for windows
;

[core]
    ; ignore case on Windows
    ignorecase = true
    ; ignore filemode on Windows
    filemode = false
    ; Crlf handling
    autocrlf = input
    safecrlf = false
    ;nicer diff
    pager=less -r

    ; Run emacs in a virtual tty
    editor = emacs

[credential]
    ; Store passwords on Windows
    helper = wincred
