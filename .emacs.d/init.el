;; 2019-11-27
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(require 'package)
(package-initialize)
(setq package-archives '(("melpa-cn"."https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu-cn"."https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu")
			 ("org"."https://orgmode.org/elpa/")))

(require 'cl)

(setenv "HOME" "D:/emacs-26.3-x86_64")
(setenv "PATH" "D:/emacs-26.3-x86_64")
(setq default-directory "D:/code/c")

;; 隐藏 splash-screen 和 startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; 全屏，无标题栏
;;(setq initial-frame-alist (quote ((fullscreen . maximized))))
(toggle-frame-fullscreen)

;; 关闭菜单、工具栏、滚动条 F10 可以打开菜单
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; 光标形态
(setq-default cursor-type 'bar)

;; 高亮当前行
(global-hl-line-mode t)

;; 在 Powerline 上显示行列号
(line-number-mode t)
(column-number-mode t)

;; 显示时间 设置24小时 显示日期
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;; 解决显示中文字符时 CPU 占用过高的问题
(setq inhibit-compacting-font-caches t)
(set-language-environment "UTF-8")

(when (eq system-type 'windows-nt)
  (setq gc-cons-threshold (* 512 1024 1024))
  (setq gc-cons-percentage 0.5)
  (run-with-idle-timer 5 t #'garbage-collect))

(add-to-list 'default-frame-alist
	     '(font . "Source Code Pro-10"))

;; 简化 yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; 自动填充
(setq-default auto-fill-function 'do-auto-fill)

;; TAB 键
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)

;; 不生成备份文件
(setq-default make-backup-files nil)

(delete-selection-mode t)



;; 主题
(load-theme 'solarized-dark t)

(require 'smartparens-config)
(show-smartparens-global-mode +1)
(turn-on-smartparens-mode)
(turn-on-show-smartparens-mode)
(smartparens-mode)
(smartparens-global-mode t)


;; 分层高亮
(require 'highlight-parentheses)

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

(require 'anzu)
(global-anzu-mode +1)
(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow" :weight 'bold)


(define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
(define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)


(require 'hungry-delete)

(require 'recentf)


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; 边栏目录树自动扩展为当前文件所在目录
(setq neo-smart-open t)

;; 模板系统
(require 'yasnippet)
(yas-global-mode 1)



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-linum-mode t)
(global-company-mode t)

(recentf-mode t)
(turn-on-smartparens-mode)
(turn-on-show-smartparens-mode)
(turn-on-hungry-delete-mode)
(color-identifiers-mode)
(smartparens-mode)
(turn-on-font-lock)
(rainbow-identifiers-mode)
(rainbow-delimiters-mode)


;; 最近打开文件 快捷键定义为 C-x C-r
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

; 设置时间戳，标识出最后一次保存文件的时间
(setq time-stamp-active t)
(setq time-stamp-warn-inactive t)
(setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S Lonely")

;; C language setting
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "K&R")
             (turn-on-smartparens-strict-mode)
             (color-identifiers-mode)
	     (imenu-add-menubar-index)
	     (which-function-mode)
             (smartparens-mode)
             (turn-on-font-lock)
             (rainbow-identifiers-mode)
             (rainbow-delimiters-mode)
             (c-toggle-auto-state)
             (c-toggle-hungry-state)
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq highlight-parentheses-mode t)
             (setq c-basic-offset 4)))

;; C++ language setting
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "K&R")
             (turn-on-smartparens-strict-mode)
             (color-identifiers-mode)
             (smartparens-mode)
             (turn-on-font-lock)
             (rainbow-identifiers-mode)
             (rainbow-delimiters-mode)
             (c-toggle-auto-state)
             (c-toggle-hungry-state)
             (setq tab-width 4)
             (setq indent-tabs-mode t)
             (setq highlight-parentheses-mode t)
             (setq c-basic-offset 4)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smex color-identifiers-mode rainbow-identifiers helm helm-descbinds helm-flx highlight-numbers anzu auto-highlight-symbol highlight-parentheses clang-format company-c-headers company-ctags company-ycmd helm-cscope helm-gtags ggtags swiper counsel hungry-delete ivy popwin solarized-theme powerline smartparens neotree company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
