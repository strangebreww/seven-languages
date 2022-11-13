Object fib_recur := method(num,
	if (num == 1 or num == 2, 1, fib_recur(num - 1) + fib_recur(num - 2))
)

Object fib_loop := method(num,
	prev := 0
	prevPrev := 0
	sum := 1

	for (i, 2, num,
		prevPrev = prev
		prev = sum
		sum = prev + prevPrev
	)

	sum
)

"Fibonacci recursive" println; for (i, 1, 8, fib_recur(i) println)
"Fibonacci loop" println; for (i, 1, 8, fib_loop(i) println)

Number division := Number getSlot("/")

Number / := method(divider,
	if (divider == 0, 0, self division(divider))
)

"Division" println;
(11 / 0) println
(11 / 2) println

arr := list(list(1, 2, 3), list(7))

Object arr_sum := method(arr,
	sum := 0

	for (i, 0, arr size - 1,
		for (j, 0, (arr at(i)) size - 1,
			sum = sum + (arr at(i)) at(j)
		)
	)

	sum
)

"2d array sum" println; arr_sum(arr) println

List myAverage := method(
	sum := 0

	for (i, 0, self size - 1,
		if (self at(i) type != "Number", Exception raise("item is not a number"))
		sum = sum + self at(i)
	)

	sum / self size
)

"List average" println; list(2, 8, 9) myAverage println

List2d := Object clone do (
	init := method(
    	self lists := list()
  	)
  
	dim := method(x, y,
		self lists preallocateToSize(y)
		for(i, 0, y - 1, self lists append(list() preallocateToSize(x)))
		self
	)

	set := method(x, y, value,
		self lists at(y) atInsert(x, value)
	)

	get := method(x, y,
		self lists at(y) at(x)
	)

	toFile := method(name,
    	File with(name) open write(self serialized) close
  	)
  
  	fromFile := method(name,
    	doRelativeFile(name)
  	) 
)

myList := List2d clone

myList dim(2, 3)

myList set(0, 0, "Q")
myList set(1, 0, "W")
myList set(0, 1, "E")
myList set(1, 1, "R")
myList set(0, 2, "T")
myList set(1, 2, "Y")

fileName := "list2d.txt"

myList toFile(fileName)

anotherList := List2d fromFile(fileName)

anotherList toFile("list2d_another.txt")

guessed := Random value(100) ceil

i := 0

while (i < 10,
	guess := File standardInput readLine("Enter your guess: ") asNumber
	if (
		guess == guessed,
		"Correct!" println; i = 10, 
		if (guess > guessed, "Lower" println, "Greater" println); i = i + 1
	)
)
