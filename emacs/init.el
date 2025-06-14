;;; editor options
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)
(delete-selection-mode t)

;;; global options
(global-display-line-numbers-mode t)
(global-auto-revert-mode t)

;;; editor variables
(setq inhibit-startup-screen t)
(setq kill-ring-max 10)
(setq display-line-numbers-type 'relative)
(setq ring-bell-function 'ignore)
(setq make-backup-files nil)
(setq confirm-kill-emacs 'y-or-n-p)
(setq delete-auto-save-files t)
(setq-default indent-tabs-mode nil
              indent-line-function 'insert-tab
              tab-width 4
              c-basic-offset tab-width)

(setq-default dired-dwim-target t)
(setq dired-listing-switches "-lah")

(ido-mode 1)
(ido-everywhere 1)

(setq custom-file ".emacs.custom.el")
(load-file custom-file)

;;; taken from https://github.com/rexim/dotfiles/blob/master/.emacs.rc/misc-rc.el
(defun duplicate-line-and-keep-cursor ()
  "Duplicate line and keep cursor position"
  (interactive)
  (let ((column (- (point) (pos-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'duplicate-line-and-keep-cursor)

;;; taken from https://stackoverflow.com/questions/28221079/ctrl-backspace-in-emacs-deletes-too-much
(defun custom-backward-kill-word()
  (interactive)
  (cond
   ((looking-back (rx (char word)) 1)
    (backward-kill-word 1))
   ((looking-back (rx (char blank)) 1)
    (delete-horizontal-space t))
   (t
    (backward-delete-char 1))))
  
(global-set-key (kbd "C-<backspace>") 'custom-backward-kill-word)

(defun custom-forward-kill-word()
  (interactive)
  (cond
   ((looking-at (rx (char word)) 1)
    (kill-word 1))
   ((looking-at (rx (char blank)) 1)
    (delete-horizontal-space))
   (t
    (delete-char 1))))

(global-set-key (kbd "M-d") 'custom-forward-kill-word)

;;; load theme
;; (load-theme 'solarized-dark)

;;; set font
;; (set-frame-font "Iosevka 18")

;;; external packages
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (require 'move-text)
;; (global-set-key (kbd "M-p") 'move-text-up)
;; (global-set-key (kbd "M-n") 'move-text-down)
;; (global-set-key (kbd "M-<up>") 'move-text-up)
;; (global-set-key (kbd "M-<down>") 'move-text-down)

;; (require 'multiple-cursors)
;; (global-set-key (kbd "C-c C-.") 'mc/edit-lines)
;; (global-set-key (kbd "C->") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

;; (require 'smex)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "C-c C-x") 'execute-extended-command)

