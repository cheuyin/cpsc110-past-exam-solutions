;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt1/mt1-p1)

(@cwl ycheun07)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!


;;
;; Design a function called stack that takes two strings and returns an image
;; with the image of the shorter of the two strings displayed above the
;; image of the longer of the two strings.  If the two strings have the same
;; length, the image of the first should be above the image of the second.
;; Use the provided constants as values for the text size and text colour.
;; Ensure that you follow the complete htdf recipe and include every required
;; element.  Also include a commented out copy of your function template.
;;

(define TEXT-SIZE 30)
(define TEXT-COLOUR "red")

(@htdf stack)
(@signature String String -> Image)
;; given two strings, produce image of shorter string above the longer one
(check-expect (stack "" "") (above (text "" TEXT-SIZE TEXT-COLOUR)
                                   (text "" TEXT-SIZE TEXT-COLOUR)))
(check-expect (stack "Hi" "Sir") (above (text "Hi" TEXT-SIZE TEXT-COLOUR)
                                        (text "Sir" TEXT-SIZE TEXT-COLOUR)))
(check-expect (stack "Sir" "Hi") (above (text "Hi" TEXT-SIZE TEXT-COLOUR)
                                        (text "Sir" TEXT-SIZE TEXT-COLOUR)))
(check-expect (stack "One" "Two") (above (text "One" TEXT-SIZE TEXT-COLOUR)
                                         (text "Two" TEXT-SIZE TEXT-COLOUR)))
(check-expect (stack "Two" "One") (above (text "Two" TEXT-SIZE TEXT-COLOUR)
                                         (text "One" TEXT-SIZE TEXT-COLOUR)))

; (define (stack s1 s2) empty-image)  ; stub

(@template String)
;(define (fn-for-str s1 s2)
;  (... s1 s2))

(define (stack s1 s2)
  (if (<= (string-length s1) (string-length s2))
      (above (text s1 TEXT-SIZE TEXT-COLOUR)
             (text s2 TEXT-SIZE TEXT-COLOUR))
      (above (text s2 TEXT-SIZE TEXT-COLOUR)
             (text s1 TEXT-SIZE TEXT-COLOUR))))






