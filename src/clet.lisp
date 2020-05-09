(defpackage #:clet
  (:use #:cl
        #:clet.timer
        #:clet.sbcl-timer)
  (:export #:timer-p
           #:timer-name
           #:time-type
           #:timer-scheduled-p
           #:make-timer
           #:schedule-timer
           #:unschedule-timer
           #:list-all-timers

           #:sbcl-timer))
(in-package #:clet)
