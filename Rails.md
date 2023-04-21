#### Create schema.rb
```bash
bundle exec rake db:schema:dump
```

#### Load Database From Schema
```bash
bundle exec rake db:schema:load RAILS_ENV='test'
bundle exec rake db:migrate RAILS_ENV='test'
```
