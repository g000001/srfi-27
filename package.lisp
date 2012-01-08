;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :srfi-27
  (:use)
  (:export :random-integer
           :random-real
           :default-random-source
           :make-random-source
           :random-source?
           :random-source-state-ref
           :random-source-state-set!
           :random-source-randomize!
           :random-source-pseudo-randomize!
           :random-source-make-integers
           :random-source-make-reals ))

(defpackage :srfi-27.internal
  (:use :srfi-27 :cl :fiveam :srfi-9)
  (:shadowing-import-from :srfi-23 :error)
  (:shadow :lambda :loop :random))
