;
; Base git configuration
;

[user]
    ; Default user with invalid email
    email = nicolasdubois@not.an.email.net
    name = Nicolas Dubois

[fetch]
    ; hold local reference for remote deleted branches
    ; we have to explicitelly call git remote prune origin
    prune = false

[pull]
    ; Alway try to rebase on pull to prevent useless merge
    rebase = true

[push]
    ; Only push the working branch
    default = simple

[rebase]
    ; no automatic stash on rebase (this is the default)
    autoStash = false

[color]
    ; Use color is terminal support it
    ui = auto

[core]
    ; global gitignore (not per project)
    excludesfile = ~/.config/git/gitignore
    ; hooks
    hooksPath = ~/.config/git/hooks

[alias]
    tree = log --graph --decorate --pretty=oneline --abbrev-commit
    show-files = diff-tree --no-commit-id --name-only -r
    fetchp = fetch --prune --prune-tags
