; ----------------------------------------------------------
; Clips Program to predict animals from characteristics input
; -----------------------------------------------------------
; -----------------------------------------------------------
; ------- Author: Saptak Sengupta ---------------------------
; -----------------------------------------------------------
; -----------------------------------------------------------




; -------------------------------------
; ------Various Objects Needed --------
; -------------------------------------

(deftemplate Legs (slot legs))
(deftemplate Wings (slot wings))
(deftemplate Location (slot location))
(deftemplate Type (slot type))
(deftemplate Pet (slot pet))
(deftemplate Trunk (slot trunk))
(deftemplate Skin (slot skin))

; ------------------------
; ------INPUT-------------
; ------------------------

(defrule GetLegs
   (declare (salience 800))
   =>
   (printout t "How many legs does the animal have? : ")
   (bind ?response (read))
   (assert (Legs (legs ?response))))

(defrule GetWings
   (declare (salience 780))
   (Legs (legs ?l))
   (test (< ?l 4))
   =>
   (printout t "Does it have wings(yes/no): ")
   (bind ?response (read))
   (assert (Wings (wings ?response))))

(defrule GetLocation
   (declare (salience 500))
   (not (animal ?))
   =>
   (printout t "Where is it usually found? (forest/water/desert/domestic): ")
   (bind ?response (read))
   (assert (Location (location ?response))))

(defrule GetType
   (declare (salience 490))
   (not (animal ?))
   =>
   (printout t "Is it Carnivore or Herbivore? : ")
   (bind ?response (read))
   (assert (Type (type ?response))))

(defrule GetPet
   (declare (salience 480))
   (not (animal ?))
   =>
   (printout t "Is it a pet animal? (yes/no): ")
   (bind ?response (read))
   (assert (Pet (pet ?response))))

(defrule GetTrunk
	(declare (salience 750))
	(Legs (legs 4))
	=>
	(printout t "Does it have a trunk? (yes/no): ")
	(bind ?response (read))
	(assert (Trunk (trunk ?response))))

(defrule GetSkin
   (declare (salience 700))
   (not (animal ?))
   =>
   (printout t "What is its skin type? (Fur/Skinny/Scales): ")
   (bind ?response (read))
   (assert (Skin (skin ?response))))

;---------------------------
;--------RULES--------------
;---------------------------

(defrule Bird
	(declare (salience 600))
	(Wings (wings yes))
	=>
	(assert (animal bird))
	(printout t "It is a BIRD!!" crlf))

(defrule Bat
	(declare (salience 680))
	(and (Wings (wings yes)) (Skin (skin Skinny)))
	=>
	(assert (animal bat))
	(printout t "The Animal is BAT!!" crlf))

(defrule Elephant
	(declare (salience 749))
	(Trunk (trunk yes))
	=>
	(assert (animal eleph))
	(printout t "The Animal is an ELEPHANT!!" crlf))

(defrule Snake
	(declare (salience 499))
	(Legs (legs ?l))
	(and (test (= ?l 0)) (Skin (skin Scales)) (Location (location forest)))
	=>
	(assert (animal snake))
	(printout t "Its a SNAKE!!" crlf))

(defrule Dog
	(declare (salience 100))
	(Legs (legs 4))
	(Pet (pet yes))
	(Type (type Carnivore))
	(Skin (skin Fur))
	=>
	(assert (animal dog))
	(printout t "Its a DOG or a CAT!!" crlf))

(defrule Horse
	(declare (salience 100))
	(Legs (legs 4))
	(Pet (pet yes))
	(Type (type Herbivore))
	=>
	(assert (animal horse))
	(printout t "Its a COW or a HORSE or something similar!!" crlf))

(defrule Tiger
	(declare (salience 200))
	(Legs (legs 4))
	(Pet (pet no))
	(Type (type Carnivore))
	(Location (location forest))
	(Skin (skin Fur))
	=>
	(assert (animal tiger))
	(printout t "Its a TIGER or a LION or WOLF or something similar!!" crlf))

(defrule Camel
	(declare (salience 499))
	(Legs (legs 4))
	(Location (location desert))
	=>
	(assert (animal camel))
	(printout t "Its a CAMEL!!" crlf))

(defrule Fish
	(declare (salience 499))
	(Legs (legs 0))
	(Location (location water))
	(Skin (skin Scales))
	=>
	(assert (animal fish))
	(printout t "Its a FISH!!" crlf))
