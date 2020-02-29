;;;; package.lisp

(cl:in-package :cl-user)


(defpackage "https://github.com/g000001/srfi-27"
  (:use)
  (:export random-integer
           random-real
           default-random-source
           make-random-source
           random-source?
           random-source-state-ref
           random-source-state-set!
           random-source-randomize!
           random-source-pseudo-randomize!
           random-source-make-integers
           random-source-make-reals ))


(defpackage "https://github.com/g000001/srfi-27#internals"
  (:use "https://github.com/g000001/srfi-27"
        "https://github.com/g000001/srfi-9"
        cl
        fiveam)
  (:shadowing-import-from
   "https://github.com/g000001/srfi-23" error)
  (:shadow lambda loop random))


(cl:in-package "https://github.com/g000001/srfi-27")


(cl:declaim
 (cl:special default-random-source)
 (cl:ftype cl:function
           make-random-source
           random-integer
           random-real
           random-source-make-integers
           random-source-make-reals
           random-source-pseudo-randomize!
           random-source-randomize!
           random-source-state-ref
           random-source-state-set!
           random-source?))


(cl:in-package "https://github.com/g000001/srfi-27#internals")


(cl:declaim
 (cl:special mrg32k3a-generators
             mrg32k3a-initial-state
             mrg32k3a-m-max)
 (cl:ftype cl:function
           $random-source-make
           $random-source-make-integers
           $random-source-make-reals
           $random-source-pseudo-randomize!
           $random-source-randomize!
           $random-source-state-ref
           $random-source-state-set!
           $random-source?
           check
           check-basics-1
           check-mrg32k3a
           display
           eq?
           even?
           exact?
           integer?
           list->vector
           list-ref
           list-tail
           list?
           modulo
           mrg32k3a-pack-state
           mrg32k3a-pseudo-randomize-state
           mrg32k3a-random-integer
           mrg32k3a-random-large
           mrg32k3a-random-m1
           mrg32k3a-random-power
           mrg32k3a-random-range
           mrg32k3a-random-real
           mrg32k3a-random-real-mp
           mrg32k3a-randomize-state
           mrg32k3a-state-ref
           mrg32k3a-state-set
           mrg32k3a-unpack-state
           my-random-integer
           my-random-real
           negative?
           newline
           null?
           pair?
           positive?
           power
           power-power
           procedure?
           product
           quotient
           random-source-current-time
           real?
           to-proper-lambda-list
           vector->list
           vector-length
           vector-ref
           vector-set!
           vector?
           write-diehard
           zero?
           |set $RANDOM-SOURCE-MAKE-INTEGERS|
           |set $RANDOM-SOURCE-MAKE-REALS|
           |set $RANDOM-SOURCE-PSEUDO-RANDOMIZE!|
           |set $RANDOM-SOURCE-RANDOMIZE!|
           |set $RANDOM-SOURCE-STATE-REF|
           |set $RANDOM-SOURCE-STATE-SET!|))


;;; *EOF*
