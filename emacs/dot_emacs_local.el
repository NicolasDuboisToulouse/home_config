; May be used with something like CNTLM
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
        ("http" . "localhost:3128")
        ("https" . "localhost:3128")))

(setq network-security-level "low")

;; This not seems to works ...
; (setq url-http-proxy-basic-auth-storage
;       (list (list "HOST:3128"
;                   (cons "Input your LDAP UID !"
;                         (base64-encode-string "USER:PASSWORD")))))


;; Define a local elpa package archives
;(setq package-archives '(("myelpa" . "~/.config/emacs/local_elpa/archives")))
;(setq local-elpa-packages t)
