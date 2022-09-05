;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021w1-mt2/mt2-p3)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;this is actually problem 3 - DO NOT EDIT OR DELETE THIS LINE!

(define SIZE-FACTOR 10)


(@htdf steps)
(@signature Natural Natural Color Color -> Image)
;; image of numbers from hi to lo; size = n*SIZE-FACTOR; and odd or even color
(check-expect (steps 4 4 "blue" "red")
              (text "4" (* 4 SIZE-FACTOR) "red"))
(check-expect (steps 1 3 "blue" "orange")
              (beside/align "bottom"
                            (text "3" (* 3 SIZE-FACTOR) "blue")
                            (text "2" (* 2 SIZE-FACTOR) "orange")
                            (text "1" (* 1 SIZE-FACTOR) "blue")))
(check-expect (steps 0 3 "blue" "orange")
              (beside/align "bottom"
                            (text "3" (* 3 SIZE-FACTOR) "blue")
                            (text "2" (* 2 SIZE-FACTOR) "orange")
                            (text "1" (* 1 SIZE-FACTOR) "blue")
                            empty-image))

;(define (steps lo hi odd-color even-color) empty-image) ; stub

(@template-origin fn-composition use-abstract-fn)

(define (steps lo hi odd-color even-color)
  (local [(define (+lo i) (+ lo i))
          (define (block n)
            (if (= 0 n)
                empty-image
                (text (number->string n)
                      (* n SIZE-FACTOR)
                      (if (odd? n) odd-color even-color))))
          (define (b/ab x y)
            (beside/align "bottom" y x))]
    (foldr b/ab
           empty-image
           (build-list (add1 (- hi lo))
                       (lambda (i)
                         (block (+lo i)))))))



