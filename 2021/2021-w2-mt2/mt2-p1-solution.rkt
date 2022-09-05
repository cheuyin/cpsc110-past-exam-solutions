;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p1)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

;;
;; In the ARROWS constant below you must replace every "???" string with
;; one of the strings "R", "SR", "MR", "NH, "NR", or "NMR" to indicate the
;; kind of the corresponding arrow in the pdf file specified above.
;;


(define ARROWS
  (list (list "A" "MR")   
        (list "B" "MR")   
        (list "C" "SR")   
        (list "D" "R")   
        (list "E" "SR")
        (list "F" "R")))



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
