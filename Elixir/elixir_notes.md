* `operator /` always returns a float. Using `div` and `rem` functions to do integer division or get the division remainder.
* use `is_integer/1`, `is_float/1` or `is_number/1` to check if an argument is an integer, a float, or either.
* `Atoms` is a constant whose value is its own name.
* `false`, `true` and `nil` are atoms. Elixir allows you to skip the leading `:`.
* use the `i/1` to retrieve information about a variable in IEx.
* Single quotes are charlists, double quotes are strings. 
* `'hello' == "hello"` => false
* number < atom < reference < function < port < pid < tuple < map < list < bitstring
* String (binary) concatenation uses the <> operator but charlists, lists, use list concatenation operator ++:
* `<<>>` binary / bitstring constructor


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
* `list = [1, 2, 3]`
* List are stored as linked lists. 
* `[1, 2, 3] ++ [4, 5, 6]` => [1, 2, 3, 4, 5, 6]
* `[1, 3, 2] -- [2]` => [1, 3]


### IEX
* run `iex` to start console
* `Ctrl-C` to exit console
*  `h round/1` in console to access documentation

### The match operator (=)
* `{:ok, result} = {:ok, 13}` asserts that the left side will only match the right side when the right side is a tuple that starts with the atom :ok

### The pin operator (^)
* to pattern match against a variable’s existing value rather than rebinding the variable.

### Maps
* `map = %{:a => 12, 2 => :b}`
* `map[:a]` => 12 
* `map.a` => 12
* `%{map | 2 => "two"}` => %{2 => "two", :a => 1} 

### do/end blocks
* `if false, do: :this, else: :that` => :that

### Function capturing
* `fun = &(&1 + 1)` &1 represents the first argument passed into the function. `fun.(1)` => 2

### Default arguments
  ```elixir  
  def dowork(x \\ "hello") do
    x
  end
  ```
### Recursion
```elixir
defmodule Fibonacci do 
  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n-1) + fib(n-2) end
end
```
### Enumerables and Streams
* `|>` pipe operator. 
* `1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum` => 7515007500
* `1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum` => 7500000000
* streams can be very useful for handling large files or even slow resources like network resources.

### Processes
* Processes are isolated from each other, run concurrent to one another and communicate via message passing.
* `pid = spawn fn -> 1 + 2 end`
* `Process.alive?(pid)` => false

#### `send` and `receive`
```elixir
receive do
  {:hello, msg}  -> msg
after
  1_000 -> "nothing after 1s"
end
```
#### Links
`spawn_link fn -> raise "oops" end`

#### Tasks
#### State
### IO and the file system
#### IO module
* `IO.puts("hello world")`
* `IO.gets("yes or no? ")`
* `IO.puts(:stderr, "hello world")`

#### File module
* `File.read/1` vs `File.read!/1`. The version with ! returns the contents of the file instead of a tuple, and if anything goes wrong the function raises an error. The version without ! is preferred when you want to handle different outcomes using pattern matching

### alias, require, and import
#### alias
* `alias Math.List, as: List`
* `alias MyApp.{Foo, Bar, Baz}`
* `alias Math.List` is the same as `alias Math.List as List`
* `alias` is lexically scoped, which allows you to set aliases inside specific functions.

#### require
* `require` is lexically

#### import
* `import` is lexically
* `import List, only: [duplicate: 2]`
* `import List, except: [duplicate: 2]`
* `import`ing a module automatically requires it.

#### use


### Module attributes
#### As annotations
```elixir
defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

      iex> Math.sum(1, 2)
      3

  """

  @doc """
  Calculates the sum of two numbers.
  """
  def sum(a, b), do: a + b
end
```

#### As “constants”
``` elixir
defmodule MyServer do
  @my_data 14
  def first_data, do: @my_data
  @my_data 13
  def second_data, do: @my_data
end

MyServer.first_data #=> 14
MyServer.second_data #=> 13
```
#### As temporary storage

### Structs
* Structs **only** take the name of the module they’re defined in. 
``` elixir
iex> defmodule User do
...>   defstruct name: "John", age: 27
...> end
```

* enforce that certain keys
``` elixir
iex> defmodule Car do
...>   @enforce_keys [:make]
...>   defstruct [:model, :make]
...> end
iex> %Car{}
** (ArgumentError) the following keys must also be given when building struct 
Car: [:make]
    expanding struct: Car.__struct__/1
``` 

### Protocols
* a mechanism to achieve polymorphism
``` elixir
defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end

defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end
```
### Comprehensions
* A comprehension is made of three parts: generators, filters, and collectables. Example: `for n <- [1, 2, 3, 4], do: n * n`

### Sigils
#### Regular expressions
#### Strings, char lists, and word lists sigils
#### Calendar sigils
* `d = ~D[2019-10-31]`
* `~T[23:00:07.0]`

### try, catch, and rescue
* The `after` clause will be executed regardless of whether or not the tried block succeeds.
* Elixir will automatically wrap the function body in a `try` whenever one of `after`, `rescue` or `catch` is specified.

