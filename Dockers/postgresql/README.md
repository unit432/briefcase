Connect to Database: `psql -p 54320 -h localhost -U postgres`

See the logs: `docker logs -f my_postgres`
  
Create Database:  `docker exec -it my_postgres psql -U postgres -c "create database my_database"`
