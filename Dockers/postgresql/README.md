Run PostgreSQL: `docker logs -f postgresql`

Connect to Database: `psql -p 54320 -h localhost -U postgres` or `docker exec -it postgresql psql -U postgres`

See the logs: `docker logs -f postgresql`
  
Create Database:  `docker exec -it postgresql psql -U postgres -c "create database test_database"`
