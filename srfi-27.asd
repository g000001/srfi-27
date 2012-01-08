;;;; srfi-27.asd

(cl:in-package :asdf)

(defsystem :srfi-27
  :serial t
  :depends-on (:fiveam :srfi-23 :srfi-9)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-27")
               (:file "mrg32k3a-a")
               (:file "mrg32k3a")
               (:file "conftest")))

(defmethod perform ((o test-op) (c (eql (find-system :srfi-27))))
  (load-system :srfi-27)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :srfi-27.internal :srfi-27))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))
