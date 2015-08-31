; ----------------------------------------------------------
; Clips Program to make an expert system that takes student's
; marks as input and tells what to pursue in Undergraduates
; -----------------------------------------------------------
; -----------------------------------------------------------
; ------- Author: Saptak Sengupta ---------------------------
; -----------------------------------------------------------
; -----------------------------------------------------------




; -------------------------------------
; ------Various Objects Needed --------
; -------------------------------------

(deftemplate Stream (slot stream))
(deftemplate Marks (slot marks))
(deftemplate Favourite (slot favourite))
(deftemplate Interest (slot interest))

; ------------------------
; ------INPUT-------------
; ------------------------

(defrule GetStream
   (declare (salience 200))
   =>
   (printout t "Enter Stream in Higher Secondary(science/arts/commerce): ")
   (bind ?response (read))
   (assert (Stream (stream ?response))))

(defrule GetFavourite1
   (Stream (stream science))
   =>
   (printout t "What is your favourite subject(maths/physics/chemistry/biology): ")
   (bind ?response (read))
   (assert (Favourite (favourite ?response))))

(defrule GetFavourite2
   (Stream (stream arts))
   =>
   (printout t "What is your favourite subject(history/geography/english): ")
   (bind ?response (read))
   (assert (Favourite (favourite ?response))))

(defrule GetFavourite3
   (Stream (stream commerce))
   =>
   (printout t "What is your favourite subject(economics/management/accountancy): ")
   (bind ?response (read))
   (assert (Favourite (favourite ?response))))

(defrule GetInterest
   =>
   (printout t "What interests you the most(maths/computer/history/books): ")
   (bind ?response (read))
   (assert (Interest (interest ?response))))

(defrule GetMarks
   (declare (salience 100))
   =>
   (printout t "Marks in Higher Secondary: ")
   (bind ?response (read))
   (assert (Marks (marks ?response))))

;---------------------------
;--------RULES--------------
;---------------------------

(defrule Undergrad1
   (Favourite (favourite maths))
   (Marks (marks ?m))
   (test (>= ?m 75))
   (Interest (interest maths))   
   =>
   (assert (grad done))
   (printout t "You should take up B.Stat in Statistics" crlf))

(defrule Undergrad2
   (Favourite (favourite maths))
   (Marks (marks ?m))
   (test (< ?m 75))
   (Interest (interest maths))
   =>
   (assert (grad done))
   (printout t "You should take up B.Sc in Maths" crlf))

(defrule Undergrad3
   (or (Favourite (favourite maths)) (Favourite (favourite physics)))
   (Marks (marks ?m))
   (test (>= ?m 75))
   (Interest (interest computer))
   =>
   (assert (grad done))
   (printout t "You should take up B.Tech in Computer Science or I.T." crlf))

(defrule Undergrad4
   (or (Favourite (favourite maths)) (Favourite(favourite physics)))
   (Marks (marks ?m))
   (test (< ?m 75))
   (Interest (interest computer))
   =>
   (assert (grad done))
   (printout t "You should take up B.Sc in Computer Application" crlf))

(defrule Undergrad5
   (Favourite (favourite physics))
   (Marks (marks ?m))
   (test (< ?m 85))
   (Interest (interest maths))
   =>
   (assert (grad done))
   (printout t "You should take up B.Sc in Physics" crlf))


(defrule Undergrad6
   (Favourite (favourite physics))
   (Marks (marks ?m))
   (test (>= ?m 85))
   (Interest (interest maths))
   =>
   (assert (grad done))
   (printout t "You should try for Engineering in Mechanical or Electronics" crlf))

(defrule Undergrad7
   (Favourite (favourite chemistry))
   =>
   (assert (grad done))
   (printout t "You should study Chemical Engineering or Chemistry Honours" crlf))

(defrule Undergrad8
   (Favourite (favourite biology))
   (Marks (marks ?m))
   (test (>= ?m 85))
   =>
   (assert (grad done))
   (printout t "You should try for MBBS" crlf))

(defrule Undergrad9
   (Favourite (favourite biology))
   (Marks (marks ?m))
   (test (< ?m 85))
   =>
   (assert (grad done))
   (printout t "You should take up B.Sc in Botany or Zoology" crlf))

(defrule Undergrad10
   (Favourite (favourite economics))
   =>
   (assert (grad done))
   (printout t "You should study Economics" crlf))

(defrule Undergrad11
   (Favourite (favourite accountancy))
   (Marks (marks ?m))
   (test (>= ?m 90))
   (Interest (interest maths))
   =>
   (assert (grad done))
   (printout t "You should take up Chatered Accountancy" crlf))

(defrule Undergrad12
   (Favourite (favourite accountancy))
   =>
   (assert (grad done))
   (printout t "You should take up Commercial Application" crlf))

(defrule Undergrad13
   (Favourite (favourite management))
   =>
   (assert (grad done))
   (printout t "You should do Bachelor in Business Administration" crlf))

(defrule Undergrad14
   (Favourite (favourite geography))
   =>
   (assert (grad done))
   (printout t "You should study Geography" crlf))

(defrule Undergrad15
   (Favourite (favourite history))
   (Interest (interest history))
   =>
   (assert (grad done))
   (printout t "You should study History" crlf))

(defrule Undergrad16
   (Favourite (favourite english))
   (or (Interest (interest computer)) (or (Interest (interest books)) (Interest (interest history))))
   =>
   (assert (grad done))
   (printout t "You should study English" crlf))

(defrule None
   (declare (salience -100))
   (and (not (grad done)))
   =>
   (printout t "Results are Inconclusive!!!" crlf))

