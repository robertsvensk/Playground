
;; This is a plain STRIPS formulation of the standard Logistics domain.

;; In this domain, there are six different types of objects: "object"
;; (the packages to be transported), "truck", "airplane" and their
;; common supertype "vehicle", "location" and the subtype "airport",
;; and finally "city". Types are defined by static (in the sense that
    ;; there are no operators that change their truth value) unary predicates.
;; The types of objects in a problem instance must be defined by including
;; the appropriate typing predicates in the initial state.

;; A binary static predicate called "loc" describes the topology of the
;; problem instance: "(loc ?l ?c)" is true iff the location ?l is in city
;; ?c.

(define (domain logistics)
  (:requirements :strips)
  (:predicates

     ;; Static predicates:
     (object ?o)
     (smallpacket ?sp) (mediumpacket ?mp) (bigpacket ?bp)

     (smalltruck ?st) (medtruck ?mt) (bigtruck ?bt) (spectruck ?spt)
     (truck ?t) (airplane ?p) (train ?r) (vehicle ?v)
     (location ?l) (airport ?a) (trainstation ?s) (city ?c) (loc ?l ?c)

     ;; Non-static predicates:
     (at ?x ?l) ;; ?x (package or vehicle) is at location ?l
     (in ?o ?v) ;; package ?p is in vehicle ?v
     ;;(full ?v) ;; vehicle full?
     )

  ;; Actions for loading and unloading packages.
  ;; By declaring all trucks and airplanes to be also "vehicle", we
  ;; can use the same load/unload operator for both (otherwise we
      ;; would need one for each subtype of vehicle).

;; Small trucks can only load smallpacket
(:action loadsmall
    :parameters (?sp ?st ?l)
    :precondition (
        and (smallpacket ?sp) (smalltruck ?st) (location ?l)
        (at ?st ?l) (at ?sp ?l) ;;(not (full ?st))
        )
    :effect (
        and (in ?sp ?st) (not (at ?sp ?l)) ;;(full ?st)
        )
    )
;; Same for medium truck but mediumpacket
(:action loadmed
    :parameters (?mp ?mt ?l)
    :precondition (
        and (mediumpacket ?mp) (medtruck ?mt) (location ?l)
        (at ?mt ?l)  (at ?mp ?l) ;;(not (full ?mt))
        )
    :effect (
       and (in ?mp ?mt) (not (at ?mp ?l));; (full ?mt)
       )
    )
;; Same for big truck but bigpacket
(:action loadbig
    :parameters (?bp ?bt ?l)
    :precondition (
        and (bigpacket ?bp) (bigtruck ?bt) (location ?l)
        (at ?bt ?l) (at ?bp ?l) ;;(not (full ?bt))
        )
    :effect (
        and (in ?bp ?bt) (not (at ?bp ?l)) ;;(full ?bt)
        )
    )
;; airplane,train and truck can have all sizes
(:action load
    :parameters (?o ?v ?l)
    :precondition (
        and (object ?o) (vehicle ?v) (location ?l) (not (spectruck ?v)) 
        (at ?v ?l) (at ?o ?l) ;;(not (full ?v))
        )
    :effect (
        and (in ?o ?v) (not (in ?o ?l)) ;;(full ?v)
        )
    )

(:action unload
    :parameters (?o ?v ?l)
    :precondition (
        and (object ?o) (vehicle ?v) (location ?l)
        (at ?v ?l)  (in ?o ?v)
        )
    :effect (
        and (at ?o ?l) (not (in ?o ?v)) ;;(not (full ?v))
        )
    )

;; Drive a truck between two locations in the same city.
;; By declaring all locations, including airports, to be of type
;; "location", we can use only one driving operator (otherwise,
  ;; we would again need one for each case, i.e. one for from-location-
  ;; to-airport, one for from-location-to-location, etc. Very
  ;; unnecessay).
(:action drive
    :parameters (?t ?l1 ?l2 ?c)
    :precondition (and (or (spectruck ?t) (truck ?t)) (location ?l1) (location ?l2) (city ?c)
       (at ?t ?l1) (loc ?l1 ?c) (loc ?l2 ?c))
    :effect (and (at ?t ?l2) (not (at ?t ?l1))))

;; Fly an airplane between two airports.
(:action fly
    :parameters (?p ?a1 ?a2)
    :precondition (and (airplane ?p) (airport ?a1) (airport ?a2)
       (at ?p ?a1))
    :effect (and (at ?p ?a2) (not (at ?p ?a1))))


;; Train between two station
(:action go
	:parameters (?r ?s1 ?s2)
	:precondition (and (train ?r) (trainstation ?s1) (trainstation ?s2)
      (at ?r ?s1))
	:effect (and (at ?r ?s2) (not (at ?r ?s1))))
)


