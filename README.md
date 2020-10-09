# A tiny PHP 7.4.11 container using multi-threaded PHP Built-in web server

This is a tiny container using the built-in PHP web server and utilizing its multi-thread support introduced in PHP 7.4.

Starts with `4` threads by default, but you can configure this by editing `docker-compose.yml` directly, or by creating a `docker-compose.override.yml` file and setting the environment `PHP_CLI_SERVER_WORKERS` appropriately.

### Available images

This image comes in two flavors:

#### latest

Alpine + PHP (No extensions). 💪 Image size: 5.5 MB 

```
docker pull khromov/pico-php:latest
```

#### chonky

Alpine + PHP + Composer + WP-CLI + Popular PHP extensions for running Laravel, WordPress and more. 🍔 Image size: 26 MB

```
docker pull khromov/pico-php:chonky
```

### Run with Docker and mount local folder inside container

```
docker run -p 4000:4000 -v /Users/admin/Documents/webroot:/var/www/ khromov/pico-php:latest
```

Server will be available at http://localhost:4000/

#### Security notice

According to the [PHP Documentation](https://www.php.net/manual/en/features.commandline.webserver.php), the built-in server _"...is not intended to be a full-featured web server. It should not be used on a public network."_ 

It is therefore recommended to use this image either as a development environment or behind additional levels of security (Behind basic auth, on an intranet, etc.)

### Run with docker-compose

If you want to use this as a local PHP environment, start by checking out the [GitHub repo](https://github.com/khromov/docker-pico-php)

Start the container using Docker Compose:

```
docker-compose up
```

Go to: http://localhost:4000/

`webroot/` will be mounted inside the container for easy development.

### Build and run manually

```
docker build . -t pico-php
```

This will bake the files from `webroot/` into your image.

Run manually

```
docker run -p 4000:4000 pico-php
```

Now you can visit http://localhost:4000/ to see your build in action!

# Use in your application:

Either start from existing image and add your project files and dependencies:

```
FROM khromov/pico-php:latest
# ...your changes.
```

Or fork this image and use the included GitHub workflow to publish it yourself.
