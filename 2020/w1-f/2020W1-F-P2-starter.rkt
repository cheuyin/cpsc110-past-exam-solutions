;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2020W1-F-P2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment f-p2)

(@cwl ycheun07)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;THIS IS REALLY PROBLEM 2.  DO NOT EDIT OR DELETE THIS LINE!
;;
;; Design a function called longest-sequence that consumes a list of integers
;; and produces the longest sequence of consective integers that are each one
;; larger than the previous integer.  All of the following are examples of
;; sequences of consecutive integers:
;;
;;     (list 1 2 3 4)
;;     (list 2)
;;     empty
;;     (list -5 -4)
;;
;; Your solution MUST BE TAIL-RECURSIVE.
;; 
;; If there are multiple sequences of the same length in the input list, then
;; you must produce the first one (the left-most one) in the list.
;;
;; For example:
;;  (longest-sequence  (list 8 9 1 8 6 7))     must produce (list 8 9)
;;  (longest-sequence (list 8 7 8 -3 -2 -1 5)) must produce (list -3 -2 -1)
;;
;; You MAY want to call length, and if so that is fine, but it is not required.
;; You MAY also want to handle the empty list case in the trampoline.
;;
;; You must include all relevant design recipe elements.
;;
;; As always, a file that does not run or that produces errors when run will
;; lose a significant number of marks.  A file with failing tests is much
;; less bad.  Run your work often, so that you can check and fix errors as
;; soon as they creep in.  Also be sure to run every time before you submit.
;;

(@htdf longest-sequence)
(@signature (listof Integer) -> (listof Integer))
;; produce longest consecutive sequence in lon0
(check-expect (longest-sequence empty) empty)
(check-expect (longest-sequence (list 2)) (list 2))
(check-expect (longest-sequence (list -5 -4)) (list -5 -4))
(check-expect (longest-sequence (list 8 9 1 8 6 7)) (list 8 9))
(check-expect (longest-sequence (list 8 7 8 -3 -2 -1 5)) (list -3 -2 -1))

(@template accumulator (listof Integer))

(define (longest-sequence lon0)
  ;; acc is (listof Integer); reverse of sequence in lon0 ending just before lon
  ;; rsf is (listof Integer); longest sequence of consecutive integers so far
  (local [(define (fn-for-lon lon acc rsf)
            (cond [(empty? lon) (if (> (length acc)
                                       (length rsf))
                                    (reverse acc)
                                    rsf)]
                  [else
                   (local [(define f (first lon))
                           (define prev (first acc))]
                     (if (= f (add1 prev))
                         (fn-for-lon (rest lon) (cons f acc) rsf)                        
                         (fn-for-lon (rest lon) (list f) (if (> (length acc)
                                                                (length rsf))
                                                             (reverse acc)
                                                             rsf))))]))]
    (if (empty? lon0)
        empty
        (fn-for-lon (rest lon0) (list (first lon0)) (list (first lon0))))))






