* `operator /` always returns a float. Using `div` and `rem` functions to do integer division or get the division remainder.
* use `is_integer/1`, `is_float/1` or `is_number/1` to check if an argument is an integer, a float, or either.
* `Atoms` is a constant whose value is its own name.
* `false`, `true` and `nil` are atoms. Elixir allows you to skip the leading `:`.
* use the `i/1` to retrieve information about a variable in IEx.
* Single quotes are charlists, double quotes are strings. 
* `'hello' == "hello"` => false
* number < atom < reference < function < port < pid < tuple < map < list < bitstring


### Anonymous functions
* `add = fn a, b -> a + b end`
* `add.(1, 2)`       => 3
* `is_function(add)` => true

### Tuples
* `{:ok, "hello"}`
* `tuple_size {:ok, "hello"}` => 2
* `elem(tuple, 1)` => "hello"
* `put_elem(tuple, 1, "world")` => {:ok, "world"}
* Tuples are stored contiguously in memory. Getting size or accessing an element is fast. But, updating or addinng element is expensive.

### List
* list = [1, 2, 3]
* List are stored as linked lists. 
* [1, 2, 3] ++ [4, 5, 6] => [1, 2, 3, 4, 5, 6]
* [1, 3, 2] -- [2] => [1, 3]


### IEX
* run `iex` to start console
* `Ctrl-C` to exit console
*  `h round/1` in console to access documentation
