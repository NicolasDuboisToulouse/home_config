;
; git configuration for windows
;

[core]
    ; ignore case on Windows
    ignorecase = true
    ; ignore filemode on Windows
    filemode = false

[credential]
    ; Store passwords on Windows
    helper = wincred

    ; Windows dif/merge tool
[merge]
    tool = kdiff3
[diff]
    guitool = kdiff3


