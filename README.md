# README
## version
Rails 6.0.0.rc2  
Ruby 2.6.3  

## DB
PostgreSQL 11.4  

```
docker volume create --name volume_for_memotter_rails

docker run --name postgresql_for_memotter_rails -v volume_for_memotter_rails:/var/lib/postgresql/data -d -p 15432:5432 postgres:11.4

bundle exec rails db:create

bundle exec rails db:migrate
```
