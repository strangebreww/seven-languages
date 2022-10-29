# run: "io day1.io description"

Vehicle := Object clone
Vehicle description := "Something to take you places"

Car := Vehicle clone
Car description := method("Something to take you far away" println)

Car getSlot(System args at(1)) call
