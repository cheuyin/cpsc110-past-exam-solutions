;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2020w2-mt1/mt1-p2)

(@cwl ycheun07)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;Actually problem 2, DO NOT EDIT OR DELETE this line

;;
;; Consider the following type comment and partial interpretation:
;;

(@htdd Foo)
;; Foo is one of:
;;  - Number
;;  - "x"
;;  - "y"
;;  - "z"
;;  - Boolean
;; interp. ...
;;         If a Number is in [1, 100]


;; You must complete the following @dd-template-rules annotation and
;; template.  Note that:

;;   - a template that is correct and has been correctly simplified will
;;     earn 100% marks
;;
;;   - a template that is correct and has no simplification will 
;;     earn  90% marks
;;
;;   - a partially correct template may earn partial marks
;;
;;   - if the file fails Check Syntax 0 marks will be awarded
;;
;;   - you must NOT comment out the annotation or the template function itself
;;

(@dd-template-rules one-of                ; 5 cases
                    atomic-non-distinct   ; Number
                    atomic-distinct       ; "x"
                    atomic-distinct       ; "y"
                    atomic-distinct       ; "z"
                    atomic-non-distinct)  ; Boolean


(define (fn-for-foo f)
  (cond [(number? f) (... f)]
        [(and (string? f) (string=? "x" f)) (...)]
        [(and (string? f) (string=? "y" f)) (...)]
        [(string? f) (...)]
        [else (... f)]))

