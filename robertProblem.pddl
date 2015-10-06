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

     hubS
     hubM
     hubB

     truckHS
     truckHM
     truckHB

     airplane1

     train1

     officeA1 officeA2 officeA3 officeA4
     officeB1 officeB2 officeB3 officeB4
     officeC1 officeC2 officeC3 officeC4
     officeD1 officeD2 officeD3 officeD4
     officeE1 officeE2 officeE3 officeE4

     airportA
     airportB
     airportC

     airportHS
     airportHM
     airportHB

     trainstationHS
     trainstationHM
     trainstationHB

     trainstationD
     trainstationE

     packet1
     packet2
     packet3
     packet4
     packet5
     packet6
     packet7
     packet8
     packet9
     packet10
     packet11
     packet12
     packet13
     packet14
     packet15
     packet16
     packet17
     packet18
     packet19
     packet20
     packet21
     )

  (:init
     ;; Type declarations:
     (object packet1) (object packet2) (object packet3)
     (object packet4) (object packet5) (object packet6)
     (object packet7) (object packet8) (object packet9)
     (object packet10) (object packet11) (object packet12)
     (object packet13) (object packet14) (object packet15)
     (object packet16) (object packet17) (object packet18)
     (object packet19) (object packet20) (object packet21)

     (smallpacket packet1) (smallpacket packet2) (smallpacket packet3)
     (smallpacket packet4) (smallpacket packet5) (smallpacket packet6)
     (smallpacket packet7)

     (mediumpacket packet8) (mediumpacket packet9) (mediumpacket packet10)
     (mediumpacket packet11) (mediumpacket packet12) (mediumpacket packet13)
     (mediumpacket packet14)

     (bigpacket packet15) (bigpacket packet16) (bigpacket packet17)
     (bigpacket packet18) (bigpacket packet19) (bigpacket packet20)
     (bigpacket packet21)

     ;; all vehicles must be declared as both "vehicle" and their
     ;; appropriate subtype,
     (vehicle truckA)
     (truck truckA)

     (vehicle truckB)
     (truck truckB)

     (vehicle truckC)
     (truck truckC)

     (vehicle truckD)
     (truck truckD)

     (vehicle truckE)
     (truck truckE)

     (vehicle truckHS)
     (vehicle truckHM)
     (vehicle truckHB)
     (spectruck truckHS)
     (spectruck truckHM)
     (spectruck truckHB)
     (smalltruck truckHS)
     (medtruck truckHM)
     (bigtruck truckHB)

     (vehicle airplane1)
     (airplane airplane1)

     (vehicle train1)
     (train train1)

     ;; likewise, airports must be declared both as "location" and as
     ;; the subtype "airport",
     (location officeA1) (location officeA2) (location officeA3) (location officeA4);; 1
     (location officeB1) (location officeB2) (location officeB3) (location officeB4) ;; 2
     (location officeC1) (location officeC2) (location officeC3) (location officeC4);; 3
     (location officeD1) (location officeD2) (location officeD3) (location officeD4);; 4
     (location officeE1) (location officeE2) (location officeE3) (location officeE4);; 5

     (location airportA) (location airportB) (location airportC)
     (location trainstationD) (location trainstationE)

     (location airportHS) (location airportHM) (location airportHB)
     (location trainstationHS) (location trainstationHM) (location trainstationHB)

     (airport airportHS) (airport airportHM) (airport airportHB)
     (trainstation trainstationHS) (trainstation trainstationHM) (trainstation trainstationHB)


     (airport airportA) (airport airportB) (airport airportC)
     (trainstation trainstationD) (trainstation trainstationE)

     (city cityA) (city cityB) (city cityC) (city cityD) (city cityE)

     (city hubS) (city hubM) (city hubB)

     ;; "loc" defines the topology of the problem,
     (loc officeA1 cityA) (loc officeA2 cityA) (loc officeA3 cityA) (loc officeA4 cityA) (loc airportA cityA)
     (loc officeB1 cityB) (loc officeB2 cityB) (loc officeB3 cityB) (loc officeB4 cityB) (loc airportB cityB)
     (loc officeC1 cityC) (loc officeC1 cityC) (loc officeC3 cityC) (loc officeC4 cityC) (loc airportC cityC)

     (loc officeD1 cityD) (loc officeD2 cityD) (loc officeD3 cityD) (loc officeD4 cityA) (loc trainstationD cityD)

     (loc officeE1 cityE) (loc officeE2 cityA) (loc officeE3 cityA) (loc officeE4 cityA)(loc trainstationE cityE)

     (loc trainstationHS hubS) (loc airportHS hubS) (loc truckHS hubS)
     (loc trainstationHM hubM) (loc airportHM hubM) (loc truckHM hubM)
     (loc trainstationHB hubB) (loc airportHB hubB) (loc truckHB hubB)

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
     (at packet9 officeE2)
     (at packet10 officeE1)
     (at packet11 officeA2)
     (at packet12 officeE3)
     (at packet13 officeB4)
     (at packet14 officeE1)
     (at packet15 officeE4)
     (at packet16 officeB3)
     (at packet17 officeB2)
     (at packet18 officeE3)
     (at packet19 officeD4)
     (at packet20 officeC3)
     (at packet21 officeA1)


     (at truckA airportA)
     (at truckB officeB3)
     (at truckC officeC1)
     (at truckD officeD1)
     (at truckE trainstationE)

     (at airplane1 airportA)

     (at train1 trainstationD)

     (at truckHS airportHS)
     (at truckHM trainstationHM)
     (at truckHB airportHB)
     )

;; The goal is to have both packages delivered to their destinations:
(:goal
    (and
        (at packet1 officeC1)
        ;;(at packet2 officeE1)
        ;;(at packet3 officeD2)
        ;;(at packet4 officeD3)
        ;;(at packet5 officeC1)
        ;;(at packet6 officeE1)
        ;;(at packet7 officeB2)
        ;;(at packet8 officeB1)
        ;;(at packet9 officeA1)
        ;;(at packet10 officeE1)
        ;;(at packet11 officeE3)
        ;;(at packet12 officeA4)
        ;;(at packet13 officeB3)
        ;;(at packet14 officeC2)
        ;;(at packet15 officeB2)
        ;;(at packet16 officeE3)
        ;;(at packet17 officeC2)
        ;;(at packet18 officeA3)
        ;;(at packet19 officeE2)
        ;;(at packet20 officeD2)
        ;;(at packet21 officeC1)

        ))
)

