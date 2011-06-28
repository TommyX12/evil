;;;; Default keymaps

(require 'evil-states)
(require 'evil-visual)
(require 'evil-motions)
(require 'evil-insert)
(require 'evil-operators)
(require 'evil-replace)

;;; Normal state

(define-key evil-normal-state-map "a" 'evil-append)
(define-key evil-normal-state-map "A" 'evil-append-line)
(define-key evil-normal-state-map "c" 'evil-change)
(define-key evil-normal-state-map "C" 'evil-change-line)
(define-key evil-normal-state-map "d" 'evil-delete)
(define-key evil-normal-state-map "D" 'evil-delete-line)
(define-key evil-normal-state-map "i" 'evil-insert)
(define-key evil-normal-state-map "I" 'evil-insert-line)
(define-key evil-normal-state-map "J" 'evil-join)
(define-key evil-normal-state-map "m" 'evil-set-marker)
(define-key evil-normal-state-map "o" 'evil-open-below)
(define-key evil-normal-state-map "O" 'evil-open-above)
(define-key evil-normal-state-map "p" 'evil-paste-behind)
(define-key evil-normal-state-map "P" 'evil-paste-before)
(define-key evil-normal-state-map "q" 'evil-record-macro)
(define-key evil-normal-state-map "r" 'evil-replace)
(define-key evil-normal-state-map "R" 'evil-replace-state)
(define-key evil-normal-state-map "s" 'evil-substitute)
(define-key evil-normal-state-map "v" 'evil-visual-char)
(define-key evil-normal-state-map "V" 'evil-visual-line)
(define-key evil-normal-state-map "x" 'evil-delete-char)
(define-key evil-normal-state-map "X" 'evil-delete-backward-char)
(define-key evil-normal-state-map "y" 'evil-yank)
(define-key evil-normal-state-map "Y" 'evil-yank-line)
(define-key evil-normal-state-map "g8" 'what-cursor-position)
(define-key evil-normal-state-map "ga" 'what-cursor-position)
(define-key evil-normal-state-map "gi" 'evil-insert-resume)
(define-key evil-normal-state-map "gJ" 'evil-join-whitespace)
(define-key evil-normal-state-map "gq" 'evil-fill)
(define-key evil-normal-state-map "gu" 'evil-downcase)
(define-key evil-normal-state-map "gU" 'evil-upcase)
(define-key evil-normal-state-map "gv" 'evil-visual-restore)
(define-key evil-normal-state-map "g?" 'evil-rot13)
(define-key evil-normal-state-map "g~" 'evil-invert-case)
(define-key evil-normal-state-map "\C-n" 'evil-paste-pop-next)
(define-key evil-normal-state-map "\C-p" 'evil-paste-pop)
(define-key evil-normal-state-map "\C-t" 'pop-tag-mark)
(define-key evil-normal-state-map "\C-v" 'evil-visual-block)
(define-key evil-normal-state-map "\C-w" 'evil-window-map)
(define-key evil-normal-state-map "\C-z" 'evil-emacs-state)
(define-key evil-normal-state-map (kbd "C-.") 'evil-repeat-pop)
(define-key evil-normal-state-map (kbd "M-.") 'evil-repeat-pop-next)
(define-key evil-normal-state-map "." 'evil-repeat)
(define-key evil-normal-state-map "@" 'evil-execute-macro)
(define-key evil-normal-state-map "\"" 'evil-use-register)
(define-key evil-normal-state-map "~" 'evil-invert-char)
(define-key evil-normal-state-map "=" 'evil-indent)
(define-key evil-normal-state-map "<" 'evil-shift-left)
(define-key evil-normal-state-map ">" 'evil-shift-right)
(define-key evil-normal-state-map (kbd "ESC") 'evil-normal-state)

;; undo
(define-key evil-normal-state-map "u" 'undo)

(when (fboundp 'undo-tree-undo)
  (define-key evil-normal-state-map "u" 'undo-tree-undo)
  (define-key evil-normal-state-map "\C-r" 'undo-tree-redo))

;; window commands
(define-prefix-command 'evil-window-map)
(define-key evil-window-map "b" 'evil-window-bottom-right)
(define-key evil-window-map "c" 'delete-window)
(define-key evil-window-map "h" 'evil-window-left)
(define-key evil-window-map "H" 'evil-window-move-far-left)
(define-key evil-window-map "j" 'evil-window-down)
(define-key evil-window-map "J" 'evil-window-move-very-bottom)
(define-key evil-window-map "k" 'evil-window-up)
(define-key evil-window-map "K" 'evil-window-move-very-top)
(define-key evil-window-map "l" 'evil-window-right)
(define-key evil-window-map "L" 'evil-window-move-far-right)
(define-key evil-window-map "n" 'evil-window-new)
(define-key evil-window-map "o" 'delete-other-windows)
(define-key evil-window-map "p" 'evil-window-lru)
(define-key evil-window-map "r" 'evil-window-rotate-downwards)
(define-key evil-window-map "R" 'evil-window-rotate-upwards)
(define-key evil-window-map "s" 'split-window-vertically)
(define-key evil-window-map "S" 'split-window-vertically)
(define-key evil-window-map "t" 'evil-window-top-left)
(define-key evil-window-map "v" 'split-window-horizontally)
(define-key evil-window-map "w" 'evil-window-next)
(define-key evil-window-map "W" 'evil-window-prev)
(define-key evil-window-map "+" 'evil-window-increase-height)
(define-key evil-window-map "-" 'evil-window-decrease-height)
(define-key evil-window-map "_" 'evil-window-set-height)
(define-key evil-window-map "<" 'evil-window-decrease-width)
(define-key evil-window-map ">" 'evil-window-increase-width)
(define-key evil-window-map "=" 'balance-windows)
(define-key evil-window-map "|" 'evil-window-set-width)
(define-key evil-window-map "\C-b" 'evil-window-bottom-right)
(define-key evil-window-map "\C-c" 'delete-window)
(define-key evil-window-map "\C-h" 'evil-window-left)
(define-key evil-window-map "\C-H" 'evil-window-move-far-left)
(define-key evil-window-map "\C-j" 'evil-window-down)
(define-key evil-window-map "\C-J" 'evil-window-move-very-bottom)
(define-key evil-window-map "\C-k" 'evil-window-up)
(define-key evil-window-map "\C-K" 'evil-window-move-very-top)
(define-key evil-window-map "\C-l" 'evil-window-right)
(define-key evil-window-map "\C-L" 'evil-window-move-far-right)
(define-key evil-window-map "\C-n" 'evil-window-new)
(define-key evil-window-map "\C-o" 'delete-other-windows)
(define-key evil-window-map "\C-p" 'evil-window-lru)
(define-key evil-window-map "\C-r" 'evil-window-rotate-downwards)
(define-key evil-window-map "\C-R" 'evil-window-rotate-upwards)
(define-key evil-window-map "\C-s" 'split-window-vertically)
(define-key evil-window-map "\C-S" 'split-window-vertically)
(define-key evil-window-map "\C-t" 'evil-window-top-left)
(define-key evil-window-map "\C-v" 'split-window-horizontally)
(define-key evil-window-map "\C-w" 'evil-window-next)
(define-key evil-window-map "\C-W" 'evil-window-prev)
(define-key evil-window-map "\C-_" 'evil-window-set-height)

;;; Motion state

;; "0" is a special command when called first
(evil-redirect-digit-argument evil-motion-state-map "0" 'evil-beginning-of-line)
(define-key evil-motion-state-map "1" 'digit-argument)
(define-key evil-motion-state-map "2" 'digit-argument)
(define-key evil-motion-state-map "3" 'digit-argument)
(define-key evil-motion-state-map "4" 'digit-argument)
(define-key evil-motion-state-map "5" 'digit-argument)
(define-key evil-motion-state-map "6" 'digit-argument)
(define-key evil-motion-state-map "7" 'digit-argument)
(define-key evil-motion-state-map "8" 'digit-argument)
(define-key evil-motion-state-map "9" 'digit-argument)
(define-key evil-motion-state-map "b" 'evil-backward-word-begin)
(define-key evil-motion-state-map "B" 'evil-backward-WORD-begin)
(define-key evil-motion-state-map "e" 'evil-forward-word-end)
(define-key evil-motion-state-map "E" 'evil-forward-WORD-end)
(define-key evil-motion-state-map "f" 'evil-find-char)
(define-key evil-motion-state-map "F" 'evil-find-char-backward)
(define-key evil-motion-state-map "G" 'evil-goto-line)
(define-key evil-motion-state-map "h" 'evil-backward-char)
(define-key evil-motion-state-map "H" 'evil-window-top)
(define-key evil-motion-state-map "j" 'evil-next-line)
(define-key evil-motion-state-map "k" 'evil-previous-line)
(define-key evil-motion-state-map "l" 'evil-forward-char)
(define-key evil-motion-state-map "L" 'evil-window-bottom)
(define-key evil-motion-state-map "M" 'evil-window-middle)
(define-key evil-motion-state-map "n" 'evil-search-next)
(define-key evil-motion-state-map "N" 'evil-search-previous)
(define-key evil-motion-state-map "t" 'evil-find-char-to)
(define-key evil-motion-state-map "T" 'evil-find-char-to-backward)
(define-key evil-motion-state-map "w" 'evil-forward-word-begin)
(define-key evil-motion-state-map "W" 'evil-forward-WORD-begin)
(define-key evil-motion-state-map "gd" 'evil-goto-definition)
(define-key evil-motion-state-map "ge" 'evil-backward-word-end)
(define-key evil-motion-state-map "gE" 'evil-backward-WORD-end)
(define-key evil-motion-state-map "gg" 'evil-goto-first-line)
(define-key evil-motion-state-map "gj" 'evil-next-visual-line)
(define-key evil-motion-state-map "gk" 'evil-previous-visual-line)
(define-key evil-motion-state-map "g0" 'evil-beginning-of-visual-line)
(define-key evil-motion-state-map "g_" 'evil-last-non-blank)
(define-key evil-motion-state-map "g^" 'evil-first-non-blank-of-visual-line)
(define-key evil-motion-state-map "g$" 'evil-end-of-visual-line)
(define-key evil-motion-state-map "{" 'evil-backward-paragraph)
(define-key evil-motion-state-map "}" 'evil-forward-paragraph)
(define-key evil-motion-state-map "#" 'evil-search-symbol-backward)
(define-key evil-motion-state-map "$" 'evil-end-of-line)
(define-key evil-motion-state-map "%" 'evil-jump-item)
(define-key evil-motion-state-map "`" 'evil-goto-mark)
(define-key evil-motion-state-map "'" 'evil-goto-mark-line)
(define-key evil-motion-state-map "(" 'evil-backward-sentence)
(define-key evil-motion-state-map ")" 'evil-forward-sentence)
(define-key evil-motion-state-map "*" 'evil-search-symbol-forward)
(define-key evil-motion-state-map "," 'evil-repeat-find-char-reverse)
(define-key evil-motion-state-map "/" 'evil-search-forward)
(define-key evil-motion-state-map ";" 'evil-repeat-find-char)
(define-key evil-motion-state-map "?" 'evil-search-backward)
(define-key evil-motion-state-map "^" 'evil-first-non-blank)
(define-key evil-motion-state-map "+" 'evil-next-line-first-non-blank)
(define-key evil-motion-state-map "_" 'evil-next-line-first-non-blank)
(define-key evil-motion-state-map "-" 'evil-previous-line-first-non-blank)
(define-key evil-motion-state-map "\C-]" 'evil-jump-to-tag)
(define-key evil-motion-state-map "aw" 'evil-a-word)
(define-key evil-motion-state-map "iw" 'evil-inner-word)
(define-key evil-motion-state-map "aW" 'evil-a-WORD)
(define-key evil-motion-state-map "iW" 'evil-inner-WORD)
(define-key evil-motion-state-map "as" 'evil-a-sentence)
(define-key evil-motion-state-map "is" 'evil-inner-sentence)
(define-key evil-motion-state-map "ap" 'evil-a-paragraph)
(define-key evil-motion-state-map "ip" 'evil-inner-paragraph)
(define-key evil-motion-state-map "ab" 'evil-a-paren)
(define-key evil-motion-state-map "a(" 'evil-a-paren)
(define-key evil-motion-state-map "a)" 'evil-a-paren)
(define-key evil-motion-state-map "ib" 'evil-inner-paren)
(define-key evil-motion-state-map "i(" 'evil-inner-paren)
(define-key evil-motion-state-map "i)" 'evil-inner-paren)
(define-key evil-motion-state-map "a[" 'evil-a-bracket)
(define-key evil-motion-state-map "a]" 'evil-a-bracket)
(define-key evil-motion-state-map "i[" 'evil-inner-bracket)
(define-key evil-motion-state-map "i]" 'evil-inner-bracket)
(define-key evil-motion-state-map "aB" 'evil-a-curly)
(define-key evil-motion-state-map "a{" 'evil-a-curly)
(define-key evil-motion-state-map "a}" 'evil-a-curly)
(define-key evil-motion-state-map "iB" 'evil-inner-curly)
(define-key evil-motion-state-map "i{" 'evil-inner-curly)
(define-key evil-motion-state-map "i}" 'evil-inner-curly)
(define-key evil-motion-state-map "a<" 'evil-an-angle)
(define-key evil-motion-state-map "a>" 'evil-an-angle)
(define-key evil-motion-state-map "i<" 'evil-inner-angle)
(define-key evil-motion-state-map "i>" 'evil-inner-angle)
(define-key evil-motion-state-map "a'" 'evil-a-single-quote)
(define-key evil-motion-state-map "i'" 'evil-inner-single-quote)
(define-key evil-motion-state-map "a\"" 'evil-a-double-quote)
(define-key evil-motion-state-map "i\"" 'evil-inner-double-quote)
(define-key evil-motion-state-map "a`" 'evil-a-back-quote)
(define-key evil-motion-state-map "i`" 'evil-inner-back-quote)
(define-key evil-motion-state-map "at" 'evil-a-tag)
(define-key evil-motion-state-map "it" 'evil-inner-tag)
(define-key evil-motion-state-map (kbd "C-b") 'evil-scroll-page-up)
(define-key evil-motion-state-map (kbd "C-d") 'evil-scroll-down)
(define-key evil-motion-state-map (kbd "C-e") 'evil-scroll-line-down)
(define-key evil-motion-state-map (kbd "C-f") 'evil-scroll-page-down)
(define-key evil-motion-state-map (kbd "C-o") 'evil-jump-backward)
(define-key evil-motion-state-map (kbd "C-y") 'evil-scroll-line-up)
(define-key evil-motion-state-map "z^" 'evil-scroll-top-line-to-bottom)
(define-key evil-motion-state-map "z+" 'evil-scroll-bottom-line-to-top)
(define-key evil-motion-state-map "zt" 'evil-scroll-line-to-top)
;; TODO: z RET has an advanced form taking an count before the RET
;; but this requires again a special state with a single command
;; bound to RET
(define-key evil-motion-state-map (vconcat "z" [return]) "zt^")
(define-key evil-motion-state-map (kbd "z RET") (vconcat "z" [return]))
(define-key evil-motion-state-map "zz" 'evil-scroll-line-to-center)
(define-key evil-motion-state-map "z." "zz^")
(define-key evil-motion-state-map "zb" 'evil-scroll-line-to-bottom)
(define-key evil-motion-state-map "z-" "zb^")

(when evil-want-C-i-jump
  (define-key evil-motion-state-map (kbd "C-i") 'evil-jump-forward))

(when evil-want-C-u-scroll
  (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up))

;;; Visual state

(define-key evil-visual-state-map "A" 'evil-append)
(define-key evil-visual-state-map "C" 'evil-change)
(define-key evil-visual-state-map "D" 'evil-delete)
(define-key evil-visual-state-map "I" 'evil-insert)
(define-key evil-visual-state-map "o" 'exchange-point-and-mark)
(define-key evil-visual-state-map "O" 'evil-visual-exchange-corners)
(define-key evil-visual-state-map "R" 'evil-change)
(define-key evil-visual-state-map "S" 'evil-change)
(define-key evil-visual-state-map "u" 'evil-downcase)
(define-key evil-visual-state-map "U" 'evil-upcase)
(define-key evil-visual-state-map (kbd "ESC") 'evil-normal-state)

;;; Insert state

(define-key evil-insert-state-map "\C-k" 'evil-insert-digraph)
(define-key evil-insert-state-map "\C-o" 'evil-execute-in-normal-state)
(define-key evil-insert-state-map "\C-y" 'evil-copy-from-above)
(define-key evil-insert-state-map "\C-e" 'evil-copy-from-below)
(define-key evil-insert-state-map "\C-p" 'evil-complete)
(define-key evil-insert-state-map "\C-n" 'evil-complete)
(define-key evil-insert-state-map "\C-x\C-p" 'evil-complete-line)
(define-key evil-insert-state-map "\C-x\C-n" 'evil-complete-line)
(define-key evil-insert-state-map (kbd "ESC") 'evil-normal-state)

(when evil-auto-indent
  (define-key evil-insert-state-map (kbd "RET") 'newline-and-indent))

;;; Replace state

(define-key evil-replace-state-map [backspace] 'evil-replace-backspace)
(define-key evil-replace-state-map (kbd "ESC") 'evil-normal-state)

;;; Emacs state

(define-key evil-emacs-state-map "\C-z" 'evil-normal-state)

(provide 'evil-maps)

;;; evil-maps.el ends here
