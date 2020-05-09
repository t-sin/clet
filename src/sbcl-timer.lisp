(defpackage #:clet.sbcl-timer
  (:use #:cl #:clet.timer)
  (:export #:sbcl-timer))
(in-package #:clet.sbcl-timer)

;;; SBCL's timer API
;; http://www.sbcl.org/manual/#Timers
;; it seems not to be a HPET timer.

(defclass sbcl-timer (timer)
  ((obj :type t
        :initarg :obj
        :initform nil
        :accessor timer-obj)))

(defmethod make-timer (name (type (eql 'sbcl-timer)) fn &rest keys &key &allow-other-keys)
  (let* ((sb-timer (sb-ext:make-timer fn :name name))
         (timer (make-instance 'sbcl-timer
                               :name name
                               :type :normal
                               :fn fn
                               :obj sb-timer)))
    (print keys)
    timer))

;; time is in seconds.
;; according to the SBCL manual, time is ether a number of seconds from the current time or a universal time.
(defmethod schedule-timer ((timer sbcl-timer) time &rest keys &key &allow-other-keys)
  (apply #'sb-ext:schedule-timer `(,(timer-obj timer) ,time ,@keys)))

(defmethod unschedule-timer ((timer sbcl-timer))
  (sb-ext:unschedule-timer (timer-obj timer)))
