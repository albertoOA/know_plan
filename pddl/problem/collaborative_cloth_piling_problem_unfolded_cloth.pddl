(define (problem piling)
	(:domain collaborative-cloth-piling)
	(:objects
		towel-01 towel-02 dish-towel-01  - garment
		towel dish-towel - garment-type
		pile-01 - pile
		human-01 - human
		robot-01 - robot
	)

	(:init
		(free-to-manipulate human-01)
		(not (free-to-manipulate robot-01))

		(different human-01 robot-01)
		(different robot-01 human-01)

		(= (manipulate-folded-time human-01) 1000)
		(= (manipulate-folded-time robot-01) 100)
		(= (place-unfolded-time human-01) 10)
		(= (place-unfolded-time robot-01) 1000)

		(= (current-number-of-garments-on-pile pile-01) 0)
		(= (target-number-of-garments-on-pile pile-01) 3)

		;; (is-classified-by towel-01 towel)
		;; (is-classified-by towel-02 towel)
		;; (is-classified-by dish-towel-01 dish-towel)

		(unfolded towel-01)
		(unfolded towel-02)
		(unfolded dish-towel-01)

		(grasped-by towel-01 robot-01)
		(not (graspable towel-01))
		(graspable towel-02)
		(graspable dish-towel-01)

		(graspable pile-01)

		(lifted towel-01)
		(supported towel-02)
		(supported dish-towel-01)

	)

	(:goal
		(and 
			(piled towel-01)
			(piled towel-02)
			(piled dish-towel-01)
			(on-pile towel-01 pile-01)
			(on-pile towel-02 pile-01)
			(on-pile dish-towel-01 pile-01)
			(grasped-by pile-01 human-01)
		)
	)
)
