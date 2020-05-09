(defpackage #:clet
  (:use #:cl #:clet.timer)
  (:export #:timer-p
           #:timer-name
           #:time-type
           #:timer-scheduled-p
           #:schedule-timer
           #:unschedule-timer
           #:list-all-timers))
(in-package #:clet)
