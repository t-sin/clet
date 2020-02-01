(defpackage #:clet.timer
  (:use #:cl)
  (:export #:timer
           #:timer-p
           #:timer-name
           #:timer-type
           #:timer-fn
           #:timer-scheduled-p
           #:timerobj
           #:*timers*))
(in-package #:clet.timer)

(defstruct timer
  (name "default" :type string)
  (type :normal :type (member :normal :hpet))
  (fn nil :type function)
  (scheduled-p nil)
  (timerobj nil))

(defparameter *timers* '())
