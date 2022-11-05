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
