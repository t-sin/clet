(defpackage #:clet
  (:use #:cl #:clet.timer)
  (:export #:timer-p
           #:timer-name
           #:time-type
           #:timer-scheduled-p
           #:list-all-timers))
(in-package #:clet)

(defun list-all-timers ()
  *timers*)
