;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mt2-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021w1-mt2/mt2-p4)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;this is actually problem 1 - DO NOT EDIT OR DELETE THIS LINE!

(define COLOR "black")
(define CUTOFF 50)	; Minimum size

#|
In this problem you must complete the design of a function to draw escher
squares.  You must use the COLOR and CUTOFF constants in your tests and
function definition.  You must also use the helper function one-quarter
in your solution.

As this is a genrec problem be sure to include a 3 part termination
argument.

See the handout or this PDF file for an explanation of Escher squares.

https://cs110.students.cs.ubc.ca/exams/2021w1-mt2/mt2-p4-figure.pdf

|#

(@htdf escher-square)
(@signature Number -> Image)
;; produce Escher square of the given size.
(check-expect (escher-square CUTOFF) ;base
              (above (beside (one-quarter (/ CUTOFF 2))
                             (rotate 90 (one-quarter (/ CUTOFF 2))))
                     (beside (rotate 90 (one-quarter (/ CUTOFF 2)))
                             (one-quarter (/ CUTOFF 2)))))
(check-expect (escher-square (* 2 CUTOFF)) ;one bigger than base
              (overlay (escher-square CUTOFF)
                       (above (beside (one-quarter CUTOFF)
                                      (rotate 90 (one-quarter CUTOFF)))
                              (beside (rotate 90 (one-quarter CUTOFF))
                                      (one-quarter CUTOFF)))))
               

;(define (escher-square l) empty-image)

(@template-origin genrec)
;; Termination argument
;; base case: l <= CUTOFF
;; reduction step: l /  2
;; argument: since CUTOFF > 0, repeatedly dividing by 2 will
;;           eventually be <= CUTOFF
(define (escher-square l)
  (cond [(<= l CUTOFF) 
         (above (beside (one-quarter (/ l 2))
                        (rotate 90 (one-quarter (/ l 2))))
                (beside (rotate 90 (one-quarter (/ l 2)))
                        (one-quarter (/ l 2))))]
        [else (overlay (escher-square (/ l 2))
                       (above (beside (one-quarter (/ l 2))
                                      (rotate 90 (one-quarter (/ l 2))))
                              (beside (rotate 90 (one-quarter (/ l 2)))
                                      (one-quarter (/ l 2)))))]))



;; ----------------------
;; Below is a function which you should treat as a primitive.  As such we are
;; only giving you signature, purpose, and the function definition.  We suggest
;; you start by running the program and then type  (one-quarter 20)  in the
;; definitions window.  You will see that this function gives you 1/4 of the
;; basic image for any given size of escher square.  NOTE, by giving you 1/4
;; of the image, it is giving you a square with side length 1/2 of the total
;; esher square.

(@signature Number -> Image)
;; produces 1/4 of the base image for an escher square of size l
(define (one-quarter l)
  (overlay (square l "outline" "black")
           (overlay/align
            "left" "bottom"
            (rotate 270
                    (isosceles-triangle (* .5 (sqrt (* 2 (sqr l))))
                                        90 "solid" "black"))
            (overlay/align
             "right" "bottom"
             (rotate 90
                     (isosceles-triangle (* .5 (sqrt (* 2 (sqr l))))
                                         90 "solid" "black"))
             (square l "solid" "white")))))



