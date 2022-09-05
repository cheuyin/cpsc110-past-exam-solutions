;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p1)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

#|

For this problem you will be working with the type comments and arrows
shown in the handout.

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - this file includes special check-expects that will check whether your
   answer is well-formed when you run the file
 - you must not edit those check-expects
 - run the file EVERY time you edit an answer
 - your submission must run without errors
 - if you cause an error the name of the failing test will describe
   what you need to change in the way you entered your answer

|#

;;
;; In the ARROWS constant below you must replace every "???" string with
;; one of the following strings to indicate what kind of arrow the label
;; marks:
;;    "R"    for reference
;;    "SR"   for self-reference
;;    "MR"   for mutual-reference
;;    "NH"   for natural helper
;;    "NR"   for natural recursion
;;    "NMR"  for natural mutual recursion
;;


(define ARROWS
  (list (list "A" "???")   
        (list "B" "???")   
        (list "C" "???")   
        (list "D" "???")   
        (list "E" "???")
        (list "F" "???")))



;;============================================================================
;;============================================================================
;;============================================================================
;; You should ignore this code.  Do not read or edit below here.
;;
;; This code is here so that running the file will verify that your answer is
;; well-formed.

(check-satisfied ARROWS list-has-length-6)
(check-satisfied ARROWS all-sublists-have-length-2)
(check-satisfied ARROWS all-sublist-first-elements-are-A-to-F)
(check-satisfied ARROWS all-sublist-second-elements-are-LABELS)


(define LABELS  (list "R"  "SR" "MR" "NH" "NR" "NMR"))

(define (list-has-length-6 l)
  (= (length l) 6))

(define (all-sublists-have-length-2 l)
  (andmap (lambda (l) (= (length l) 2)) ARROWS))

(define (all-sublist-first-elements-are-A-to-F l)
  (equal? (map first l) '("A" "B" "C" "D" "E" "F")))

(define (all-sublist-second-elements-are-LABELS l)
  (andmap (lambda (sl) (member? (second sl) LABELS)) l))
