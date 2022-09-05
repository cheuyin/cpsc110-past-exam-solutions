;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021w1-mt2/mt2-p3)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;this is actually problem 3 - DO NOT EDIT OR DELETE THIS LINE!

#|

Complete the design of the following function by writing the template tag
and the function definition.

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

  - Files must not have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - The function definition MUST call one or more built-in abstract functions.
    For full marks it must be a composition of exactly 2 different built-in
    abstract functions.

  - For maximum credit the function definition should use the most clear
    and expressive combination of abstract functions.  In particular, while
    it is possible to just use foldr for these problems that is not always
    correct. If what is happening is a filter, then it is not correct to 
    just implement filtering with foldr.

  - The function definition MUST NOT be recursive.

  - The function definition MUST NOT use any part of the recursive Natural
    template or the (listof X) template.

      - it must not include (cond [(empty? ... anywhere
      - it must not include (cond [(zero? ... anywhere
      - it must not include (if (empty? ... anywhere
      - it must not include (if (zero? ... anywhere

  - The result of the function must directly be the result of one of the
    built-in abstract functions. So, for example, the following is not
    a valid function body:

       (define (foo x)
         (empty? (filter ...)))

  - You MUST NOT change or comment out any check-expects, but you are free
    to add new ones.

|#

(define SIZE-FACTOR 10)


(@htdf steps)
(@signature Natural Natural Color Color -> Image)
;; image of naturals in [hi, lo]; size = n*SIZE-FACTOR; and odd or even color

(check-expect (steps 4 4 "blue" "red")
              (text "4" (* 4 SIZE-FACTOR) "red"))
(check-expect (steps 0 3 "blue" "orange")
              (beside/align "bottom"
                            (text "3" (* 3 SIZE-FACTOR) "blue")
                            (text "2" (* 2 SIZE-FACTOR) "orange")
                            (text "1" (* 1 SIZE-FACTOR) "blue")
                            empty-image))
(check-expect (steps 5 9 "black" "yellow")
              (beside/align "bottom"
                            (text "9" (* 9 SIZE-FACTOR) "black")
                            (text "8" (* 8 SIZE-FACTOR) "yellow")
                            (text "7" (* 7 SIZE-FACTOR) "black")
                            (text "6" (* 6 SIZE-FACTOR) "yellow")
                            (text "5" (* 5 SIZE-FACTOR) "black")))

; (define (steps lo hi odd-color even-color) empty-image) ; stub

(@template use-abstract-fn fn-composition)

(define (steps lo hi odd-color even-color)
  (foldr (lambda (n rnr) (beside/align "bottom"
                                       rnr
                                       (if (zero? n)
                                           empty-image
                                           (text (number->string n)
                                                 (* n SIZE-FACTOR)
                                                 (if (odd? n) odd-color
                                                     even-color)))))
         empty-image
         (build-list (add1 (- hi lo)) (lambda (n) (+ n lo)))))















