Docker starter for Nginx + MySQL + Node + PHP

```
make prepare-dev
make up
```

README should be reworked regarding to Xdebug

https://blog.denisbondar.com/post/phpstorm_docker_xdebug

https://aggarwal-rohan17.medium.com/docker-build-arguments-and-environment-variables-1bdca0c0ef92


```
docker-compose --env-file ./config/.env.dev up 
docker-compose --env-file ./config/.env.prod up 
docker-compose --env-file ./config/.env.test up
```
