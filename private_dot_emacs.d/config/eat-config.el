;;; eat-config.el --- Terminal configuration using Eat -*- lexical-binding: t; -*-

;;; Commentary:
;; This file contains custom functions for toggling a bottom terminal
;; and spawning unique full-screen terminal instances using Eat.

;;; Code:

(use-package eat
  :straight t
  :config
  ;; 1. Toggle function for the primary terminal pane
  (defun my/toggle-eat-terminal ()
    "Toggle the primary horizontal 'eat' terminal at the bottom."
    (interactive)
    (let* ((eat-buffer-name "*eat*")
           (eat-window (get-buffer-window eat-buffer-name)))
      (if eat-window
          (delete-window eat-window)
        (progn
          (split-window-below -10)
          (other-window 1)
          (if (get-buffer eat-buffer-name)
              (switch-to-buffer eat-buffer-name)
            (eat))))))

  ;; 2. Function to open a NEW, unique full-screen terminal
  (defun my/open-eat-full-unique ()
    "Create a new, uniquely named '*eat-full*' terminal with a brief delay for initialization."
    (interactive)
    (delete-other-windows)
    (let ((current-buf (eat))) ;; eat returns the buffer it creates
      (run-at-time "0.1 sec" nil
                   (lambda (buf)
                     (when (buffer-live-p buf)
                       (with-current-buffer buf
                         (rename-buffer (generate-new-buffer-name "*eat-full*") t))))
                   current-buf)))

  ;; 3. Safe exit cleanup
  (defun my/eat-exit-and-close-pane (process)
    "Kill the buffer and delete the window when the eat process exits, safely."
    (let ((buffer (process-buffer process)))
      (when (buffer-live-p buffer)
        (let ((window (get-buffer-window buffer)))
          ;; Only delete the window if it's NOT the only one in the frame
          (when (and window (not (one-window-p)))
            (delete-window window))
          ;; Always kill the buffer to keep your buffer list clean
          (kill-buffer buffer)))))

  ;; Attach the function to the eat exit hook
  (add-hook 'eat-exit-hook #'my/eat-exit-and-close-pane))

(provide 'eat-config)

;;; eat-config.el ends here
