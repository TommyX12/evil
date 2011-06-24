;;;; Settings and variables

(defgroup evil nil
  "Extensible vi layer."
  :group 'emulations
  :prefix 'evil-)

(defcustom evil-shift-width 4
  "The offset used by \\<evil-normal-state-map>\\[evil-shift-right] \
and \\[evil-shift-left]."
  :type 'integer
  :group 'evil)

(defcustom evil-move-cursor-back t
  "Whether the cursor is moved backwards when exiting Insert state."
  :type 'boolean
  :group 'evil)

(defcustom evil-show-paren-range 0
  "The minimal distance between point and a parenthesis
which causes the parenthesis to be highlighted."
  :type 'integer
  :group 'evil)

(defcustom evil-find-skip-newlines nil
  "Whether \"f\", \"F\", \"t\" and \"T\" skip over newlines."
  :type 'boolean
  :group 'evil)

(defcustom evil-want-fine-undo nil
  "Whether commands like \"cw\" are undone in several steps."
  :type 'boolean
  :group 'evil)

(defcustom evil-repeat-move-cursor t
  "Whether \"\\<evil-normal-state-map>\\[evil-repeat]\" \
moves the cursor."
  :type 'boolean
  :group 'evil)

(defcustom evil-want-C-i-jump t
  "Whether \"C-i\" jumps forward like in Vim."
  :type 'boolean
  :group 'evil)

(defcustom evil-want-C-u-scroll nil
  "Whether \"C-u\" scrolls like in Vim."
  :type 'boolean
  :group 'evil)

(defcustom evil-flash-delay 2
  "Number of seconds to flash search matches."
  :type  'integer
  :group 'evil)

(defcustom evil-search-wrap t
  "Whether search wraps around."
  :type  'boolean
  :group 'evil)

(defcustom evil-regexp-search t
  "Whether to use regular expressions for searching."
  :type  'boolean
  :group 'evil)

(defcustom evil-auto-indent t
  "Whether to auto-indent when entering Insert state."
  :type  'boolean
  :group 'evil)

(defcustom evil-motions
  '(backward-char
    backward-list
    backward-paragraph
    backward-sentence
    backward-sexp
    backward-up-list
    backward-word
    beginning-of-buffer
    beginning-of-defun
    beginning-of-line
    beginning-of-visual-line
    digit-argument
    down-list
    end-of-buffer
    end-of-defun
    end-of-line
    end-of-visual-line
    exchange-point-and-mark
    forward-char
    forward-list
    forward-paragraph
    forward-sentence
    forward-sexp
    forward-word
    isearch-abort
    isearch-cancel
    isearch-complete
    isearch-del-char
    isearch-delete-char
    isearch-edit-string
    isearch-exit
    isearch-highlight-regexp
    isearch-occur
    isearch-other-control-char
    isearch-other-meta-char
    isearch-printing-char
    isearch-query-replace
    isearch-query-replace-regexp
    isearch-quote-char
    isearch-repeat-backward
    isearch-repeat-forward
    isearch-ring-advance
    isearch-ring-retreat
    isearch-toggle-case-fold
    isearch-toggle-input-method
    isearch-toggle-regexp
    isearch-toggle-specified-input-method
    isearch-toggle-word
    isearch-yank-char
    isearch-yank-kill
    isearch-yank-line
    isearch-yank-word-or-char
    keyboard-quit
    mouse-drag-region
    mouse-save-then-kill
    mouse-set-point
    mouse-set-region
    move-beginning-of-line
    move-end-of-line
    next-line
    previous-line
    scroll-down
    scroll-up
    undo
    universal-argument
    universal-argument-minus
    universal-argument-more
    universal-argument-other-key
    up-list)
  "Non-Evil commands to initialize to motions."
  :type  '(repeat symbol)
  :group 'evil)

;;; Variables

(defvar evil-state nil
  "The current Evil state.
To change the state, use `evil-change-state'
or call the state function (e.g., `evil-normal-state').")
(make-variable-buffer-local 'evil-state)

(defvar evil-modeline-tag nil
  "Modeline indicator for the current state.")
(make-variable-buffer-local 'evil-modeline-tag)

(defvar evil-global-keymaps-alist nil
  "Association list of keymap variables.
Entries have the form (MODE . KEYMAP), where KEYMAP
is the variable containing the keymap for MODE.")

(defvar evil-local-keymaps-alist nil
  "Association list of keymap variables that must be
reinitialized in each buffer. Entries have the form
\(MODE . KEYMAP), where KEYMAP is the variable containing
the keymap for MODE.")

(defvar evil-state-properties nil
  "Specifications made by `evil-define-state'.
Entries have the form (STATE . PLIST), where PLIST is a property
list specifying various aspects of the state. To access a property,
use `evil-state-property'.")

(defvar evil-mode-map-alist nil
  "Association list of keymaps to use for Evil modes.
Elements have the form (MODE . KEYMAP), with the first keymaps
having higher priority.")
(make-variable-buffer-local 'evil-mode-map-alist)

(defvar evil-command-properties nil
  "Specifications made by `evil-define-command'.")

(defvar evil-transient-vars '(transient-mark-mode)
  "List of variables pertaining to Transient Mark mode.")

(defvar evil-transient-vals nil
  "Association list of old values for Transient Mark mode variables.
Entries have the form (VARIABLE VALUE LOCAL), where LOCAL is
whether the variable was previously buffer-local.")

(defvar evil-locked-display nil
  "If non-nil, state changes are invisible.
Don't set this directly; use the macro
`evil-with-locked-display' instead.")
(make-variable-buffer-local 'evil-locked-display)

(defvar evil-type-properties nil
  "Specifications made by `evil-define-type'.
Entries have the form (TYPE . PLIST), where PLIST is a property
list specifying functions for handling the type: expanding it,
describing it, etc.")

(defvar evil-motion-marker nil
  "Marker for storing the starting position of a motion.")
(make-variable-buffer-local 'evil-motion-marker)

(defvar evil-this-type nil
  "Current motion type.")
(make-variable-buffer-local 'evil-this-type)

(defvar evil-this-register nil
  "Current register.")
(make-variable-buffer-local 'evil-this-register)

(defvar evil-this-macro nil
  "Current macro register.")
(make-variable-buffer-local 'evil-this-macro)

(defvar evil-last-macro nil
  "Last macro register.")
(make-variable-buffer-local 'evil-this-macro)

(defvar evil-this-operator nil
  "Current operator.")
(make-variable-buffer-local 'evil-this-operator)

(defvar evil-this-motion nil
  "Current motion.")
(make-variable-buffer-local 'evil-this-motion)

(defvar evil-this-motion-count nil
  "Current motion count.")
(make-variable-buffer-local 'evil-this-motion-count)

(defvar evil-inhibit-operator nil
  "Inhibit current operator.
If an operator calls a motion and the motion sets this variable
to t, the operator code is not executed.")

(defvar evil-markers-alist
  '((?\( . evil-backward-sentence)
    (?\) . evil-forward-sentence)
    (?{ . evil-backward-paragraph)
    (?} . evil-forward-paragraph)
    (?' . evil-jump-backward)
    (?` . evil-jump-backward))
  "Association list for markers.
Entries have the form (CHAR . DATA), where CHAR is the marker's
name and DATA is either a marker object as returned by
`make-marker', a movement function, or a cons cell (STRING NUMBER),
where STRING is a file path and NUMBER is a buffer position.
The global value of this variable holds markers available from every
buffer, while the buffer-local value holds markers available only in
the current buffer.")
(make-variable-buffer-local 'evil-markers-alist)

(defvar evil-jump-list nil
  "Jump list.")
(make-variable-buffer-local 'evil-jump-list)

(defconst evil-suppress-map (make-keymap)
  "Full keymap disabling default bindings to `self-insert-command'.")
(suppress-keymap evil-suppress-map t)

;; TODO: customize size of ring
(defvar evil-repeat-info-ring (make-ring 10)
  "A ring of repeat-informations to repeat the last command.")

(defvar evil-last-repeat nil
  "Information about the latest repeat command.
This is a list of two elements (POINT COUNT), where POINT is
the position of point before the latest repeat, and COUNT
the count-argument of the latest repeat command.")

(defvar evil-repeating-command nil
  "This variable is non-nil if a command is currently being repeated.")

(defvar evil-normal-repeat-info nil
  "Repeat information accumulated during Normal state.")

(defvar evil-insert-repeat-info nil
  "Repeat information accumulated during Insert state.")

(defvar evil-insert-repeat-type nil
  "The repeat-type of the current command. If set to 'change the
command will be recorded by tracking the changes, if set to nil
by tracking the key-sequences, if set to 'ignore the command is
ignored.")
(make-variable-buffer-local 'evil-insert-repeat-type)

(defvar evil-insert-repeat-point nil
  "The position of point at the beginning of an change-tracking
  editing command.")
(make-variable-buffer-local 'evil-insert-repeat-point)

(defvar evil-insert-repeat-changes nil
  "Accumulated buffer changes for changed based commands in
  insert-state.")
(make-variable-buffer-local 'evil-insert-repeat-changes)

(defvar evil-insert-repeat-types (make-hash-table :test 'eq)
  "The hash-table to hold the insert repeat type for each
  command.")

(defvar evil-command-modified-buffer nil
  "Non-nil if the current command modified the buffer, i.e., it
  is an editing command. This variable is used to detect editing
  command for repeating.")

(defvar evil-repeat-count nil
  "The explicit count when repeating a command.")

(defvar evil-insert-count nil
  "The explicit count passed to an command starting Insert state.")
(make-variable-buffer-local 'evil-insert-count)

(defvar evil-insert-vcount nil
  "The information about the number of following lines the
insertion should be repeated. This is list (LINE COLUMN COUNT)
where LINE is the line-number where the original insertion
started and COLUMN is either a number of function determining the
column where the repeated insertions should take place. COUNT is
number of repeats (including the original insertion).")
(make-variable-buffer-local 'evil-insert-vcount)

(defvar evil-insert-lines nil
  "Non-nil if the current insertion command is a line-insertion
command o or O.")
(make-variable-buffer-local 'evil-insert-lines)

(defvar evil-replace-alist nil
  "Association list of characters overwritten in Replace state.
The format is (POS . CHAR).")
(make-variable-buffer-local 'evil-replace-alist)

(defvar evil-echo-area-message nil
  "Previous value of `current-message'.")
(make-variable-buffer-local 'evil-echo-area-message)

(defvar evil-write-echo-area nil
  "If set to t inside `evil-save-echo-area', then the echo area
is not restored.")

(defvar evil-word "a-zA-Z0-9_"
  "The characters to be considered as a word.")

(defvar evil-last-find nil
  "A pair (FUNCTION . CHAR) describing the lastest character
  search command.")

(defvar evil-last-paste nil
  "Information about the latest paste.
This should be a list (CMD POINT BEG END) where CMD is the last
paste-command (either `evil-paste-before' or
`evil-paste-behind'), POINT is the position of point before the
paste, BEG end END are the region of the inserted text.")

(defvar evil-paste-count nil
  "The count argument of the current paste command.")

(defvar evil-temporary-undo nil
  "When undo is disabled in current buffer, certain commands
depending on undo use the variable instead of
`buffer-undo-list'.")

(defvar evil-visual-alist nil
  "Association list of Visual selections.
Elements have the form (NAME . FUNCTION).")

(defvar evil-visual-overlay nil
  "Overlay for Visual selection.
This stores the boundaries of the selection and its type.
It is also used for highlighting, unless the type is `block',
in which case see `evil-visual-block-overlays'.")
(make-variable-buffer-local 'evil-visual-overlay)

(defvar evil-visual-block-overlays nil
  "Overlays for Visual Block selection, one for each line.
They are reused to prevent flicker.")
(make-variable-buffer-local 'evil-visual-block-overlays)

(defvar evil-visual-region-expanded nil
  "Whether the region matches the Visual selection.")
(make-variable-buffer-local 'evil-visual-region-expanded)

(defvar evil-undo-list-pointer nil
  "Everything up to this mark is united in the undo-list.")
(make-variable-buffer-local 'evil-undo-list-pointer)

(defvar evil-flash-timer nil
  "Timer for flashing search results.")

(defvar evil-search-prompt nil
  "String to use for search prompt.")

(defvar evil-window-map (make-sparse-keymap)
  "Keymap for window-related commands.")

(defconst evil-version "0.1"
  "The current version of Evil")

(defun evil-version ()
  (interactive)
  (message "Evil version %s" evil-version))

(provide 'evil-vars)

;;; evil-vars.el ends here
