;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt1-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021s1-mt1/mt1-p2)

(@cwl ycheun07)   ;fill in your CWL here (same CWL you put for 110 problem sets)


(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!


(@problem 2)
;;
;; PROBLEM 2A
;;
;; Correctly complete the @dd-template-rules annotation for the
;; following partial data definition.
;;

(@htdd Status)
;; Status is one of:
;; - "packaging"
;; - "shipping"
;; - "delivery"
;; interp. the shipping status of a package

(@dd-template-rules one-of           ; 3 cases
                    atomic-distinct  ; "packaging"
                    atomic-distinct  ; "shipping"
                    atomic-distinct) ; "delivery"


;;
;; PROBLEM 2B
;;
;; Correctly complete the @dd-template-rules annotation for the
;; following partial data definition.
;;
(@htdd Order)
(define-struct pkg (cost status size))
;; Order is one of:
;; - false
;; - (make-pkg Natural Status Natural)
;; interp. an order for a shipping company
;; false means the order has been cancelled


(@dd-template-rules one-of          ; 2 cases
                    atomic-distinct ; false
                    compound        ; (make-pkg Natural Status Natural)
                    ref)            ; Status





