
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
   (object packet7) (object packet8) (object packet9)

   (smallpacket packet1) (smallpacket packet2) (smallpacket packet3)
   (mediumpacket packet4) (mediumpacket packet5) (mediumpacket packet6)
   (bigpacket packet7) (bigpacket packet8) (bigpacket packet9)

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

   (airport airportA) (airport airportB) (airport airportC)
   (trainstation trainstationD) (trainstation trainstationE)
   (city cityA) (city cityB) (city cityC) (city cityD) (city cityE)

   (city hubS) (city hubM) (city hubB)

   ;; "loc" defines the topology of the problem,
   (loc officeA1 cityA) (loc officeA2 cityA) (loc officeA3 cityA) (loc airportA cityA)
   (loc officeB1 cityB) (loc officeB2 cityB) (loc officeB3 cityB) (loc officeB4 cityB) (loc airportB cityB)
   (loc officeC1 cityC) (loc airportC cityC)

   (loc officeD1 cityD) (loc officeD2 cityD) (loc officeD3 cityD) (loc trainstationD cityD)
   (loc officeE1 cityE) (loc treinstationE cityE)

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
   (at packet9 officeE4)

   (at truckA airportA)
   (at truckB officeB3)
   (at truckC officeC1)
   (at truckD officeD1)
   (at truckE trinstationE)

   (at airplane1 airportD)

   (at train1 trainstationD)

   (at truckHS hubS)
   (at truckHM hubM)
   (at truckHB hubB)
   )

;; The goal is to have both packages delivered to their destinations:
(:goal
    (and(at packet1 officeC1)
        (at packet2 officeE1)
        (at packet3 officeD2)
        (at packet4 officeD3)
        (at packet5 officeC1)
        (at packet6 officeE1)
        (at packet7 officeB2)
        (at packet8 officeB1)
        (at packet9 officeA1)))
)