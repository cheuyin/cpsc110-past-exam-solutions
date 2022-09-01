;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2020w1-mt2-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment mt2-p1)

(@cwl ycheun07)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

;;
;; Below are a set of type comments and templates.  The questions follow them.
;; Each definition or use of a type name has been numbered with [N] following
;; it.  These numbers will be used in answering the question that follows.
;;

(@htdd Date)
;; Date[1] is String[2]
;; interp. a calendar date

(@htdd Person)
(define-struct person (name bdate marriages))
;; Person[3] is (make-person String[4] Date[5] ListOfMarriage[6])
;; interp. A person with their first name, birthdate, and all their marriages

(@htdd Marriage)
(define-struct marriage (date spouse children))
;; Marriage[7] is (make-marriage Date[8] Person[9] ListOfPerson[10])
;; interp. A marriage record with the date, the spouse, and the children

(@htdd ListOfPerson)
;; ListOfPerson[11] is one of:
;;  - empty
;;  - (cons Person[12] ListOfPerson[13])
;; interp. a list of person

(@htdd ListOfMarriage)
;; ListOfMarriage[14] is one of:
;;  - empty
;;  - (cons Marriage[15] ListOfMarriage[16])
;; interp. a list of marriage


(define P0 (make-person "Ali" "1 Jul 1973" empty))
(define P1 (make-person "Sam" "11 Nov 1998" empty))
(define P2 (make-person "Alex" "11 Oct 2003" empty))

(define P3 (make-person "Avi" "1 Jan 1971"
                        (list (make-marriage "3 Aug 1996"
                                             P0 (list P1 P2)))))


#|
  Considering only the TYPE COMMENTS above:
   - identify all the reference arrows that we would draw
   - fill in the following list of lists with one sublist per arrow
     each sublist has:
     - the number of the arrow (start at 1)
     - the number of the type at which the arrow starts
     - the number of the type at which the arrow ends
     - either the string "R" for reference, "SR" for self-reference, or
       "MR" for mutual-reference
   - For example, *if* I believe that there should be 3 arrows, a
     self-reference from Date[1] to String[2], a reference from Date[1] to
     Person[3], and a mutual reference from String[2] to Date[1], I would
     edit reference arrows as follows:

(define reference-arrows
  (list (list 1 1 2 "SR")
        (list 2 1 3 "R")
        (list 3 2 1 "MR")))

The following are bad answers:

There is at least 1 arrow

(define reference-arrows
  (list))

  
Each sub list must have length 4

(define reference-arrows
  (list
   (list 2 4 "R")))

The arrows must start and end at data definitions

(define reference-arrows
  (list
   (list 1 29 21 "R")))

The arrows must be labelled "R" "SR" or "MR"

(define reference-arrows
  (list
   (list 1 6 6 "X")))

The arrows must be numbered sequentially starting at 1

(define reference-arrows
  (list
   (list 1 6 6 "R")
   (list 2 14 14 "SR")
   (list 4 16 16 "SR")))
|#

;; Put your answer here

(define reference-arrows
  (list
   (list 1 5 1 "R")
   (list 2 6 14 "MR")
   (list 3 8 1 "R")
   (list 4 9 3 "MR")
   (list 5 10 11 "MR")
   (list 6 12 3 "MR")
   (list 7 13 11 "SR")
   (list 8 15 7 "MR")
   (list 9 16 14 "SR")))


;; As always, a file that does not run will lose a significant number of marks.
;; Run your work often, so that you can check and fix errors as soon as they
;; creep in.  Also be sure to run every time before you submit.

;; We have special tests at the end of the file.  Any tests that fail indicate
;; that you have not understood or followed the instructions on how to form
;; your answer.
;; Any solution that fails any tests will get a grade of 0.


;; Part 2

;; Here are the template functions for this collection of data definitions
;; Each call to a function with a name that starts with "fn-for-" has
;; been numbered with [N] following it.  These numbers will be used in
;; answering the question that follows.

#|
(define (fn-for-person p)
  (... (person-name p)
       (fn-for-date[1] (person-bdate p))
       (fn-for-lom[2] (person-marriages p))))

(define (fn-for-marriage m)
  (... (fn-for-date[3] (marriage-date m))
       (fn-for-person[4] (marriage-spouse m))
       (fn-for-lop[5] (marriage-children m))))

(define (fn-for-date d)
  (... d))

(define (fn-for-lop lop)
  (cond [(empty? lop) (...)]
        [else
         (... (fn-for-person[6] (first lop))
              (fn-for-lop[7] (rest lop)))]))

(define (fn-for-lom lom)
  (cond [(empty? lom) (...)]
        [else
         (... (fn-for-marriage[8] (first lom))
              (fn-for-lom[9] (rest lom)))]))
|#

(@problem 2)

#|
  Considering now the template functions above:

   - fill in the following list of lists with
     - the number of the reference arrow that you identified in part 1
     - the number of the call corresponding to that arrow
     - either the string "NR" for natural recursion , "NH" for natural helper,
       or "NMR" for natural mutual recursion
   - For example, given the sample answer in part 1, I might provide:

(define call-arrows
  (list
   (list 1 1 "NR")
   (list 2 1 "NH")
   (list 3 1 "NMR")))
|#

;; Put your answer here

(define call-arrows
  (list
   (list 1 1 "NH")
   (list 2 2 "NMR")
   (list 3 3 "NH")
   (list 4 4 "NMR")
   (list 5 5 "NMR")
   (list 6 6 "NMR")
   (list 7 7 "NR")
   (list 8 8 "NMR")
   (list 9 9 "NR")))


;;============================================================================
;;============================================================================
;;============================================================================
;; You should ignore this code.  Do not read or edit below here.
;;
;; This code is here so that running the file will verify that your answer is
;; well-formed.

(define REFLBLS (list "R" "MR" "SR"))
(define (all-lists-have-length-4 l)
  (andmap (λ (m) (= m 4)) (map length l)))
(define (lists-numbered-in-order l)
  (equal? (map first l) (build-list (length l) add1)))
(define (arrow-starts-at-a-type l)
  (andmap (λ (m) (<= 1 m 16)) (map second l)))
(define (arrow-ends-at-a-type l)
  (andmap (λ (m) (<= 1 m 16)) (map third l)))
(define (arrow-has-valid-label l)
  (andmap (λ (m) (member m REFLBLS)) (map fourth l)))
(define (list-has-at-least-one-arrow l) (> (length l) 0))
(check-satisfied reference-arrows all-lists-have-length-4)
(check-satisfied reference-arrows lists-numbered-in-order)
(check-satisfied reference-arrows arrow-starts-at-a-type)
(check-satisfied reference-arrows arrow-ends-at-a-type)
(check-satisfied reference-arrows arrow-has-valid-label)
(check-satisfied reference-arrows list-has-at-least-one-arrow)


(define CALLLBLS (list "NR" "NH" "NMR"))
(define (all-lists-have-length-3 l)
  (andmap (λ (m) (= m 3)) (map length l)))
(define (call-site-is-valid l)
  (andmap (λ (m) (<= 1 m 9)) (map second l)))
(define (call-arrow-has-valid-label l)
  (andmap (λ (m) (member m CALLLBLS)) (map third l)))
(define (call-list-same-length-as-reference-list l)
  (= (length l) (length reference-arrows)))
(check-satisfied call-arrows all-lists-have-length-3)
(check-satisfied call-arrows lists-numbered-in-order)
(check-satisfied call-arrows call-site-is-valid)
(check-satisfied call-arrows call-arrow-has-valid-label)
(check-satisfied call-arrows call-list-same-length-as-reference-list)
