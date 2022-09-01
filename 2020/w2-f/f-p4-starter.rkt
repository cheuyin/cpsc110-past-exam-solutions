;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname f-p4-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #t)))
(require spd/tags)


(@assignment f-p4)

(@cwl ???)   ;fill in your CWL here (same CWL you put for problem sets)

(@problem 1) ;This is actually problem 4, DO NOT EDIT OR DELETE THIS LINE!


;; PROBLEM
;;
;; In this problem you will design a function to decode a secret code.
;; It's not a very good secret code, so let's hope no one really uses it.
;; The secret code works like this:
;;
;;  - Messages in the code are represented as lists of naturals.
;;  - Each message (each list) encodes a single natural.
;;  - As you decode the list:
;;  -   If you encounter an odd number n then you skip the next
;;      n even numbers. If you encounter an odd number n2 while
;;      still having n1 even numbers to skip you just add n2 to
;;      n1 to have n1 + n2 even numbers to skip.
;;  -   All unskipped even numbers are summed to produce the total result.
;;
;; So, for example
;;
;;    (decode (list 1 3 4 6 8 2 4))  --> 4
;;
;; because:
;;
;;     1 means skip the next 1 even numbers
;;     3 means skip 3 more, so current total to skip is 4
;;     4 is skipped
;;     6 is skipped
;;     8 is skipped
;;     2 is skipped
;;     4 is added to total
;;
;; As another example:
;;
;;   (decode (list 1 2 4 3 2 4 6 8 4))  --> 16    (+ 4 8 4)
;;
;; You must follow all recipe steps and include all required
;; recipe elements.
;;
;; You must include all required recipe elements.


(@htdf decode)
(@signature (listof Natural) -> Natural)
;; decode the given list of naturals to produce the secret natural
(check-expect (decode empty) 0)
(check-expect (decode (list 3)) 0)
(check-expect (decode (list 4)) 4)
(check-expect (decode (list 1 3 4 6 8 2 4)) 4)
(check-expect (decode (list 1 2 4 3 2 4 6 8 4)) 16)

(@template (listof Natural) accumulator)
           
(define (decode lon0)
  ;; rsf is Natural; sum of non-skipped even naturals so far
  ;; acc is Natural; num of even numbers remaining to skip
  (local [(define (decode lon rsf acc)
            (cond [(empty? lon) rsf]
                  [(and (zero? acc) (even? (first lon)))
                   (decode (rest lon) (+ rsf (first lon)) acc)]
                  [(odd? (first lon))
                   (decode (rest lon) rsf (+ acc (first lon)))]
                  [else (decode (rest lon) rsf (sub1 acc))]))]
    (decode lon0 0 0)))









