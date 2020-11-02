* `iex` to run console
* `operator /` always returns a float. Using `div` and `rem` functions to do integer division or get the division remainder.
*  `h round/1` in console to access documentation
* use `is_integer/1`, `is_float/1` or `is_number/1` to check if an argument is an integer, a float, or either.
* `Atoms` is a constant whose value is its own name.
* `false`, `true` and `nil` are atoms. Elixir allows you to skip the leading `:`.

### Anonymous functions
* `add = fn a, b -> a + b end`
* `add.(1, 2)`       => 3
* `is_function(add)` => true


* Single quotes are charlists, double quotes are strings. 
* `'hello' == "hello"` => false
