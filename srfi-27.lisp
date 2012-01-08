;;;; srfi-27.lisp

(cl:in-package :srfi-27.internal)

(define-record-type |:random-source|
  (|:random-source-make|
   state-ref
   state-set!
   randomize!
   pseudo-randomize!
   make-integers
   make-reals)
  |:random-source?|
  (state-ref         |:random-source-state-ref|)
  (state-set!        |:random-source-state-set!|)
  (randomize!        |:random-source-randomize!|)
  (pseudo-randomize! |:random-source-pseudo-randomize!|)
  (make-integers     |:random-source-make-integers|)
  (make-reals        |:random-source-make-reals|))

(defun random-source-current-time ()
  #+sbcl
  (multiple-value-bind (se ms)
                       (sb-ext:get-time-of-day)
    (+ (* #.(expt 10 6) se) ms) )
  #-sbcl
  (let ((ut (get-universal-time))
        (ps (mod (get-internal-real-time) internal-time-units-per-second)) )
    (+ (* internal-time-units-per-second ut)
       ps )))

;;; eof
