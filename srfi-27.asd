;;;; srfi-27.asd

(cl:in-package :asdf)

(defsystem :srfi-27
  :version "20200211"
  :description "SRFI 27 for CL: Sources of Random Bits"
  :long-description "SRFI 27 for CL: Sources of Random Bits
https://srfi.schemers.org/srfi-27"
  :author "Sebastian Egner"
  :maintainer "CHIBA Masaomi"
  :serial t
  :depends-on (:fiveam :srfi-23 :srfi-9)
  :components ((:file "package")
               (:file "util")
               (:file "srfi-27")
               (:file "mrg32k3a-a")
               (:file "mrg32k3a")
               (:file "conftest")))

(defmethod perform :after ((o load-op) (c (eql (find-system :srfi-27))))
  (let ((name "https://github.com/g000001/srfi-27")
        (nickname :srfi-27))
    (if (and (find-package nickname)
             (not (eq (find-package nickname)
                      (find-package name))))
        (warn "~A: A package with name ~A already exists." name nickname)
        (rename-package name name `(,nickname)))))


(defmethod perform ((o test-op) (c (eql (find-system :srfi-27))))
  (let ((*package*
         (find-package
          "https://github.com/g000001/srfi-27#internals")))
    (eval
     (read-from-string
      "
      (or (let ((result (run 'srfi-27)))
            (explain! result)
            (results-status result))
          (error \"test-op failed\") )"))))
