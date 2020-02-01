(defsystem :clet
  :version "0.1"
  :description "Portable event timer libaray for Common Lisp"
  :license "MIT"
  :author "t-sin <shinichi.tanaka45@gmail.com>"
  :depends-on ()
  :components ((:module "src" :serial t
                :components ((:file "timer")
                             #+sbcl (:file "sbcl-timer")
                             (:file "clet")))))
