(defsystem "almighty-lisp"
  :version "0.0.1"
  :author ""
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "almighty-lisp/tests"))))

(defsystem "almighty-lisp/tests"
  :author ""
  :license ""
  :depends-on ("almighty-lisp"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for almighty-lisp"
  :perform (test-op (op c) (symbol-call :rove :run c)))
