
(cl:in-package :asdf)

(defsystem "sudoku_fact_generator-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "grid_fact" :depends-on ("_package_grid_fact"))
    (:file "_package_grid_fact" :depends-on ("_package"))
  ))