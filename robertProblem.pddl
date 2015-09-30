
;; This is a small problem instance for the standard Logistics domain,
;; as defined in "logistic.pddl".

(define (problem Robert)
  (:domain logistics)
  (:objects
     cityA
     cityB
     cityC
     cityD
     cityE

     truckA
     truckB
     truckC
     truckD
     truckE

     airplane1

     train1

     officeA1 officeA2 officeA3
     officeB1 officeB2 officeB3 officeB4
     officeC1
     officeD1 officeD2 officeD3
     officeE1

     airportA
     airportB
     airportD
     airportE


     trainstationB
     trainstationC
     trainstationD

     packet1 packet2 packet3
     packet4 packet5
     packet6
     packet7
     packet8
     )
  (:init
     ;; Type declarations:
     (object packet1) (object packet2) (object packet3)
     (object packet4) (object packet5) (object packet6)
     (object packet7) (object packet8)

     ;; all vehicles must be declared as both "vehicle" and their
     ;; appropriate subtype,
     (vehicle truckA) (vehicle truckB) (vehicle truckC)
     (vehicle truckD) (vehicle truckE)
     (truck truckA) (truck truckB) (truck truckC)
     (truck truckD) (truck truckE)

     (vehicle airplane1)
     (airplane airplane1)

     (vehicle train1)
     (train train1)

     ;; likewise, airports must be declared both as "location" and as
     ;; the subtype "airport",
     (location officeA1) (location officeA2) (location officeA3) ;; 1
     (location officeB1) (location officeB2) (location officeB3) (location officeB4) ;; 2
     (location officeC1) ;; 3
     (location officeD1) (location officeD2) (location officeD3) ;; 4
     (location officeE1) ;; 5
     (location airportA) (location airportB) (location airportD) (location airportE)
     (location trainstationC) (location trainstationB) (location trainstationD)

     (airport airportA) (airport airportB) (airport airportD) (airport airportE)
     (trainstation trainstationC) (trainstation trainstationB) (trainstation trainstationD)
     (city cityA) (city cityB) (city cityC) (city cityD) (city cityE)

     ;; "loc" defines the topology of the problem,
     (loc officeA1 cityA) (loc officeA2 cityA) (loc officeA3 cityA) (loc airportA cityA)
     (loc officeB1 cityB) (loc officeB2 cityB) (loc officeB3 cityB) (loc officeB4 cityB) (loc airportB cityB) (loc trainstationB cityB)
     (loc officeC1 cityC) (loc trainstationC cityC)
     (loc officeD1 cityD) (loc officeD2 cityD) (loc officeD3 cityD) (loc trainstationD cityD)
     (loc officeE1 cityE) (loc airportE cityE)

     ;; The actual initial state of the problem, which specifies the
     ;; initial locations of all packages and all vehicles:
     (at packet1 officeA1)
     (at packet2 officeA2)
     (at packet3 officeA3)
     (at packet4 officeB1)
     (at packet5 officeB3)
     (at packet6 officeC1)
     (at packet7 officeD3)
     (at packet8 officeE1)

     (at truckA airportA)
     (at truckB trainstationB)
     (at truckC officeC1)
     (at truckD officeD1)
     (at truckE airportE)

     (at airplane1 airportD)

     (at train1 trainstationC)
     )

;; The goal is to have both packages delivered to their destinations:
(:goal (and
        (at packet1 officeC1)
        (at packet2 officeE1)
        (at packet3 officeD2)
        (at packet4 officeD3)
        (at packet5 officeC1)
        (at packet6 officeE1)
        (at packet7 officeB2)
        (at packet8 officeB1)))
)