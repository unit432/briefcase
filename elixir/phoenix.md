## install the Phoenix application generator
``` bash
mix archive.install hex phx_new
```


We are almost there! The following steps are missing:                                                                                                                                                                                                                         
                                                                   
    $ cd van_school_ranking                                                                                                            
    $ cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development                                          
                                                                                                                                       
Then configure your database in config/dev.exs and run:                                                                                
                                                                   
    $ mix ecto.create                                                                                                                  
                                                                                                                                       
Start your Phoenix app with:                                                                                                           
                                                                                                                                       
    $ mix phx.server                                  
                                                                   
You can also run your app inside IEx (Interactive Elixir) as:
                                                                                                                                       
    $ iex -S mix phx.server  
