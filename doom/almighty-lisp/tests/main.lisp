(defpackage almighty-lisp/tests/main
  (:use :cl
        :almighty-lisp
        :rove))
(in-package :almighty-lisp/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :almighty-lisp)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
