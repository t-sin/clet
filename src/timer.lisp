(defpackage #:clet.timer
  (:use #:cl)
  (:export #:timer
           #:timer-p
           #:timer-name
           #:timer-type
           #:timer-fn
           #:timer-scheduled-p
           #:*timers*
           #:make-timer
           #:list-all-timers
           #:schedule-timer
           #:unschedule-timer))
(in-package #:clet.timer)

(defclass timer ()
  ((name :type string
         :initarg :name
         :initform "default"
         :accessor timer-name)
   (type :type (member :normal :hpet)
         :initarg :name
         :initform :normal
         :accessor timer-type)
   (fn :type function
       :initarg :fn
       :initform #'identity
       :accessor timer-fn)
   (scheduled-p :type (member t nil)
                :initarg :scheduled-p
                :initform nil
                :accessor timer-scheduled-p)))

(defparameter *timers* '())

(defun list-all-timers ()
  *timers*)

(defgeneric make-timer (name type fn &key &allow-other-keys))
(defgeneric schedule-timer (timer))
(defgeneric unschedule-timer (timer))

(defmethod schedule-timer :after ((timer timer))
  (setf (timer-scheduled-p timer) t)
  (push timer *timers*))

(defmethod unschedule-timer :after ((timer timer))
  (setf (timer-scheduled-p timer) nil)
  (setf *timers* (remove-if (lambda (tm) (eq tm timer)) *timers*)))
