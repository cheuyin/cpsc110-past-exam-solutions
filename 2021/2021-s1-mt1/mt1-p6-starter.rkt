;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p6-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021s1-mt1/mt1-p6)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 5) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 6)

;; You are given the following data definitions for Phone and ListOfPhone:

(@htdd Phone)
(define-struct phone (name brand price))
;; Phone is (make-phone String String Natural)
;; interp. the name, brand, and price in USD of a cell phone

(define P1 (make-phone "Galaxy S9"  "Samsung"  500))
(define P2 (make-phone "iPhone X"   "Apple"    1000))
(define P3 (make-phone "Pixel 5"    "Google"   700))
(define P4 (make-phone "Galaxy S21" "Samsung"  1200))
(define P5 (make-phone "iPhone 12"  "Apple"    1200))
(define P6 (make-phone "Pixel 3"    "Google"   600))

(@dd-template-rules compound)

(define (fn-for-phone p)
  (... (phone-name p)
       (phone-brand p)
       (phone-price p)))

                      

(@htdd ListOfPhone)
;; ListOfPhone is one of:
;; - empty
;; - (cons Phone ListOfPhone)
;; interp. a list of cell phones

(define LOP-MT empty)
(define LOP1 (cons P1 empty))
(define LOP2 (cons P2 (cons P1 empty)))

(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    ref
                    self-ref)

(define (fn-for-lop lop)
  (cond [(empty? lop) (...)]
        [else
         (... (fn-for-phone (first lop))
              (fn-for-lop (rest lop)))]))


#|
Design a function called count that consumes a list of phones, a cell phone
brand, and a price and produces the number of phones in the list that are
from the given brand and cost less than the given price. 

Ensure that you follow the complete htdf recipe and include every required
element.

|#

(@htdf count)
(@signature ListOfPhone String Natural -> Natural)
;; produce number of phones in list that are the given brand and with price < p
(check-expect (count empty "Google" 100) 0)
(check-expect (count LOP1 "Samsung" 499) 0)
(check-expect (count LOP1 "Samsung" 500) 0)
(check-expect (count LOP1 "Samsung" 501) 1)
(check-expect (count LOP2 "Apple" 1500) 1)
(check-expect (count LOP2 "None" 1500) 0)

; (define (count lop b p) 0)  ; stub

(@template ListOfPhone)

(define (count lop b p)
  (cond [(empty? lop) 0]
        [else
         (if (and (string=? b (phone-brand (first lop)))
                  (< (phone-price (first lop)) p))
             (add1 (count (rest lop) b p))
             (count (rest lop) b p))]))


