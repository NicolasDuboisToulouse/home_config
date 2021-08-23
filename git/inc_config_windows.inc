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

    ; Run emacs in a virtual tty
    editor = winpty emacs -nw

[credential]
    ; Store passwords on Windows
    helper = wincred

