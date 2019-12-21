创建
C:\Users\Lonely\AppData\Roaming\.emacs.d\init.el
内容如下：

;; Without this comment emacs25 adds (package-initialize) here
;; (package-initialize)

(setenv "HOME" "D:/emacs-26.3-x86_64")
(setenv "PATH" "D:/emacs-26.3-x86_64")
(setq default-directory "~/")
(load-file "D:/emacs-26.3-x86_64/.emacs.d/init.el")

下载 spacemacs，解压，重命名为 .emacs.d，放置到 D:\emacs-26.3-x86_64


Emacs就按如下方式来查找配置文件：

    如果设置了HOME环境变量，那么就用它的值作为home目录~
    如果存在注册表键值HKCU\SOFTWARE\GNU\Emacs\HOME，就用它的值作为home目录~
    如果存在注册表键值HKLM\SOFTWARE\GNU\Emacs\HOME，就用它的值作为home目录~（和2的区别是，2只是针对当前用户的注册表路径，3则是针对所有用户）
    如果存在C:\.emacs，就用C:\作为home目录~
    如果以上都不存在的话，就使用<system root>\Users\<user name>\AppData\Roaming作为home目录~（对于XP和较早windows用户，需要到Documents and Settings目录下去找）
