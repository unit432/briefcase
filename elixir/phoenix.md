## install the Phoenix application generator
``` bash
mix archive.install hex phx_new
```
## setup new app

1. create new application
```
mix phx.new hello_world
```

2. change directory
```
cd van_school_ranking
```

3. configure database
```
mix ecto.create
```

4. start app
```
mix phx.server
```

4. OR run your app inside IEx (Interactive Elixir)
```
iex -S mix phx.server
```
